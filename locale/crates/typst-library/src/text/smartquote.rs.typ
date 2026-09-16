#import "/i18n-scope.typ": *
#let live-item-data = (
  "SmartQuoteElem": (
    13,
    babel(
      en: [
        A language-aware quote that reacts to its context.

        Automatically turns into an appropriate opening or closing quote based on
        the active @text.lang[text language].

        = Example <example>
        ```example
        "This is in quotes."

        #set text(lang: "de")
        "Das ist in Anführungszeichen."

        #set text(lang: "fr")
        "C'est entre guillemets."
        ```

        = Syntax <syntax>
        This function also has dedicated syntax: The normal quote characters (`'`
        and `"`). Typst automatically makes your quotes smart.
      ],
    ),
  ),
  "SmartQuoteElem::double": (
    34,
    babel(
      en: [
        Whether this should be a double quote.
      ],
    ),
  ),
  "SmartQuoteElem::enabled": (
    38,
    babel(
      en: [
        Whether smart quotes are enabled.

        To disable smartness for a single quote, you can also escape it with a
        backslash.

        ```example
        #set smartquote(enabled: false)

        These are "dumb" quotes.
        ```
      ],
    ),
  ),
  "SmartQuoteElem::alternative": (
    51,
    babel(
      en: [
        Whether to use alternative quotes.

        Does nothing for languages that don't have alternative quotes, or if
        explicit quotes were set.

        ```example
        #set text(lang: "de")
        #set smartquote(alternative: true)

        "Das ist in anderen Anführungszeichen."
        ```
      ],
    ),
  ),
  "SmartQuoteElem::quotes": (
    65,
    babel(
      en: [
        The quotes to use.

        - When set to `{auto}`, the appropriate single quotes for the
          @text.lang[text language] will be used. This is the default.
        - Custom quotes can be passed as a string, array, or dictionary of
          either
          - @str[string]: a string consisting of two characters containing the
            opening and closing double quotes (characters here refer to Unicode
            grapheme clusters)
          - @array[array]: an array containing the opening and closing double
            quotes
          - @dictionary[dictionary]: a dictionary containing the double and
            single quotes, each specified as either `{auto}`, string, or array

        ```example
        #set text(lang: "de")
        'Das sind normale Anführungszeichen.'

        #set smartquote(quotes: "()")
        "Das sind eigene Anführungszeichen."

        #set smartquote(quotes: (single: ("[[", "]]"),  double: auto))
        'Das sind eigene Anführungszeichen.'
        ```
      ],
    ),
  ),
)
