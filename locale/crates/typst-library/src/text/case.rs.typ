#import "/i18n-scope.typ": *
#let live-item-data = (
  "lower": (
    4,
    [
      #babel(
        en: [
          Converts a string or content to lowercase.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #lower("ABC") \
      #lower[*My Text*] \
      #lower[already low]
      ```
    ],
  ),
  "lower::text": (
    14,
    babel(
      en: [
        The text to convert to lowercase.
      ],
    ),
  ),
  "upper": (
    20,
    [
      #babel(
        en: [
          Converts a string or content to uppercase.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #upper("abc") \
      #upper[*my text*] \
      #upper[ALREADY HIGH]
      ```
    ],
  ),
  "upper::text": (
    30,
    babel(
      en: [
        The text to convert to uppercase.
      ],
    ),
  ),
)
