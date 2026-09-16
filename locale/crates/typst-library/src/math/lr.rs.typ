#import "/i18n-scope.typ": *
#let live-item-data = (
  "LrElem": (
    19,
    babel(
      en: [
        Scales delimiters.

        While matched delimiters scale by default, this can be used to scale
        unmatched delimiters and to control the delimiter scaling more precisely.
      ],
    ),
  ),
  "LrElem::size": (
    25,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.
      ],
    ),
  ),
  "LrElem::body": (
    29,
    babel(
      en: [
        The delimited content, including the delimiters.
      ],
    ),
  ),
  "MidElem": (
    40,
    babel(
      en: [
        Scales delimiters vertically to the nearest surrounding `{lr()}` group.

        ```example
        $ { x mid(|) sum_(i=1)^n w_i abs(f_i (x)) < 1 } $
        ```
      ],
    ),
  ),
  "MidElem::body": (
    47,
    babel(
      en: [
        The content to be scaled.
      ],
    ),
  ),
  "floor": (
    52,
    babel(
      en: [
        Floors an expression.

        ```example
        $ floor(x/2) $
        ```
      ],
    ),
  ),
  "floor::size": (
    59,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.

        Default: The current value of @math.lr.size[`lr.size`].
      ],
    ),
  ),
  "floor::body": (
    64,
    babel(
      en: [
        The expression to floor.
      ],
    ),
  ),
  "ceil": (
    70,
    babel(
      en: [
        Ceils an expression.

        ```example
        $ ceil(x/2) $
        ```
      ],
    ),
  ),
  "ceil::size": (
    77,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.

        Default: The current value of @math.lr.size[`lr.size`].
      ],
    ),
  ),
  "ceil::body": (
    82,
    babel(
      en: [
        The expression to ceil.
      ],
    ),
  ),
  "round": (
    88,
    babel(
      en: [
        Rounds an expression.

        ```example
        $ round(x/2) $
        ```
      ],
    ),
  ),
  "round::size": (
    95,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.

        Default: The current value of @math.lr.size[`lr.size`].
      ],
    ),
  ),
  "round::body": (
    100,
    babel(
      en: [
        The expression to round.
      ],
    ),
  ),
  "abs": (
    106,
    babel(
      en: [
        Takes the absolute value of an expression.

        ```example
        $ abs(x/2) $
        ```
      ],
    ),
  ),
  "abs::size": (
    113,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.

        Default: The current value of @math.lr.size[`lr.size`].
      ],
    ),
  ),
  "abs::body": (
    118,
    babel(
      en: [
        The expression to take the absolute value of.
      ],
    ),
  ),
  "norm": (
    124,
    babel(
      en: [
        Takes the norm of an expression.

        ```example
        $ norm(x/2) $
        ```
      ],
    ),
  ),
  "norm::size": (
    131,
    babel(
      en: [
        The size of the brackets, relative to the height of the wrapped content.

        Default: The current value of @math.lr.size[`lr.size`].
      ],
    ),
  ),
  "norm::body": (
    136,
    babel(
      en: [
        The expression to take the norm of.
      ],
    ),
  ),
)
