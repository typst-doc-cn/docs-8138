#import "/i18n-scope.typ": *
#let live-item-data = (
  "Angle": (
    12,
    babel(
      en: [
        An angle describing a rotation.

        Typst supports the following angular units:

        - Degrees: `{180deg}`
        - Radians: `{3.14rad}`

        = Example <example>
        ```example
        #rotate(10deg)[Hello there!]
        ```
      ],
    ),
  ),
  "Angle::to_rad": (
    142,
    babel(
      en: [
        Converts this angle to radians.
      ],
    ),
  ),
  "Angle::to_deg": (
    148,
    babel(
      en: [
        Converts this angle to degrees.
      ],
    ),
  ),
)
