#import "/i18n-scope.typ": *
#let live-item-data = (
  "read": (
    8,
    babel(
      en: [
        Reads plain text or data from a file.

        By default, the file will be read as UTF-8 and returned as a @str[string].

        If you specify `{encoding: none}`, this returns raw @bytes[bytes] instead.

        = Example <example>
        ```example
        An example for a HTML file: \
        #let text = read("example.html")
        #raw(text, block: true, lang: "html")

        Raw bytes:
        #read("tiger.jpg", encoding: none)
        ```
      ],
    ),
  ),
  "read::path": (
    26,
    babel(
      en: [
        Path to a file.
      ],
    ),
  ),
  "read::encoding": (
    28,
    babel(
      en: [
        The encoding to read the file with.

        If set to `{none}`, this function returns raw bytes.
      ],
    ),
  ),
)
