#import "/i18n-scope.typ": babel
#import "/components/index.typ": big-nav-button, def-dest, docs-chapter, icon, insertion

#show: docs-chapter.with(
  title: babel(
    en: "Overview",
    zh-status: "proofread",
    zh: "概览",
  ),
  route: "/",
  def-target: <overview>,
  description: babel(
    en: "Learn how to use Typst to compose documents faster. Get started with the tutorial, or dive into the reference.",
    zh-status: "need proofread",
    zh: "了解如何更好地使用Typst撰写文档。开始阅读教程，或深入了解参考资料。",
  ),
  nav-buttons: html.div(class: "doc-categories", {
    context big-nav-button(
      icon: icon(32, "tutorial-c", "Circled play icon"),
      href: def-dest(<tutorial>),
      title: babel(
        en: "Tutorial",
        zh-status: "validated",
        zh: "教程",
        ja-status: "validated",
        ja: "チュートリアル",
      ),
      description: babel(
        en: [Step-by-step guide to help you get started.],
        zh-status: "validated",
        zh: [逐步学习如何使用Typst。],
        ja-status: "need update", // When it was translated, the wording of en was slightly different.
        ja: [一歩一歩、Typstの使い方を学びましょう。],
      ),
    )
    context big-nav-button(
      icon: icon(32, "reference-c", "Circled information icon"),
      href: def-dest(<reference>),
      title: babel(
        en: "Reference",
        ja-status: "validated",
        ja: "リファレンス",
        zh-status: "validated",
        zh: "参考手册",
      ),
      description: babel(
        en: [Details about all syntax, concepts, types, and functions.],
        ja-status: "need update", // When it was translated, the wording of en was slightly different.
        ja: [Typstのあらゆる構文、概念、型、関数についての詳細なリファレンスです。],
        zh-status: "proofread",
        zh: [了解Typst的语法、概念、类型、函数等各类细节。],
      ),
    )
  }),
)

#babel(
  en: [
    Welcome to Typst's documentation! Typst is a markup-based typesetting system that combines powerful automation and high-quality typography with speed and ease of use. This makes it suitable for documents of any complexity. Typst is a great alternative to both word processors and LaTeX.
  ],
  zh-status: "need proofread",
  zh: [
    欢迎阅读Typst的中文文档！Typst是为科学写作而诞生的基于标记的排版系统。它被设计之初就是作为一种替代品，用于替代像LaTeX这样的高级工具，又或者是像Word和GoogleDocs这样的简单工具。我们对Typst的目标是构建一个功能强大的排版工具，并且让用户可以愉快地使用它。
  ],
)

#babel(
  en: [
    This documentation is split into multiple parts, serving different needs:

    - If you are new to Typst, we highly recommend starting with our @tutorial[beginner-friendly tutorial]. Throughout the tutorial, we will introduce you to Typst through a practical example.

    - To answer targeted questions about Typst and familiarize yourself with advanced features, use the @reference[reference]. It describes the fundamental features of the Typst language and contains sections for all the functions, types, and more that come with Typst.

    - For tailored, in-depth how-tos on specific features, use cases, and audiences, check out our @guides[guides]. They provide copyable snippets throughout and allow you to build confidence with a specific feature area. If you are coming from LaTeX, the @guides:for-latex-users provides an alternative introduction to Typst, building on concepts you already know.
  ],
  zh-status: "need update",
  zh: [
    本文档分为两部分：一个适合初学者的教程，其通过实际用例介绍Typst；以及一个全面的参考，以解释Typst的所有概念和功能。

    我们还邀请您加入我们为 Typst 建立的社区。Typst 仍是一个非常年轻的项目，因此我们非常希望能够得到您的反馈。
  ],
)

The term _Typst_ refers to three concepts: The Typst language, the Typst compiler, and the Typst web app. The language is what you write, the compiler translates files in the Typst language into PDFs, HTML pages, and other formats, and the Typst web app lets you work collaboratively on Typst projects in your browser. The Typst language and the compiler are open-source.

This documentation primarily documents the Typst language, although the tutorial and various pages will refer to the web app and the command line Typst compiler.
#insertion(
  "overview-web-app",
  fallback: [
    In the copy of the docs hosted on #link("https://typst.app/docs/"), we also include documentation about the web app.
  ],
)
To learn how to install the Typst compiler CLI, visit the #link("https://typst.app/open-source")[Open Source page] on our website. There, you can also learn more about the relationship between the Typst compiler and the web app. Once you have installed the Typst compiler CLI, run `typst help` for more information on how to use it.

Our #link("https://github.com/typst/typst")[GitHub repository] provides additional developer-facing documentation about how to contribute to Typst and how to integrate it into your applications.

The documentation also contains a @changelog[changelog], in which you can track the evolution of Typst and what changes to the markup language mean for your projects. This documentation applies to Typst #sys.version.
