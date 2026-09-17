// This file should not import other fields to avoid cyclic imports.

/*
  Validation path:                    (any status) ◀──▶ problematic
                    ┌──────────────────────────────────────────────┐
                    │                                              │
    not translated ─┼─▶ need proofread ──▶ proofread ──▶ validated │
                    │         ▲                                    │
                    └─────────┼────────────────────┬───────────────┘
                              └─── need update ◀───┘
*/
#let l10n-status = (
  // The body has not been translated (it may or may not need translation). The default status.
  "not translated",
  // The body has been translated, but has not been proofread by any human contributor.
  "need proofread",
  // The body has been translated, and has been proofread by one human contributor. (The translator may be a machine, or the same person as the proofreader.)
  "proofread",
  // The body has been translated, and has been proofread by at least two human contributors.
  "validated",
  // The body was once translated, but needs an update because the source body has changed.
  "need update",
  // The body needs work beyond translation, such as submitting a pull request to the upstream.
  "problematic",
)

#let babel(
  en: [],
  zh-status: l10n-status.first(),
  zh: [],
  ja-status: l10n-status.first(),
  ja: [],
) = {
  // Validate arguments.

  let is-empty(body) = body in ([], [ ], parbreak(), "")

  assert(type(en) in (str, content))

  for (lang, (status, body)) in (zh: (zh-status, zh), ja: (ja-status, ja)).pairs() {
    if body != [] {
      // If given, the types should be consistent.
      assert.eq(type(body), type(en))
    }
    assert(
      not is-empty(en) or is-empty(body),
      message: "expect either en is not empty, or both en and {lang} are empty, but got: en {en}, {lang} {body}"
        .replace("{lang}", lang)
        .replace("{en}", if is-empty(en) { "empty" } else { "non-empty" })
        .replace("{body}", if is-empty(body) { "empty" } else { "non-empty" }),
    )
    assert(
      status in l10n-status,
      message: "{lang}-status is invalid: got {status}, expect one of {expect}"
        .replace("{lang}", lang)
        .replace("{status}", repr(status))
        .replace("{expect}", l10n-status.map(repr).join(", ")),
    )

    if is-empty(body) {
      assert(status in ("not translated", "problematic"))
    } else {
      assert.ne(status, "not translated", message: {
        "{lang} is non-empty, but {lang}-status is ‘not translated’; "
        "did you forget to add `{lang}-status: \"need proofread\"` or `{lang}-status: \"proofread\"`?"
      }.replace("{lang}", lang))
    }
  }

  // For now, always display zh.
  // TODO: Implement a mechanism for switching between locales.

  if is-empty(zh) {
    zh = en
  }

  let warn-icon = if zh-status in ("not translated", "proofread", "validated") {
    // No need to warn
  } else if zh-status == "need update" {
    "⚠️💀"
  } else {
    "⚠️"
  }

  if type(zh) == str {
    zh
    if warn-icon != none {
      " "
      "[{icon} {text}]".replace("{icon}", warn-icon).replace("{text}", zh-status)
    }
  } else {
    set text(lang: "zh", region: "CN")
    zh
    if warn-icon != none {
      context if target() == "html" {
        html.sup(title: zh-status)[[#warn-icon]]
      } else {
        super[[#warn-icon #zh-status]]
      }
    }
  }
}
