#import "/i18n-scope.typ": *
#let live-item-data = (
  "UnderlineElem": (
    4,
    [
      #babel(
        en: [
          A horizontal line under content.
        ],
      )

      ```example
      $ underline(1 + 2 + ... + 5) $
      ```
    ],
  ),
  "UnderlineElem::body": (
    11,
    babel(
      en: [
        The content above the line.
      ],
    ),
  ),
  "OverlineElem": (
    16,
    [
      #babel(
        en: [
          A horizontal line over content.
        ],
      )

      ```example
      $ overline(1 + 2 + ... + 5) $
      ```
    ],
  ),
  "OverlineElem::body": (
    23,
    babel(
      en: [
        The content below the line.
      ],
    ),
  ),
  "UnderbraceElem": (
    28,
    [
      #babel(
        en: [
          A horizontal brace under content, with an optional annotation below.
        ],
      )

      ```example
      $ underbrace(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderbraceElem::body": (
    35,
    babel(
      en: [
        The content above the brace.
      ],
    ),
  ),
  "UnderbraceElem::annotation": (
    39,
    babel(
      en: [
        The optional content below the brace.
      ],
    ),
  ),
  "OverbraceElem": (
    44,
    [
      #babel(
        en: [
          A horizontal brace over content, with an optional annotation above.
        ],
      )

      ```example
      $ overbrace(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverbraceElem::body": (
    51,
    babel(
      en: [
        The content below the brace.
      ],
    ),
  ),
  "OverbraceElem::annotation": (
    55,
    babel(
      en: [
        The optional content above the brace.
      ],
    ),
  ),
  "UnderbracketElem": (
    60,
    [
      #babel(
        en: [
          A horizontal bracket under content, with an optional annotation below.
        ],
      )

      ```example
      $ underbracket(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderbracketElem::body": (
    67,
    babel(
      en: [
        The content above the bracket.
      ],
    ),
  ),
  "UnderbracketElem::annotation": (
    71,
    babel(
      en: [
        The optional content below the bracket.
      ],
    ),
  ),
  "OverbracketElem": (
    76,
    [
      #babel(
        en: [
          A horizontal bracket over content, with an optional annotation above.
        ],
      )

      ```example
      $ overbracket(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverbracketElem::body": (
    83,
    babel(
      en: [
        The content below the bracket.
      ],
    ),
  ),
  "OverbracketElem::annotation": (
    87,
    babel(
      en: [
        The optional content above the bracket.
      ],
    ),
  ),
  "UnderparenElem": (
    92,
    [
      #babel(
        en: [
          A horizontal parenthesis under content, with an optional annotation below.
        ],
      )

      ```example
      $ underparen(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderparenElem::body": (
    99,
    babel(
      en: [
        The content above the parenthesis.
      ],
    ),
  ),
  "UnderparenElem::annotation": (
    103,
    babel(
      en: [
        The optional content below the parenthesis.
      ],
    ),
  ),
  "OverparenElem": (
    108,
    [
      #babel(
        en: [
          A horizontal parenthesis over content, with an optional annotation above.
        ],
      )

      ```example
      $ overparen(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverparenElem::body": (
    115,
    babel(
      en: [
        The content below the parenthesis.
      ],
    ),
  ),
  "OverparenElem::annotation": (
    119,
    babel(
      en: [
        The optional content above the parenthesis.
      ],
    ),
  ),
  "UndershellElem": (
    124,
    [
      #babel(
        en: [
          A horizontal tortoise shell bracket under content, with an optional
          annotation below.
        ],
      )

      ```example
      $ undershell(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UndershellElem::body": (
    132,
    babel(
      en: [
        The content above the tortoise shell bracket.
      ],
    ),
  ),
  "UndershellElem::annotation": (
    136,
    babel(
      en: [
        The optional content below the tortoise shell bracket.
      ],
    ),
  ),
  "OvershellElem": (
    141,
    [
      #babel(
        en: [
          A horizontal tortoise shell bracket over content, with an optional
          annotation above.
        ],
      )

      ```example
      $ overshell(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OvershellElem::body": (
    149,
    babel(
      en: [
        The content below the tortoise shell bracket.
      ],
    ),
  ),
  "OvershellElem::annotation": (
    153,
    babel(
      en: [
        The optional content above the tortoise shell bracket.
      ],
    ),
  ),
)
