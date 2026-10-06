#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Introspection",
    zh-status: "need proofread",
    zh: "内省",
  ),
  description: babel(
    en: "Documentation for functionality that enables interactions between different parts of a document.",
    zh-status: "need proofread",
    zh: "介绍文档各部分之间交互功能的文档。",
  ),
  category: "introspection",
)

#babel(
  en: [
    Interactions between document parts.

    This category is home to Typst's introspection capabilities: With the `counter` function, you can access and manipulate page, section, figure, and equation counters or create custom ones. Meanwhile, the `query` function lets you search for elements in the document to construct things like a list of figures or headers which show the current chapter title.
  ],
  zh-status: "need proofread",
  zh: [
    文档各部分之间的交互。

    本类别汇集了Typst的内省功能：使用`counter`函数，您可以访问并操作页面、章节、图表和公式的计数器，也可以创建自定义计数器；而`query`函数允许您在文档中搜索元素，用来构建图表列表、显示当前章节标题的页眉等内容。
  ],
)

Most of the functions are _contextual._ It is recommended to read the chapter on @reference:context[context] before continuing here.
