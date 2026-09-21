#import "/i18n-scope.typ": *
#let live-item-data = (
  "Duration": (
    9,
    babel(
      en: [
        Represents a positive or negative span of time.
      ],
    ),
  ),
  "Duration::construct": (
    38,
    [
      #babel(
        en: [
          Creates a new duration.

          You can specify the @duration[duration] using weeks, days, hours,
          minutes and seconds. You can also get a duration by subtracting two
          @datetime[datetimes].
        ],
      )

      ```example
      #duration(
        days: 3,
        hours: 12,
      ).hours()
      ```
    ],
  ),
  "Duration::construct::seconds": (
    52,
    babel(
      en: [
        The number of seconds.
      ],
    ),
  ),
  "Duration::construct::minutes": (
    56,
    babel(
      en: [
        The number of minutes.
      ],
    ),
  ),
  "Duration::construct::hours": (
    60,
    babel(
      en: [
        The number of hours.
      ],
    ),
  ),
  "Duration::construct::days": (
    64,
    babel(
      en: [
        The number of days.
      ],
    ),
  ),
  "Duration::construct::weeks": (
    68,
    babel(
      en: [
        The number of weeks.
      ],
    ),
  ),
  "Duration::seconds": (
    82,
    babel(
      en: [
        The duration expressed in seconds.

        This function returns the total duration represented in seconds as a
        floating-point number, rather than the seconds component of the
        duration.
      ],
    ),
  ),
  "Duration::minutes": (
    92,
    babel(
      en: [
        The duration expressed in minutes.

        This function returns the total duration represented in minutes as a
        floating-point number, rather than the minutes component of the
        duration.
      ],
    ),
  ),
  "Duration::hours": (
    102,
    babel(
      en: [
        The duration expressed in hours.

        This function returns the total duration represented in hours as a
        floating-point number, rather than the hours component of the duration.
      ],
    ),
  ),
  "Duration::days": (
    111,
    babel(
      en: [
        The duration expressed in days.

        This function returns the total duration represented in days as a
        floating-point number, rather than the days component of the duration.
      ],
    ),
  ),
  "Duration::weeks": (
    120,
    babel(
      en: [
        The duration expressed in weeks.

        This function returns the total duration represented in weeks as a
        floating-point number, rather than the weeks component of the duration.
      ],
    ),
  ),
)
