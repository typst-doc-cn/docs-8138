#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter

#show: docs-chapter.with(
  title: babel(
    en: "Styling",
    zh-status: "proofread",
    zh: "样式",
  ),
  route: "/reference/styling",
  description: babel(
    en: "All concepts needed to style your document with Typst.",
    zh-status: "need proofread",
    zh: "使用Typst设置文档样式所需的全部概念。",
  ),
)

#babel(
  en: [
    Typst includes a flexible styling system that automatically applies styling of your choice to your document. With _set rules,_ you can configure basic properties of elements. This way, you create most common styles. However, there might not be a built-in property for everything you wish to do. For this reason, Typst further supports _show rules_ that can completely redefine the appearance of elements.
  ],
  zh-status: "need proofread",
  zh: [
    Typst有一套灵活的样式系统，会自动把您选择的样式应用到文档中。利用_set规则_，您可以配置文档元素的基本属性，借此设置大多数常见样式。然而，您想要实现的效果未必都有内置属性可用，因此Typst还支持可彻底重新定义元素外观的_show规则_。
  ],
)

= #babel(en: [Set rules], zh-status: "proofread", zh: [set规则]) <set-rules>
#babel(
  en: [
    With set rules, you can customize the appearance of elements. They are written as a @function[function call] to an @function:element-functions[element function] preceded by the `{set}` keyword (or `[#set]` in markup). Only optional parameters of that function can be provided to the set rule. Refer to each function's documentation to see which parameters are optional. In the example below, we use two set rules to change the @text.font[font family] and @heading.numbering[heading numbering].
  ],
  zh-status: "need proofread",
  zh: [
    利用set规则，您可以自定义元素的外观。set规则以`{set}`关键字开头（标记模式下为`[#set]`），后接对某个@function:element-functions[元素函数]的@function[函数调用]。只有该函数的可选参数才能提供给set规则；哪些参数是可选参数，请参阅各函数的文档。在下面的示例中，我们用两个set规则改变@text.font[字体]和@heading.numbering[章节标题编号]。
  ],
)

```example
#set heading(numbering: "I.")
#set text(
  font: "New Computer Modern"
)

= Introduction
With set rules, you can style
your document.
```

#babel(
  en: [
    A top level set rule stays in effect until the end of the file. When nested inside of a code or content block, it is only in effect until the end of that block. With a block, you can thus restrict the effect of a rule to a particular segment of your document. Below, we use a content block to scope the list styling to one particular list.
  ],
  zh-status: "need proofread",
  zh: [
    顶层set规则会一直生效到文件末尾。若嵌套在脚本块或内容块内，则只生效到该块末尾。因此，利用块就能把规则的作用范围限制在文档的特定片段内。下面，我们用内容块把列表样式限制在某个列表上。
  ],
)

```example
This list is affected: #[
  #set list(marker: [--])
  - Dash
]

This one is not:
- Bullet
```

#babel(
  en: [
    Sometimes, you'll want to apply a set rule conditionally. For this, you can use a _set-if_ rule.
  ],
  zh-status: "need proofread",
  zh: [
    有时，您希望有条件地应用set规则。为此，可以使用_set-if_规则。
  ],
)

```example
#let task(body, critical: false) = {
  set text(red) if critical
  [- #body]
}

#task(critical: true)[Food today?]
#task(critical: false)[Work deadline]
```

= #babel(en: [Show rules], zh-status: "proofread", zh: [show规则]) <show-rules>
#babel(
  en: [
    With show rules, you can deeply customize the look of a type of element. The most basic form of show rule is a _show-set rule._ Such a rule is written as the `{show}` keyword followed by a @selector[selector], a colon and then a set rule. The most basic form of selector is an @function:element-functions[element function]. This lets the set rule only apply to the selected element. In the example below, headings become dark blue while all other text stays black.
  ],
  zh-status: "need proofread",
  zh: [
    利用show规则，您可以深度定制某类元素的外观。最基本的形式是_show-set规则_：该规则以`{show}`关键字开头，后接@selector[选择器]、一个冒号和一条set规则。最基本的选择器就是@function:element-functions[元素函数]，它使set规则只应用于所选元素。在下面的示例中，章节标题变为深蓝色，而其它文本保持黑色。
  ],
)

```example
#show heading: set text(navy)

= This is navy-blue
But this stays black.
```

#babel(
  en: [
    With show-set rules you can mix and match properties from different functions to achieve many different effects. But they still limit you to what is predefined in Typst. For maximum flexibility, you can instead write a _transformational_ show rule that defines how to format an element from scratch. To write such a show rule, replace the set rule after the colon with an arbitrary @function[function]. This function receives the element in question and can return arbitrary content. The function is often defined inline as `{it => ..}` using the @function:unnamed[unnamed function syntax]. The function's parameter is typically named `it` by convention.

    The available @reference:scripting:fields[fields] on the element passed to the function match the parameters of the respective element function. Below, we define a show rule that formats headings for a fantasy encyclopedia.

    The show rule itself adds tilde characters around the title (these must be escaped with a backslash because otherwise they would indicate a non-breaking space), emphasizes the title with italics, and then displays the heading counter after the title.

    For this example, we also wanted center alignment and a different font. While we could've added these set rules into the existing show rule, we instead added them as separate show-set rules. This is good practice because now these rules can still be overridden by later show-set rules in the document, keeping styling composable. In contrast, set rules within a transformational show rule would not be overridable anymore.
  ],
  zh-status: "need proofread",
  zh: [
    利用show-set规则，您可以混用不同函数的属性，实现各种不同的效果，但仍局限于Typst预定义的内容。为了获得最大的灵活性，您可以改为编写_转换式_show规则，从头定义元素的格式。编写这类show规则时，把冒号后面的set规则替换为任意@function[函数]。该函数接收相应的元素，并可以返回任意内容。这个函数通常按@function:unnamed[匿名函数语法]内联写作`{it => ..}`，其参数按惯例通常命名为`it`。

    传给该函数的元素上可用的@reference:scripting:fields[字段]与相应元素函数的参数一致。下面，我们定义一个show规则，为一本虚构的百科全书设置章节标题的格式。

    该show规则本身在标题两侧各加一个波浪号（必须用反斜杠转义，否则会表示不换行空格），用斜体强调标题，然后在标题之后显示章节标题计数器。

    对于这个示例，我们还想要居中对齐并使用另一种字体。我们本可以把这些set规则加进已有的show规则中，但改为把它们写成独立的show-set规则。这是很好的做法，因为这样文档中后续的show-set规则仍可覆盖它们，从而保持样式的可组合性。相反，转换式show规则内部的set规则就无法再被覆盖了。
  ],
)

```example
#set heading(numbering: "(I)")
#show heading: set align(center)
#show heading: set text(font: "Inria Serif")
#show heading: it => block[
  \~
  #emph(it.body)
  #counter(heading).display()
  \~
]

= Dragon
With a base health of 15, the dragon is the most
powerful creature.

= Manticore
While less powerful than the dragon, the manticore
gets extra style points.
```

#babel(
  en: [
    Like set rules, show rules are in effect until the end of the current block or file.

    Instead of a function, the right-hand side of a show rule can also take a literal string or content block that should be directly substituted for the element. And apart from a function, the left-hand side of a show rule can also take a number of other _selectors_ that define what to apply the transformation to:

    - *Everything:* `{show: rest => ..}` \
      Transform everything after the show rule. This is useful to apply a more complex layout to your whole document without wrapping everything in a giant function call.

    - *Text:* `{show "Text": ..}` \
      Style, transform or replace text.

    - *Regex:* `{show regex("\w+"): ..}` \
      Select and transform text with a regular expression for even more flexibility. See the documentation of the @regex[`regex` type] for details.

    - *Function with fields:* `{show heading.where(level: 1): ..}` \
      Transform only elements that have the specified fields. For example, you might want to only change the style of level-1 headings.

    - *Label:* `{show <intro>: ..}` \
      Select and transform elements that have the specified label. See the documentation of the @label[`label` type] for more details.
  ],
  zh-status: "need proofread",
  zh: [
    与set规则类似，show规则会一直生效到当前块或文件的末尾。

    show规则的右侧除了函数，还可以是应直接替换该元素的字符串字面量或内容块。而show规则的左侧除了函数，还可以使用多种其它_选择器_，以定义要对什么应用转换：

    - *所有内容：* `{show: rest => ..}` \
      转换show规则之后的所有内容。如果不想把所有内容都包进一个巨大的函数调用中，又想为整个文档应用更复杂的布局，这会很有用。

    - *文本：* `{show "Text": ..}` \
      设置、转换或替换文本。

    - *正则表达式：* `{show regex("\w+"): ..}` \
      用正则表达式选择和转换文本，以获得更大的灵活性。详见@regex[`regex`类型]的文档。

    - *带字段的函数：* `{show heading.where(level: 1): ..}` \
      只转换具有指定字段的元素。例如，您可能只想更改一级章节标题的样式。

    - *标签：* `{show <intro>: ..}` \
      选择和转换具有指定标签的元素。详见@label[`label`类型]的文档。
  ],
)

```example
#show "Project": smallcaps
#show "badly": "great"

We started Project in 2019
and are still working on it.
Project is progressing badly.
```
