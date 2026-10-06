#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Model",
    zh-status: "need proofread",
    zh: "模型",
  ),
  description: babel(
    en: "Documentation for definitions related to document structure and semantics.",
    zh-status: "need proofread",
    zh: "文档结构与语义相关定义的文档。",
  ),
  category: "model",
)

#babel(
  en: [
    Document structuring.

    Here, you can find functions to structure your document and interact with that structure. This includes section headings, figures, bibliography management, cross-referencing and more.
  ],
  zh-status: "need proofread",
  zh: [
    文档结构化。

    在这里，您可以找到用于组织文档结构并与该结构交互的函数，包括章节标题、图表、文献管理、交叉引用等。
  ],
)
