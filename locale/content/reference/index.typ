#import "/i18n-scope.typ": babel
#import "/i18n-translation.typ": Translation
#import "/components/index.typ": docs-chapter, modifier-list, paged-heading-offset, ty-pill

#docs-chapter(
  title: babel(
    en: "Reference",
    zh-status: "proofread",
    zh: "参考手册",
  ),
  route: "/reference",
  description: babel(
    en: "The Typst reference is a systematic and comprehensive guide to the Typst typesetting language.",
    zh-status: "need proofread",
    zh: "系统且全面地介绍Typst排版语言的指南。",
  ),
  introduction: true,
  class: "reference-index",
)[
  #babel(
    en: [
      This reference documentation is a comprehensive guide to all of Typst's syntax, concepts, functions, types, and other definitions. Use the reference to answer specific questions about Typst and to broaden your understanding of the available features.

      If you are completely new to Typst, we recommend starting with the @tutorial[tutorial] and then coming back to the reference to learn more about Typst's features as you need them.
    ],
    zh-status: "need proofread",
    zh: [
      本文档全面介绍了Typst的语法、概念、函数、类型及其它定义。您可以利用参考手册解答有关Typst的具体问题，并借此加深对已有功能的理解。

      如果您完全没有接触过Typst，建议先阅读@tutorial[教程]，之后再回到参考手册，按需了解Typst的更多功能。
    ],
  )

  = #babel(en: [Language], zh-status: "proofread", zh: [语言]) <language>
  #babel(
    en: [
      The reference starts by covering fundamentals of the Typst language. First, we give an overview of @reference:syntax[Typst's syntax.] The following sections cover core concepts central to the Typst language such as @reference:styling[styling documents,] using @reference:scripting[Typst's scripting capabilities,] and @reference:context[reasoning about the contents of your document.]
    ],
    zh-status: "need proofread",
    zh: [
      参考手册首先介绍Typst语言的基础知识。我们先概览@reference:syntax[Typst语法]，后续章节则介绍Typst语言的核心概念，例如@reference:styling[设置文档样式]、@reference:scripting[使用Typst的脚本功能]，以及@reference:context[根据文档内容进行推理]。
    ],
  )

  = Library <library>
  #babel(
    en: [
      #context if target() == "paged" [
        // The PDF outline does not contain the part labels, so we have to tell the reader where each section starts.
        Starting with @reference:foundations, the reference includes sections
      ] else [
        The second part includes sections
      ] on all functions, types, and other definitions provided by the _standard library_ of the Typst language.

      The definition sections are grouped by topic. For example, if you would like to explore all tools Typst provides to adjust where elements land on the page, you should start in the @reference:layout section. If instead you'd rather learn more about what formats Typst can export to, you should peruse the @format[Formats] section.
    ],
    zh-status: "need proofread",
    zh: [
      #context if target() == "paged" [
        从@reference:foundations\开始，参考手册将用以下章节介绍
      ] else [
        第二部分介绍
      ]Typst语言_标准库_提供的所有函数、类型及其它定义。

      这些定义章节按主题分组。例如，如果您想了解Typst为调整页面元素位置而提供的所有工具，可以从@reference:layout\章节开始；如果您想了解Typst能导出哪些格式，则可以浏览@format[格式]章节。
    ],
  )

  = Reading the reference <reading-the-reference>
  This reference uses a few graphical conventions and labels to let you quickly scan its sections.

  / #ty-pill(str, linked: false):
    #babel(
      en: [
        These pills indicate that a value is of a particular type. Each type's chapter uses the respective pill as its title. Similar types share a color. For example, all numeric types have the same color.
      ],
    )

  / #modifier-list(Translation.elementFunction):
    #babel(
      en: [
        Some functions are labelled as elements. This means that they can be used with set and show rules. Some elements can be @locate[located] and used with the @query function. Elements generally produce visible output in the document. You may be using elements even if you are not calling functions, as there is dedicated markup for some elements.
      ],
    )

  / #modifier-list(Translation.contextFunction):
    #babel(
      en: [
        These functions can reason about the contents of your document. They can only be used when _context_ is available, for example through a context block. Refer to the @reference:context section for more information.
      ],
    )

  / #modifier-list(Translation.required):
    #babel(
      en: [
        Appears on a function parameter if calling the function without that parameter would result in an error.
      ],
    )

  / #modifier-list(Translation.positional):
    #babel(
      en: [
        Appears on a function parameter that is specified without a parameter name and colon. Instead, Typst will use the parameter order to determine which argument is which. Parameters not marked as positional are _named_ parameters.
      ],
    )

  / #modifier-list(Translation.variadic):
    #babel(
      en: [
        Appears on function parameters that can be specified multiple times.
      ],
    )

  / #modifier-list(Translation.settable):
    #babel(
      en: [
        Appears on function parameters of element functions that can be customized with a set rule.
      ],
    )
]

#show: paged-heading-offset.with(1)
#include "language/index.typ"
#include "library/index.typ"
