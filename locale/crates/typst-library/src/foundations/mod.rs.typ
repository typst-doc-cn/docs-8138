#import "/i18n-scope.typ": *
#let live-item-data = (
  "panic": (
    125,
    [
      #babel(
        en: [
          Fails with an error.

          Arguments are displayed to the user (not rendered in the document) as
          strings, converting with `repr` if necessary.
        ],
      )

      = #babel(en: [Example]) <example>
      #babel(
        en: [
          The code below produces the error `panicked with: this is wrong`.
        ],
      )
      ```typ
      #panic("this is wrong")
      ```
    ],
  ),
  "panic::values": (
    137,
    babel(
      en: [
        The values to panic with and display to the user.
      ],
    ),
  ),
  "assert": (
    157,
    [
      #babel(
        en: [
          Ensures that a condition is fulfilled.

          Fails with an error if the condition is not fulfilled. Does not produce any
          output in the document.

          If you wish to test equality between two values, see @assert.eq and
          @assert.ne.
        ],
      )

      = #babel(en: [Example]) <example>
      ```typ
      #assert(1 < 2, message: "math broke")
      ```
    ],
  ),
  "assert::condition": (
    171,
    babel(
      en: [
        The condition that must be true for the assertion to pass.
      ],
    ),
  ),
  "assert::message": (
    173,
    babel(
      en: [
        The error message when the assertion fails.
      ],
    ),
  ),
  "assert::eq": (
    189,
    [
      #babel(
        en: [
          Ensures that two values are equal.

          Fails with an error if the first value is not equal to the second. Does
          not produce any output in the document.
        ],
      )

      ```typ
      #assert.eq(10, 10)
      ```
    ],
  ),
  "assert::eq::left": (
    199,
    babel(
      en: [
        The first value to compare.
      ],
    ),
  ),
  "assert::eq::right": (
    201,
    babel(
      en: [
        The second value to compare.
      ],
    ),
  ),
  "assert::eq::message": (
    203,
    babel(
      en: [
        An optional message to display on error instead of the
        representations of the compared values.
      ],
    ),
  ),
  "assert::ne": (
    222,
    [
      #babel(
        en: [
          Ensures that two values are not equal.

          Fails with an error if the first value is equal to the second. Does not
          produce any output in the document.
        ],
      )

      ```typ
      #assert.ne(3, 4)
      ```
    ],
  ),
  "assert::ne::left": (
    232,
    babel(
      en: [
        The first value to compare.
      ],
    ),
  ),
  "assert::ne::right": (
    234,
    babel(
      en: [
        The second value to compare.
      ],
    ),
  ),
  "assert::ne::message": (
    236,
    babel(
      en: [
        An optional message to display on error instead of the
        representations of the compared values.
      ],
    ),
  ),
  "eval": (
    256,
    [
      #babel(
        en: [
          Evaluates a string as Typst code.

          This function should only be used as a last resort.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #eval("1 + 1") \
      #eval("(1, 2, 3, 4)").len() \
      #eval("*Markup!*", mode: "markup") \
      ```
    ],
  ),
  "eval::source": (
    269,
    babel(
      en: [
        A string of Typst code to evaluate.
      ],
    ),
  ),
  "eval::mode": (
    271,
    [
      #babel(
        en: [
          The @reference:syntax:modes[syntactical mode] in which the string is
          parsed.
        ],
      )

      ```example
      #eval("= Heading", mode: "markup")
      #eval("1_2^3", mode: "math")
      ```
    ],
  ),
  "eval::scope": (
    281,
    [
      #babel(
        en: [
          A scope of definitions that are made available.
        ],
      )

      ```example
      #eval("x + 1", scope: (x: 2)) \
      #eval(
        "abc/xyz",
        mode: "math",
        scope: (
          abc: $a + b + c$,
          xyz: $x + y + z$,
        ),
      )
      ```
    ],
  ),
)
