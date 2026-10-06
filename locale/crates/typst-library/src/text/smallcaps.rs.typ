#import "/i18n-scope.typ": *
#let live-item-data = (
  "SmallcapsElem": (
    3,
    [
      #babel(
        en: [
          Displays text in small capitals.
        ],
        zh-status: "proofread",
        zh: [
          以小型大写字母显示文本。
        ],
      )

      = #babel(en: [Example], zh-status: "proofread", zh: [示例]) <example>
      ```example
      Hello \
      #smallcaps[Hello]
      ```

      = #babel(en: [Smallcaps fonts], zh-status: "need proofread", zh: [小型大写字母字体]) <smallcaps-fonts>
      #babel(
        en: [
          By default, this uses the `smcp` and `c2sc` OpenType features on the font.
          Not all fonts support these features. Sometimes, smallcaps are part of a
          dedicated font. This is, for example, the case for the _Latin Modern_ family
          of fonts. In those cases, you can use a show-set rule to customize the
          appearance of the text in smallcaps:
        ],
        zh-status: "need proofread",
        zh: [
          默认情况下，这会使用字体上的`smcp`和`c2sc`两个OpenType特性。并非所有字体都支持这些特性。有时，小型大写字母是某个专用字体的一部分，例如_Latin Modern_字体系列就是如此。在这些情况下，您可以使用show-set规则自定义小型大写字母文本的外观：
        ],
      )

      ```typ
      #show smallcaps: set text(font: "Latin Modern Roman Caps")
      ```

      #babel(
        en: [
          In the future, this function will support synthesizing smallcaps from normal
          letters, but this is not yet implemented.
        ],
        zh-status: "need proofread",
        zh: [
          将来，此函数将支持从普通字母合成小型大写字母，但目前尚未实现。
        ],
      )

      = #babel(en: [Smallcaps headings], zh-status: "need proofread", zh: [小型大写字母标题]) <smallcaps-headings>
      #babel(
        en: [
          You can use a @reference:styling:show-rules[show rule] to apply smallcaps
          formatting to all your headings. In the example below, we also center-align
          our headings and disable the standard bold font.
        ],
        zh-status: "need proofread",
        zh: [
          您可以使用@reference:styling:show-rules[show规则]，将所有章节标题设为小型大写字母。在下面的示例中，我们还将标题居中对齐并禁用默认的粗体。
        ],
      )

      ```example
      #set par(justify: true)
      #set heading(numbering: "I.")

      #show heading: smallcaps
      #show heading: set align(center)
      #show heading: set text(
        weight: "regular"
      )

      = Introduction
      #lorem(40)
      ```
    ],
  ),
  "SmallcapsElem::all": (
    45,
    [
      #babel(
        en: [
          Whether to turn uppercase letters into small capitals as well.

          Unless overridden by a show rule, this enables the `c2sc` OpenType
          feature.
        ],
        zh-status: "need proofread",
        zh: [
          是否也将大写字母转换为小型大写字母。

          除非被show规则覆盖，否则这会启用`c2sc` OpenType特性。
        ],
      )

      ```example
      #smallcaps(all: true)[UNICEF] is an
      agency of #smallcaps(all: true)[UN].
      ```
    ],
  ),
  "SmallcapsElem::body": (
    56,
    babel(
      en: [
        The content to display in small capitals.
      ],
      zh-status: "need proofread",
      zh: [
        要以小型大写字母显示的内容。
      ],
    ),
  ),
)
