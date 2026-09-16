#import "/i18n-scope.typ": *
#let live-item-data = (
  "ClassElem": (
    124,
    babel(
      en: [
        Forced use of a certain math class.

        This is useful to treat certain symbols as if they were of a different
        class, e.g. to make a symbol behave like a relation. The class of a symbol
        defines the way it is laid out, including spacing around it, and how its
        scripts are attached by default. Note that the latter can always be
        overridden using @math.limits[`{limits}`] and @math.scripts[`{scripts}`].

        = Example <example>
        ```example
        #let loves = math.class(
          "relation",
          sym.suit.heart,
        )

        $x loves y and y loves 5$
        ```
      ],
    ),
  ),
  "ClassElem::class": (
    143,
    babel(
      en: [
        The class to apply to the content.
      ],
    ),
  ),
  "ClassElem::body": (
    147,
    babel(
      en: [
        The content to which the class is applied.
      ],
    ),
  ),
)
