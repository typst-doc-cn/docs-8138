#import "/i18n-scope.typ": *
#let live-item-data = (
  "Dir": (
    6,
    [
      #babel(
        en: [
          The four directions into which content can be laid out.

          Possible values are: @direction.ltr[`ltr`], @direction.rtl[`rtl`],
          @direction.ttb[`ttb`], and @direction.btt[`btt`].

          These values are available globally and also in the direction type's scope,
          so you can write either of the following two:
        ],
      )

      ```example
      #stack(dir: rtl)[A][B][C]
      #stack(dir: direction.rtl)[A][B][C]
      ```
    ],
  ),
  "Dir::LTR": (
    45,
    [
      #babel(
        en: [
          Left to right.
        ],
      )

      ```example
      #stack(
        dir: ltr,
        spacing: 0.2cm,
        circle(),
        line(),
        square(),
      )
      ```
    ],
  ),
  "Dir::RTL": (
    59,
    [
      #babel(
        en: [
          Right to left.
        ],
      )

      ```example
      #stack(
        dir: rtl,
        spacing: 0.2cm,
        circle(),
        line(),
        square(),
      )
      ```
    ],
  ),
  "Dir::TTB": (
    73,
    [
      #babel(
        en: [
          Top to bottom.
        ],
      )

      ```example
      #stack(
        dir: ttb,
        spacing: 0.2cm,
        circle(),
        line(),
        square(),
      )
      ```
    ],
  ),
  "Dir::BTT": (
    87,
    [
      #babel(
        en: [
          Bottom to top.
        ],
      )

      ```example
      #stack(
        dir: btt,
        spacing: 0.2cm,
        circle(),
        line(),
        square(),
      )
      ```
    ],
  ),
  "Dir::from": (
    101,
    [
      #babel(
        en: [
          Returns a direction from a starting point.

          This function does the opposite of @direction.start.
        ],
      )

      ```example
      #direction.from(left) \
      #direction.from(right) \
      #direction.from(top) \
      #direction.from(bottom)
      ```
    ],
  ),
  "Dir::from::side": (
    113,
    babel(
      en: [
        The starting point for the direction.

        This cannot be `{start}` or `{end}`.
      ],
    ),
  ),
  "Dir::to": (
    126,
    [
      #babel(
        en: [
          Returns a direction from an end point.

          This function does the opposite of @direction.end.
        ],
      )

      ```example
      #direction.to(left) \
      #direction.to(right) \
      #direction.to(top) \
      #direction.to(bottom)
      ```
    ],
  ),
  "Dir::to::side": (
    138,
    babel(
      en: [
        The end point for the direction.

        This cannot be `{start}` or `{end}`.
      ],
    ),
  ),
  "Dir::axis": (
    151,
    [
      #babel(
        en: [
          The axis this direction belongs to, either `{"horizontal"}` or
          `{"vertical"}`.
        ],
      )

      ```example
      #ltr.axis() \
      #ttb.axis()
      ```
    ],
  ),
  "Dir::sign": (
    166,
    [
      #babel(
        en: [
          The corresponding sign, for use in calculations.

          This is the sign of the vector going this direction along the
          corresponding axis.
        ],
      )

      ```example
      #ltr.sign() \
      #rtl.sign() \
      #ttb.sign() \
      #btt.sign()
      ```
    ],
  ),
  "Dir::start": (
    185,
    [
      #babel(
        en: [
          The starting point of this direction.

          This function does the opposite of @direction.from.
        ],
      )

      ```example
      #ltr.start() \
      #rtl.start() \
      #ttb.start() \
      #btt.start()
      ```
    ],
  ),
  "Dir::end": (
    205,
    [
      #babel(
        en: [
          The end point of this direction.

          This function does the opposite of @direction.to.
        ],
      )

      ```example
      #ltr.end() \
      #rtl.end() \
      #ttb.end() \
      #btt.end()
      ```
    ],
  ),
  "Dir::inv": (
    225,
    [
      #babel(
        en: [
          The inverse (opposite) direction.
        ],
      )

      ```example
      #ltr.inv() \
      #rtl.inv() \
      #ttb.inv() \
      #btt.inv()
      ```
    ],
  ),
)
