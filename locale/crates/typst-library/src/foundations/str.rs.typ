#import "/i18n-scope.typ": *
#let live-item-data = (
  "Str": (
    36,
    babel(
      en: [
        A sequence of Unicode codepoints.

        You can iterate over the grapheme clusters of the string using a
        @reference:scripting:loops[for loop]. Grapheme clusters are basically
        characters but keep together things that belong together, e.g. multiple
        codepoints that together form a flag emoji. Strings can be added with the
        `+` operator, @reference:scripting:blocks[joined together] and multiplied
        with integers.

        Typst provides utility methods for string manipulation. Many of these
        methods (e.g., @str.split[`split`], @str.trim[`trim`] and
        @str.replace[`replace`]) operate on _patterns:_ A pattern can be either a
        string or a @regex[regular expression]. This makes the methods quite
        versatile.

        All lengths and indices are expressed in terms of UTF-8 bytes. Indices are
        zero-based and negative indices wrap around to the end of the string.

        You can convert a value to a string with the `str` constructor.

        = Example <example>
        ```example
        #"hello world!" \
        #"\"hello\n  world\"!" \
        #"1 2 3".split() \
        #"1,2;3".split(regex("[,;]")) \
        #(regex("\\d+") in "ten euros") \
        #(regex("\\d+") in "10 euros")
        ```

        = #short-or-long[Escapes][Escape sequences] <escapes>
        Just like in markup, you can escape a few symbols in strings:
        - `[\\]` for a backslash
        - `[\"]` for a quote
        - `[\n]` for a newline
        - `[\r]` for a carriage return
        - `[\t]` for a tab
        - `[\u{1f600}]` for a hexadecimal Unicode escape sequence
      ],
    ),
  ),
  "Str::construct": (
    131,
    babel(
      en: [
        Converts a value to a string.

        - Integers are formatted in base 10. This can be overridden with the
          optional `base` parameter.
        - Floats are formatted in base 10 and never in exponential notation.
        - Negative integers and floats are formatted with the Unicode minus sign
          ("−" U+2212) instead of the ASCII minus sign ("-" U+002D).
        - From labels the name is extracted.
        - Bytes are decoded as UTF-8.

        If you wish to convert from and to Unicode code points, see the
        @str.to-unicode[`to-unicode`] and @str.from-unicode[`from-unicode`]
        functions.

        ```example
        #str(10) \
        #str(4000, base: 16) \
        #str(2.7) \
        #str(1e8) \
        #str(<intro>)
        ```
      ],
    ),
  ),
  "Str::construct::value": (
    154,
    babel(
      en: [
        The value that should be converted to a string.
      ],
    ),
  ),
  "Str::construct::base": (
    156,
    babel(
      en: [
        The base (radix) to display integers in, between 2 and 36.
      ],
    ),
  ),
  "Str::len": (
    184,
    babel(
      en: [
        The length of the string in UTF-8 encoded bytes.
      ],
    ),
  ),
  "Str::first": (
    190,
    babel(
      en: [
        Extracts the first grapheme cluster of the string.

        Returns the provided default value if the string is empty or fails with
        an error if no default value was specified.
      ],
    ),
  ),
  "Str::first::default": (
    197,
    babel(
      en: [
        A default value to return if the string is empty.
      ],
    ),
  ),
  "Str::last": (
    209,
    babel(
      en: [
        Extracts the last grapheme cluster of the string.

        Returns the provided default value if the string is empty or fails with
        an error if no default value was specified.
      ],
    ),
  ),
  "Str::last::default": (
    216,
    babel(
      en: [
        A default value to return if the string is empty.
      ],
    ),
  ),
  "Str::at": (
    228,
    babel(
      en: [
        Extracts the first grapheme cluster after the specified index. Returns
        the default value if the index is out of bounds or fails with an error
        if no default value was specified.
      ],
    ),
  ),
  "Str::at::index": (
    234,
    babel(
      en: [
        The byte index. If negative, indexes from the back.
      ],
    ),
  ),
  "Str::at::default": (
    236,
    babel(
      en: [
        A default value to return if the index is out of bounds.
      ],
    ),
  ),
  "Str::slice": (
    247,
    babel(
      en: [
        Extracts a substring of the string. Fails with an error if the start or
        end index is out of bounds.
      ],
    ),
  ),
  "Str::slice::start": (
    252,
    babel(
      en: [
        The start byte index (inclusive). If negative, indexes from the
        back.
      ],
    ),
  ),
  "Str::slice::end": (
    255,
    babel(
      en: [
        The end byte index (exclusive). If omitted, the whole slice until
        the end of the string is extracted. If negative, indexes from the
        back.
      ],
    ),
  ),
  "Str::slice::count": (
    260,
    babel(
      en: [
        The number of bytes to extract. This is equivalent to passing
        `start + count` as the `end` position. Mutually exclusive with
        `end`.
      ],
    ),
  ),
  "Str::clusters": (
    275,
    babel(
      en: [
        Returns the grapheme clusters of the string as an array of substrings.
      ],
    ),
  ),
  "Str::codepoints": (
    281,
    babel(
      en: [
        Returns the Unicode codepoints of the string as an array of substrings.
      ],
    ),
  ),
  "Str::to_unicode": (
    287,
    babel(
      en: [
        Converts a character into its corresponding code point.

        ```example
        #"a".to-unicode() \
        #("a\u{0300}"
           .codepoints()
           .map(str.to-unicode))
        ```
      ],
    ),
  ),
  "Str::to_unicode::character": (
    297,
    babel(
      en: [
        The character that should be converted.
      ],
    ),
  ),
  "Str::from_unicode": (
    303,
    babel(
      en: [
        Converts a unicode code point into its corresponding string.

        ```example
        #str.from-unicode(97)
        ```
      ],
    ),
  ),
  "Str::from_unicode::value": (
    310,
    babel(
      en: [
        The code point that should be converted.
      ],
    ),
  ),
  "Str::normalize": (
    319,
    babel(
      en: [
        Normalizes the string to the given Unicode normal form.

        This is useful when manipulating strings containing Unicode combining
        characters.

        ```typ
        #assert.eq("é".normalize(form: "nfd"), "e\u{0301}")
        #assert.eq("ſ́".normalize(form: "nfkc"), "ś")
        ```
      ],
    ),
  ),
  "Str::normalize::form": (
    331,
    babel(
      en: [

      ],
    ),
  ),
  "Str::contains": (
    343,
    babel(
      en: [
        Whether the string contains the specified pattern.

        This method also has dedicated syntax: You can write `{"bc" in "abcd"}`
        instead of `{"abcd".contains("bc")}`.
      ],
    ),
  ),
  "Str::contains::pattern": (
    350,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::starts_with": (
    359,
    babel(
      en: [
        Whether the string starts with the specified pattern.
      ],
    ),
  ),
  "Str::starts_with::pattern": (
    363,
    babel(
      en: [
        The pattern the string might start with.
      ],
    ),
  ),
  "Str::ends_with": (
    372,
    babel(
      en: [
        Whether the string ends with the specified pattern.
      ],
    ),
  ),
  "Str::ends_with::pattern": (
    376,
    babel(
      en: [
        The pattern the string might end with.
      ],
    ),
  ),
  "Str::find": (
    398,
    babel(
      en: [
        Searches for the specified pattern in the string and returns the first
        match as a string or `{none}` if there is no match.
      ],
    ),
  ),
  "Str::find::pattern": (
    403,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::position": (
    412,
    babel(
      en: [
        Searches for the specified pattern in the string and returns the index
        of the first match as an integer or `{none}` if there is no match.
      ],
    ),
  ),
  "Str::position::pattern": (
    417,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::match_": (
    426,
    babel(
      en: [
        Searches for the specified pattern in the string and returns a
        dictionary with details about the first match or `{none}` if there is no
        match.

        The returned dictionary has the following keys:
        - `start`: The start offset of the match
        - `end`: The end offset of the match
        - `text`: The text that matched.
        - `captures`: An array containing a string for each matched capturing
          group. The first item of the array contains the first matched
          capturing, not the whole match! This is empty unless the `pattern` was
          a regex with capturing groups.

        #example(
          title: "Shape of the returned dictionary",
          ```
          #let pat = regex("not (a|an) (apple|cat)")
          #"I'm a doctor, not an apple.".match(pat) \
          #"I am not a cat!".match(pat)
          ```,
        )

        #example(
          title: "Different kinds of patterns",
          ```
          #assert.eq("Is there a".match("for this?"), none)
          #"The time of my life.".match(regex("[mit]+e"))
          ```,
        )
      ],
    ),
  ),
  "Str::match_::pattern": (
    458,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::matches": (
    469,
    babel(
      en: [
        Searches for the specified pattern in the string and returns an array of
        dictionaries with details about all matches. For details about the
        returned dictionaries, see @str.match[above].

        ```example
        #"Day by Day.".matches("Day")
        ```
      ],
    ),
  ),
  "Str::matches::pattern": (
    479,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::replace": (
    497,
    babel(
      en: [
        Replace at most `count` occurrences of the given pattern with a
        replacement string or function (beginning from the start). If no count
        is given, all occurrences are replaced.
      ],
    ),
  ),
  "Str::replace::pattern": (
    505,
    babel(
      en: [
        The pattern to search for.
      ],
    ),
  ),
  "Str::replace::replacement": (
    507,
    babel(
      en: [
        The string to replace the matches with or a function that gets a
        dictionary for each match and can return individual replacement
        strings.

        The dictionary passed to the function has the same shape as the
        dictionary returned by @str.match[`match`].
      ],
    ),
  ),
  "Str::replace::count": (
    514,
    babel(
      en: [
        If given, only the first `count` matches of the pattern are
        replaced.
      ],
    ),
  ),
  "Str::trim": (
    568,
    babel(
      en: [
        Removes matches of a pattern from one or both sides of the string, once
        or repeatedly and returns the resulting string.
      ],
    ),
  ),
  "Str::trim::pattern": (
    573,
    babel(
      en: [
        The pattern to search for. If `{none}`, trims white spaces.
      ],
    ),
  ),
  "Str::trim::at": (
    576,
    babel(
      en: [
        Can be `{start}` or `{end}` to only trim the start or end of the
        string. If omitted, both sides are trimmed.
      ],
    ),
  ),
  "Str::trim::repeat": (
    580,
    babel(
      en: [
        Whether to repeatedly removes matches of the pattern or just once.
        Defaults to `{true}`.
      ],
    ),
  ),
  "Str::split": (
    653,
    babel(
      en: [
        Splits a string at matches of a specified pattern and returns an array
        of the resulting parts.

        When the empty string is used as a separator, it separates every
        character (i.e., Unicode code point) in the string, along with the
        beginning and end of the string. In practice, this means that the
        resulting list of parts will contain the empty string at the start and
        end of the list.
      ],
    ),
  ),
  "Str::split::pattern": (
    664,
    babel(
      en: [
        The pattern to split at. Defaults to whitespace.
      ],
    ),
  ),
  "Str::rev": (
    680,
    babel(
      en: [
        Reverses the string.

        More specifically, this returns a string with the same grapheme
        clusters, in reversed order.

        ```example
        #"Pirate flag: 🏴‍☠️".rev()
        ```
      ],
    ),
  ),
  "Regex": (
    970,
    babel(
      en: [
        A regular expression.

        Can be used as a @reference:styling:show-rules[show rule selector] or with
        @str[string methods].

        Visit #link("https://docs.rs/regex/latest/regex/#syntax")[this website] for
        a complete specification of the supported syntax.

        = With string methods <string-methods>
        Regular expressions can be used with string methods like @str.find[`find`],
        @str.split[`split`], @str.replace[`replace`], @str.match[`match`], or
        @str.matches[`matches`]. See the documentation of these methods for more
        details.

        ```example
        #"a,b;c".split(regex("[,;]"))
        ```

        = With show rules <show-rules>
        Regular expressions can also be used with
        @reference:styling:show-rules[show rules] to match on and transform text in
        the document. For example, below, we are turning all numbers red.

        ```example
        #show regex("\\d+"): set text(red)

        The numbers 1 to 10.
        ```

        Sometimes, you may also want to combine both uses, by first matching on text
        with a show rule and then rematching on the text to extract a specific
        #link("https://docs.rs/regex/latest/regex/#grouping-and-flags")[capture group].
        In this case, it can be convenient to store the regular expression in a
        variable instead of repeating it twice.

        ```example
        #let pattern = regex("\|([^|]*)\|")
        #show pattern: it => {
          let m = it.text.match(pattern)
          let inner = m.captures.first()
          highlight(inner)
        }

        A |handy-dandy| highlighter!
        ```
      ],
    ),
  ),
  "Regex::construct": (
    1028,
    babel(
      en: [
        Create a regular expression from a string.
      ],
    ),
  ),
  "Regex::construct::regex": (
    1031,
    babel(
      en: [
        The regular expression as a string.

        Both Typst strings and regular expressions use backslashes for
        escaping. To produce a regex escape sequence that is also valid in
        Typst, you need to escape the backslash itself (e.g., writing
        `{regex("\\\\")}` for the regex `\\`). Regex escape sequences that
        are not valid Typst escape sequences (e.g., `\d` and `\b`) can be
        entered into strings directly, but it's good practice to still
        escape them to avoid ambiguity (i.e., `{regex("\\b\\d")}`). See the
        @str:escapes[list of valid string escape sequences].

        If you need many escape sequences, you can also create a raw element
        and extract its text to use it for your regular expressions:
        ``` {regex(`\d+\.\d+\.\d+`.text)}```.
      ],
    ),
  ),
)
