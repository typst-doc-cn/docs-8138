#import "/i18n-scope.typ": babel
#import "/i18n-translation.typ": Translation
#import "/components/index.typ": docs-chapter, info, modifier-list, paged-heading-offset, ty-pill

#docs-chapter(
  title: babel(
    en: "Reference",
    zh-status: "proofread",
    zh: "参考手册",
  ),
  route: "/reference",
  description: babel(
    en: "The Typst reference is a systematic and comprehensive guide to the Typst typesetting language.",
    zh-status: "proofread",
    zh: "Typst的参考手册，系统而全面地介绍Typst排版语言。",
  ),
  introduction: true,
  class: "reference-index",
)[
  #babel(
    en: [
      This reference documentation is a comprehensive guide to all of Typst's syntax, concepts, functions, types, and other definitions. Use the reference to answer specific questions about Typst and to broaden your understanding of the available features.

      If you are completely new to Typst, we recommend starting with the @tutorial[tutorial] and then coming back to the reference to learn more about Typst's features as you need them.
    ],
    zh-status: "proofread",
    zh: [
      这份参考手册全面介绍了Typst的语法、概念、类型、函数等各类细节。参考手册可以帮您解决关于Typst的具体问题，并带您进一步熟悉其功能。

      如果刚接触Typst，建议先阅读@tutorial[教程]，读完教程再回参考手册按需学习Typst的更多功能。
    ],
  )

  = #babel(en: [Language], zh-status: "proofread", zh: [语言]) <language>
  #babel(
    en: [
      The reference starts by covering fundamentals of the Typst language. First, we give an overview of @reference:syntax[Typst's syntax.] The following sections cover core concepts central to the Typst language such as @reference:styling[styling documents,] using @reference:scripting[Typst's scripting capabilities,] and @reference:context[reasoning about the contents of your document.]
    ],
    zh-status: "proofread",
    zh: [
      参考手册开头几章会讲解Typst语言的基本特性。首先总览@reference:syntax[Typst语法]；然后介绍Typst语言的核心概念，包括设置文档@reference:styling[样式]、利用@reference:scripting[脚本]能力，以及让文档内容响应@reference:context[上下文]信息。
    ],
  )

  = #babel(en: [Library], zh-status: "proofread", zh: [库]) <library>
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
    zh-status: "proofread",
    zh: [
      #context if target() == "paged" [
        从@reference:foundations\开始，参考手册
      ] else [
        第二部分
      ]将分章描述Typst语言_标准库_的函数、类型等各类细节。

      这些章节又按话题分成了若干部分。例如，如欲调整元素在页面上的位置，请查阅@reference:layout\部分的各种工具；如欲了解Typst能导出哪些格式，请查阅@format[格式]部分的各个页面。
    ],
  )

  = #babel(en: [Reading the reference], zh-status: "proofread", zh: [标签说明])  <reading-the-reference>
  #babel(
    en: [
      This reference uses a few graphical conventions and labels to let you quickly scan its sections.
    ],
    zh-status: "proofread",
    zh: [
      为方便快速翻阅，参考手册用了几种图形与文字标签。下面一起说明。
    ],
  )

  / #ty-pill(str, linked: false):
    #babel(
      en: [
        These pills indicate that a value is of a particular type. Each type's chapter uses the respective pill as its title. Similar types share a color. For example, all numeric types have the same color.
      ],
      zh-status: "proofread",
      zh: [
        带背景色的标签表示某种数据类型的值。介绍该类型的章节也会把这种颜色用于标题。相似类型会采用相同颜色，例如所有数值类型都用同一种颜色。
      ],
    )

  / #modifier-list(Translation.elementFunction):
    #babel(
      en: [
        Some functions are labelled as elements. This means that they can be used with set and show rules. Some elements can be @locate[located] and used with the @query function. Elements generally produce visible output in the document. You may be using elements even if you are not calling functions, as there is dedicated markup for some elements.
      ],
      zh-status: "proofread",
      zh: [
        有些函数会带有「#Translation.elementFunction」标签，这表示它可用set规则和show规则定制样式。不少元素还标了「#Translation.locatableElement」，表示可被@locate[定位]，也可用@query\等方法查询到。元素通常会变成文档中的可见内容。很多元素都有专门的标记，所以您即使并未直接调用函数，也可能已经在使用元素了。
      ],
    )

  / #modifier-list(Translation.contextFunction):
    #babel(
      en: [
        These functions can reason about the contents of your document. They can only be used when _context_ is available, for example through a context block. Refer to the @reference:context section for more information.
      ],
      zh-status: "proofread",
      zh: [
        这种函数能让文档内容响应_上下文_信息。使用这种函数前，必须先取得上下文，例如用context关键字引出上下文块。更多信息请移步@reference:context\章节。
      ],
    )

  / #modifier-list(Translation.required):
    #babel(
      en: [
        Appears on a function parameter if calling the function without that parameter would result in an error.
      ],
      zh-status: "proofread",
      zh: [
        必需参数在调用函数时必须传入，否则会报错。
      ],
    )

  / #modifier-list(Translation.positional):
    #babel(
      en: [
        Appears on a function parameter that is specified without a parameter name and colon. Instead, Typst will use the parameter order to determine which argument is which. Parameters not marked as positional are _named_ parameters.
      ],
      zh-status: "proofread",
      zh: [
        位置参数按顺序传入，不带参数名和冒号。Typst会按它们的传入顺序判断哪个参数是哪个。未标注为位置参数的其它参数都是_命名参数_。
      ],
    )

  / #modifier-list(Translation.variadic):
    #babel(
      en: [
        Appears on function parameters that can be specified multiple times.
      ],
      zh-status: "proofread",
      zh: [
        变长参数可以传入多次。
      ],
    )

  / #modifier-list(Translation.settable):
    #babel(
      en: [
        Appears on function parameters of element functions that can be customized with a set rule.
      ],
      zh-status: "proofread",
      zh: [
        元素函数的这种参数可使用set规则。
      ],
    )
]

#show: paged-heading-offset.with(1)
#include "language/index.typ"
#include "library/index.typ"
