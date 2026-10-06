#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, paged-heading-offset, section-outline

#docs-chapter(
  title: babel(
    en: "Guides",
    zh-status: "proofread",
    zh: "指南",
  ),
  route: "/guides",
  description: babel(
    en: "Guides for Typst.",
    zh-status: "proofread",
    zh: "Typst指南。",
  ),
)[
  #babel(
    en: [
      Welcome to the Guides section! Here, you'll find helpful material for specific user groups or use cases. Please see the list below for the available guides. Feel free to propose other topics for guides!
    ],
    zh-status: "need proofread",
    zh: [
      欢迎来到指南部分！在这里，您可以找到针对特定用户组或使用场景的有用资料。现有指南请见下方列表。欢迎提议其他指南话题！
    ],
  )

  #section-outline(
    title: babel(en: [List of Guides], zh-status: "proofread", zh: [指南列表]),
    label: <list-of-guides>,
  )
]

#show: paged-heading-offset.with(1)
#include "for-latex-users.typ"
#include "page-setup.typ"
#include "tables.typ"
#include "accessibility.typ"
