#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Text",
    zh-status: "need proofread",
    zh: "文本",
  ),
  description: babel(
    en: "Documentation for text styling functionality.",
    zh-status: "need proofread",
    zh: "文本样式功能的文档。",
  ),
  category: "text",
)

#babel(
  en: [
    Text styling.

    The @text[text function] is of particular interest.
  ],
  zh-status: "need proofread",
  zh: [
    文本样式。

    其中@text[`text`函数]尤其值得关注。
  ],
)
