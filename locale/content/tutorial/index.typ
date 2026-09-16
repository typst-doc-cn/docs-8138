#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, paged-heading-offset, short-or-long

#docs-chapter(
  title: babel(
    en: "Tutorial",
    zh-status: "proofread",
    zh: "教程",
  ),
  route: "/tutorial",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
  introduction: true,
)[
  #babel(
    en: [
      Welcome to Typst's tutorial! In this tutorial, you will learn how to write and format documents in Typst. We will start with everyday tasks and gradually introduce more advanced features. This tutorial does not assume prior knowledge of Typst, other markup languages, or programming. We do assume that you know how to edit a text file.

      The best way to start is to sign up to the Typst app for free and follow along with the steps below. The app gives you instant preview, syntax highlighting and helpful autocompletions. Alternatively, you can follow along in your local text editor with the #link("https://github.com/typst/typst")[open-source CLI].
    ],
    zh-status: "need proofread",
    zh: [
      欢迎来到Typst的教程！在本教程中，您将学习如何在Typst中编写和格式化文档。我们将从一些日常的任务开始，逐步引入更高级的功能。本教程并不事先假定您了解Typst、其他标记语言或相关的编程技术。我们只会假定您知道如何编辑一个文本文件。

      开始的最佳方法是去免费注册一个Typst App账户，并按照以下步骤操作。该App将为您提供即时预览，语法高亮和强大的自动补全。亦或者您可以使用#link("https://github.com/typst/typst")[开源CLI]在本地文本编辑器中进行编辑和编译。
    ],
  )

  = #babel(
    en: short-or-long[When Typst][When to use Typst],
    zh-status: "need proofread",
    zh: [何时使用Typst],
  ) <when-typst>
  #babel(
    en: [
      Before we get started, let's check what Typst is and when to use it. Typst is a markup language for typesetting documents. It is designed to be easy to learn, fast, and versatile. Typst takes text files with markup in them and outputs PDFs.

      Typst is a good choice for writing any long form text such as essays, articles, scientific papers, books, reports, and homework assignments. Moreover, Typst is a great fit for any documents containing mathematical notation, such as papers in the math, physics, and engineering fields. Finally, due to its strong styling and automation features, it is an excellent choice for any set of documents that share a common style, such as a book series.
    ],
    zh-status: "need proofread",
    zh: [
      在开始之前，让我们考虑一下Typst到底是什么，以及我们在什么时候应该使用它。Typst是一种用于排版文档的标记语言，它旨在易于学习、快速且用途广泛。Typst输入带有标记的文本文件，并将其输出为PDF格式。

      Typst是撰写长篇文本（如论文、文章、书籍、报告和作业）的极佳选择。并且，Typst非常适合书写包含数学公式的文档，例如数学、物理和工程领域的论文。此外，由于其强大的样式和自动化功能，它是编写具有相同样式的一系列文档（例如丛书）的绝佳选择。
    ],
  )

  = #babel(
    en: short-or-long[Learnings][What you will learn],
    zh-status: "need proofread",
    zh: [你将学到什么],
  ) <learnings>
  #babel(
    en: [
      This tutorial has four chapters. Each chapter builds on the previous one. Here is what you will learn in each of them:

      + @tutorial:writing-in-typst[Writing in Typst:] Learn how to write text and insert images, equations, and other elements.
      + @tutorial:formatting[Formatting:] Learn how to adjust the formatting of your document, including font size, heading styles, and more.
      + @tutorial:advanced-styling[Advanced Styling:] Create a complex page layout for a scientific paper with typographic features such as an author list and run-in headings.
      + @tutorial:making-a-template[Making a Template:] Build a reusable template from the paper you created in the previous chapter.

      We hope you'll enjoy Typst!
    ],
    zh-status: "need proofread",
    zh: [
      本教程共分四章，每一章都建立在上一章的基础上，以下是您将在每个章节中学到的内容：

      + @tutorial:writing-in-typst[使用Typst写作]：了解如何编写文本和插入图像、数学公式和其他元素。
      + @tutorial:formatting[格式]：了解如何调整文稿的格式，包括字体大小、标题样式等。
      + @tutorial:advanced-styling[高级样式]：为有排版要求（如作者列表和短标题）的科学论文创建复杂的页面布局。
      + @tutorial:making-a-template[制作模板]：使用您在上一章中编写的论文来构建可复用的模板。

      我们希望您会喜欢 Typst！
    ],
  )
]

#show: paged-heading-offset.with(1)
#include "1-writing.typ"
#include "2-formatting.typ"
#include "3-advanced.typ"
#include "4-template.typ"
