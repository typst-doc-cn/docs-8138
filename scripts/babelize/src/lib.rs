use std::fmt::Write;
use typst_syntax::{SyntaxKind, SyntaxNode, parse};
#[cfg(target_arch = "wasm32")]
use wasm_minimal_protocol::{initiate_protocol, wasm_func};

#[cfg(target_arch = "wasm32")]
initiate_protocol!();

#[derive(Debug)]
pub enum BabelizeError {
    ParseError(String),
    WriteError(std::fmt::Error),
}

impl From<std::fmt::Error> for BabelizeError {
    fn from(err: std::fmt::Error) -> Self {
        BabelizeError::WriteError(err)
    }
}

fn dump_pars(output: &mut String, pars: &mut Vec<&SyntaxNode>) -> Result<(), BabelizeError> {
    let mut pars = pars.drain(..).peekable();

    // Dump preceding spaces.
    while let Some(space) =
        pars.next_if(|space| matches!(space.kind(), SyntaxKind::Parbreak | SyntaxKind::Space))
    {
        write!(output, "{}", space.full_text())?;
    }

    // If all children are spaces, finish.
    if pars.peek().is_none() {
        return Ok(());
    }

    let mut last_spaces = vec![];

    write!(output, "#babel(\n  en: [\n")?;
    for par in pars {
        match par.kind() {
            SyntaxKind::Parbreak | SyntaxKind::Space => {
                last_spaces.push(par);
            }
            _ => {
                for space in last_spaces.drain(..) {
                    write!(output, "{}", space.full_text())?;
                }
                write!(output, "{}", par.full_text())?;
            }
        }
    }
    write!(output, "\n  ],\n)")?;

    // Dump trailing spaces.
    for space in last_spaces.drain(..) {
        write!(output, "{}", space.full_text())?;
    }

    Ok(())
}

fn babelize_heading(heading: &SyntaxNode, label: &SyntaxNode) -> Result<String, BabelizeError> {
    let mut heading = heading.children().peekable();

    let Some(marker) = heading.next_if(|marker| marker.kind() == SyntaxKind::HeadingMarker) else {
        return Err(BabelizeError::ParseError(format!(
            "expect Heading to start with HeadingMarker, but got {:#?}",
            heading
        )));
    };

    if heading
        .next_if(|space| space.kind() == SyntaxKind::Space)
        .is_none()
    {
        return Err(BabelizeError::ParseError(format!(
            "expect a Space after HeadingMarker, but got {:#?}",
            heading
        )));
    }

    let Some(body) = heading.next_if(|body| body.kind() == SyntaxKind::Markup) else {
        return Err(BabelizeError::ParseError(format!(
            "expect a body in Heading, but got {:#?}",
            heading
        )));
    };

    if heading.next().is_some() {
        return Err(BabelizeError::ParseError(format!(
            "expect the Heading to end with its body, but got {:#?}",
            heading
        )));
    }

    Ok(
        if body
            .children()
            .next()
            .expect("heading's body should be non-empty")
            .kind()
            == SyntaxKind::Hash
        {
            // Prefer `babel(en: short-or-long[…])` over `babel(en: [#short-or-long[…]])`.
            format!(
                "{} #babel(en: {}) {}\n",
                marker.full_text(),
                body.full_text()
                    .strip_prefix("#")
                    .expect("SyntaxKind::Hash should start with `#`"),
                label.full_text()
            )
        } else {
            format!(
                "{} #babel(en: [{}]) {}\n",
                marker.full_text(),
                body.full_text(),
                label.full_text()
            )
        },
    )
}

/// Check if a `SyntaxNode::Raw` is a raw block.
fn is_raw_block(raw: &SyntaxNode) -> bool {
    raw.children()
        .any(|c| c.kind() == SyntaxKind::RawTrimmed && c.leaf_text() == "\n")
}

/// Wrap localizable texts with the `babel` function.
///
/// Assume the input to be in markup mode, and the output will be in code mode.
pub fn babelize(markup: &str) -> Result<String, BabelizeError> {
    let root = parse(markup.trim());
    let mut children = root.children().peekable();

    // Whether we have seen any complex structures that requires `[ #babel(…) … ]` instead of just `babel(…)`.
    let mut seen_complex = false;

    // The output to be used if `seen_complex` at last.
    let mut output = String::new();
    writeln!(output, "[")?;

    // Regular paragraphs to be dumped
    let mut pars = vec![];

    while let Some(child) = children.next() {
        match child.kind() {
            SyntaxKind::Heading => {
                seen_complex = true;
                dump_pars(&mut output, &mut pars)?;

                if children
                    .next_if(|c| c.kind() == SyntaxKind::Space)
                    .is_none()
                {
                    return Err(BabelizeError::ParseError(format!(
                        "expect a Space after Heading, but got {:#?}",
                        children.peek(),
                    )));
                };

                let Some(label) = children.next_if(|c| c.kind() == SyntaxKind::Label) else {
                    return Err(BabelizeError::ParseError(format!(
                        "expect a Label after Heading, but got {:#?}",
                        children.peek()
                    )));
                };

                // Space and Parbreak after Heading are treated equally.
                // The call to `babel` spans multiple lines, so it looks better if there is no empty lines between the heading and the call.
                if children
                    .next_if(|c| matches!(c.kind(), SyntaxKind::Space | SyntaxKind::Parbreak))
                    .is_none()
                {
                    return Err(BabelizeError::ParseError(format!(
                        "expect a Space or Parbreak after the Heading's Label, but got {:#?}",
                        children.peek(),
                    )));
                };

                write!(output, "{}", babelize_heading(child, label)?)?;
            }
            SyntaxKind::Hash => {
                let Some(arm) = children
                    .next_if(|c| matches!(c.kind(), SyntaxKind::FuncCall | SyntaxKind::LetBinding))
                else {
                    return Err(BabelizeError::ParseError(format!(
                        "Expected FuncCall or LetBinding after the Hash, got {:#?}",
                        children.peek()
                    )));
                };

                // If not localizable, dump it as-is.
                // Otherwise, treat as regular paragraphs.
                if children
                    .peek()
                    // An `arm` that occupies dedicated lines (e.g., `docs-table`) is unlikely to be localizable.
                    .is_none_or(|s| s.kind() == SyntaxKind::Parbreak)
                    // `#info[…]` is localizable.
                    && !(arm.kind() == SyntaxKind::FuncCall && arm.full_text().starts_with("info["))
                {
                    seen_complex = true;
                    dump_pars(&mut output, &mut pars)?;
                    write!(output, "{}{}", child.full_text(), arm.full_text())?;
                } else {
                    pars.push(child);
                    pars.push(arm);
                }
            }
            SyntaxKind::Raw if is_raw_block(child) => {
                seen_complex = true;
                dump_pars(&mut output, &mut pars)?;

                write!(output, "{}", child.full_text())?;
            }
            _ => {
                pars.push(child);
            }
        }
    }

    if !seen_complex {
        // Use the simpler `babel(…)` instead of `[ #babel(…) … ]`.
        return Ok(format!("babel(\n  en: [\n{}\n  ],\n)", root.full_text()));
    }

    dump_pars(&mut output, &mut pars)?;

    write!(output, "\n]")?;

    Ok(output)
}

/// Wrapper of [`babelize`] to be used as a Typst plugin.
#[cfg_attr(target_arch = "wasm32", wasm_func)]
pub fn babelize_bytes(input: &[u8]) -> Result<Vec<u8>, String> {
    let input = std::str::from_utf8(input).map_err(|err| format!("invalid UTF-8 input: {err}"))?;
    Ok(babelize(input)
        .map_err(|err| format!("error: {err:#?}\ninput:\n{input}"))?
        .into_bytes())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn assert_babelize(input: &str, expected: &str) {
        let actual = babelize(input).unwrap();
        assert_eq!(
            actual.trim(),
            expected.trim(),
            "\n\n=== Input ===\n{}\n\n=== Expected output ===\n{}\n\n=== Actual output ===\n{}",
            input.trim(),
            expected.trim(),
            actual.trim()
        );
    }

    #[test]
    fn test_live() {
        assert_babelize(
            r#"
Captured `arguments` to a function.

Arguments are either ... @arguments.at[`at`] methods.

= Argument Sinks <argument-sinks>
Like built-in functions...

```example
#let foo = "bar"
```

= Spreading <spreading>
Inversely to an argument sink...

```example
#let dict = (fill: blue)
```
"#,
            r#"
[
#babel(
  en: [
Captured `arguments` to a function.

Arguments are either ... @arguments.at[`at`] methods.
  ],
)

= #babel(en: [Argument Sinks]) <argument-sinks>
#babel(
  en: [
Like built-in functions...
  ],
)

```example
#let foo = "bar"
```

= #babel(en: [Spreading]) <spreading>
#babel(
  en: [
Inversely to an argument sink...
  ],
)

```example
#let dict = (fill: blue)
```
]
"#,
        );
        assert_babelize(
            r#"
Construct spreadable arguments in place.

This function behaves like `{let args(..sink) = sink}`.

```example
#let args = arguments(stroke: red, inset: 1em, [Body])
#box(..args)
```
"#,
            r#"
[
#babel(
  en: [
Construct spreadable arguments in place.

This function behaves like `{let args(..sink) = sink}`.
  ],
)

```example
#let args = arguments(stroke: red, inset: 1em, [Body])
#box(..args)
```
]
"#,
        );

        assert_babelize(
            r#"The arguments to construct."#,
            r#"
babel(
  en: [
The arguments to construct.
  ],
)"#,
        );
        assert_babelize(
            r#"
Reads structured data from a CBOR file...

= #short-or-long[Conversion][Conversion details] <conversion>
#docs-table(
  table.header[Typst value][Converted into CBOR],
  [types that can be converted from CBOR],
  [corresponding CBOR value],
)

== Notes <notes>
- Be aware that CBOR integers ... value.

- The `repr` function ... Typst versions.
"#,
            r#"
[
#babel(
  en: [
Reads structured data from a CBOR file...
  ],
)

= #babel(en: short-or-long[Conversion][Conversion details]) <conversion>
#docs-table(
  table.header[Typst value][Converted into CBOR],
  [types that can be converted from CBOR],
  [corresponding CBOR value],
)

== #babel(en: [Notes]) <notes>
#babel(
  en: [
- Be aware that CBOR integers ... value.

- The `repr` function ... Typst versions.
  ],
)
]
"#,
        );
        assert_babelize(
            r#"
An integer: a positive whole number, a negative whole number, or zero.

#let wiki(name, body) = link("https://en.wikipedia.org/wiki/" + name, body)

Typst stores signed integers with the #wiki("Two%27s_complement")[two's
complement] representation in 64 bits. 
"#,
            r#"
[
#babel(
  en: [
An integer: a positive whole number, a negative whole number, or zero.
  ],
)

#let wiki(name, body) = link("https://en.wikipedia.org/wiki/" + name, body)

#babel(
  en: [
Typst stores signed integers with the #wiki("Two%27s_complement")[two's
complement] representation in 64 bits.
  ],
)
]
"#,
        );
        assert_babelize(
            r#"
= Space <space>
Lorem ipsum.

= Parbreak <parbreak>

Lorem ipsum.
"#,
            r#"
[
= #babel(en: [Space]) <space>
#babel(
  en: [
Lorem ipsum.
  ],
)

= #babel(en: [Parbreak]) <parbreak>
#babel(
  en: [
Lorem ipsum.
  ],
)
]
"#,
        );
        assert_babelize(
            r#"
Typst's bundle export format (experimental).

#info[
  Bundle export is only available...
]

With Typst's bundle export...
"#,
            r#"
babel(
  en: [
Typst's bundle export format (experimental).

#info[
  Bundle export is only available...
]

With Typst's bundle export...
  ],
)
"#,
        );
        assert_babelize(
            r#"
The raw text.

#example(
  title: "Implementing a DSL using raw and show rules",
  ````
  // Parse numbers in raw blocks with the
  // `mydsl` tag and sum them up.
  #show raw.where(lang: "mydsl"): it => {
  let sum = 0
  for part in it.text.split("+") {
      sum += int(part.trim())
  }
  sum
  }

  ```mydsl
  1 + 2 + 3 + 4 + 5
  ```
  ````,
)
            "#,
            r#"
[
#babel(
  en: [
The raw text.
  ],
)

#example(
  title: "Implementing a DSL using raw and show rules",
  ````
  // Parse numbers in raw blocks with the
  // `mydsl` tag and sum them up.
  #show raw.where(lang: "mydsl"): it => {
  let sum = 0
  for part in it.text.split("+") {
      sum += int(part.trim())
  }
  sum
  }

  ```mydsl
  1 + 2 + 3 + 4 + 5
  ```
  ````,
)
]
"#,
        );
    }
}
