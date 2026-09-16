#import "/i18n-scope.typ": *
#let live-item-data = (
  "sqrt": (
    6,
    babel(
      en: [
        A square root.

        ```example
        $ sqrt(3 - 2 sqrt(2)) = sqrt(2) - 1 $
        ```
      ],
    ),
  ),
  "sqrt::radicand": (
    14,
    babel(
      en: [
        The expression to take the square root of.
      ],
    ),
  ),
  "RootElem": (
    20,
    babel(
      en: [
        A general root.

        ```example
        $ root(3, x) $
        ```
      ],
    ),
  ),
  "RootElem::index": (
    27,
    babel(
      en: [
        Which root of the radicand to take.
      ],
    ),
  ),
  "RootElem::radicand": (
    31,
    babel(
      en: [
        The expression to take the root of.
      ],
    ),
  ),
)
