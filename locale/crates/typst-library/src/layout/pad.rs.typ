#import "/i18n-scope.typ": *
#let live-item-data = (
  "PadElem": (
    4,
    babel(
      en: [
        Adds spacing around content.

        The spacing can be specified for each side individually, or for all sides at
        once by specifying a positional argument.

        = Example <example>
        ```example
        #set align(center)

        #pad(x: 16pt, image("typing.jpg"))
        _Typing speeds can be
         measured in words per minute._
        ```
      ],
    ),
  ),
  "PadElem::left": (
    19,
    babel(
      en: [
        The padding at the left side.
      ],
    ),
  ),
  "PadElem::top": (
    28,
    babel(
      en: [
        The padding at the top side.
      ],
    ),
  ),
  "PadElem::right": (
    32,
    babel(
      en: [
        The padding at the right side.
      ],
    ),
  ),
  "PadElem::bottom": (
    36,
    babel(
      en: [
        The padding at the bottom side.
      ],
    ),
  ),
  "PadElem::x": (
    40,
    babel(
      en: [
        A shorthand to set `left` and `right` to the same value.
      ],
    ),
  ),
  "PadElem::y": (
    44,
    babel(
      en: [
        A shorthand to set `top` and `bottom` to the same value.
      ],
    ),
  ),
  "PadElem::rest": (
    48,
    babel(
      en: [
        A shorthand to set all four sides to the same value.
      ],
    ),
  ),
  "PadElem::body": (
    52,
    babel(
      en: [
        The content to pad at the sides.
      ],
    ),
  ),
)
