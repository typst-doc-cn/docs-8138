/// The definitions that are available in Rust doc comments.
///
/// This converts the `scope` dictionary in `components/live.typ` to a `module`, to circumvent the limitations of Typst.
#import "/components/index.typ": (
  category-settings, docs-figure, docs-table, example, folding-details, info, insertion, short-or-long,
)

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

#let babel(en: [], zh-status: l10n-status.first(), zh: []) = {
  let is-empty(body) = body in ([], [ ], parbreak())
  assert(
    not is-empty(en) or is-empty(zh),
    message: "expect either en is not empty, or both en and zh are empty, but got: en {en}, zh {zh}"
      .replace("{en}", if is-empty(en) { "empty" } else { "non-empty" })
      .replace("{zh}", if is-empty(zh) { "empty" } else { "non-empty" }),
  )
  assert(zh-status in l10n-status)

  if is-empty(zh) {
    assert(zh-status in ("not translated", "problematic"))
    zh = en
  } else {
    assert.ne(
      zh-status,
      "not translated",
      message: "zh is non-empty, but zh-status is ‘not translated’; did you forget to add `zh-status: \"need proofread\"` or `zh-status: \"proofread\"`?",
    )
  }

  if zh-status not in ("not translated", "proofread", "validated") [
    [⚠️ #zh-status]
  ]
  set text(lang: "zh", region: "CN")
  zh
}
