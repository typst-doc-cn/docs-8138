#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, example, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Page Setup Guide",
    zh-status: "proofread",
    zh: "页面设置指南",
  ),
  route: "/guides/page-setup",
  description: babel(
    en: "An in-depth guide to setting page dimensions, margins, and page numbers in Typst. Learn how to create appealing and clear layouts and get there quickly.",
    zh-status: "need proofread",
    zh: "深入讲解如何在Typst中设置页面尺寸、页边距和页码。了解如何创建美观清晰的版式并快速上手。",
  ),
)

#babel(
  en: [
    Your page setup is a big part of the first impression your document gives. Line lengths, margins, and columns influence #link("https://practicaltypography.com/page-margins.html")[appearance] and #link("https://designregression.com/article/line-length-revisited-following-the-research")[legibility] while the right headers and footers will help your reader easily navigate your document. This guide will help you to customize pages, margins, headers, footers, and page numbers so that they are the right fit for your content and you can get started with writing.

    In Typst, each page has a width, a height, and margins on all four sides. The top and bottom margins may contain a header and footer. The set rule of the @page[`{page}`] element is where you control all of the page setup. If you make changes with this set rule, Typst will ensure that there is a new and conforming empty page afterward, so it may insert a page break. Therefore, it is best to specify your @page[`{page}`] set rule at the start of your document or in your template.
  ],
  zh-status: "need proofread",
  zh: [
    页面设置在很大程度上决定了文档给人的第一印象。行长、页边距和栏数影响着文档的#link("https://practicaltypography.com/page-margins.html")[外观]和#link("https://designregression.com/article/line-length-revisited-following-the-research")[易读性]，而合适的页眉、页脚则能帮助读者轻松浏览文档。本指南将帮助您自定义页面、页边距、页眉、页脚和页码，使其贴合您的内容，让您能顺利开始写作。

    在Typst中，每个页面都有宽度、高度和四边的页边距。顶部和底部页边距可以放置页眉和页脚。页面的页面设置都由@page[`{page}`]元素的set规则控制。若用这条set规则更改设置，Typst会确保其后出现一个符合新设置的空白页，因此可能会插入分页符。所以，最好在文档开头或模板中指定@page[`{page}`]的set规则。
  ],
)

```example
#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)
>>> #set text(6pt)
>>> #set page(margin: auto)

#set page(
  paper: "iso-b7",
  header: rect(fill: aqua)[Header],
  footer: rect(fill: aqua)[Footer],
  number-align: center,
)

#rect(fill: aqua.lighten(40%))
```

#babel(
  en: [
    This example visualizes the dimensions for page content, headers, and footers. The page content is the page size (ISO B7) minus each side's default margin. In the top and the bottom margin, there are stroked rectangles visualizing the header and footer. They do not touch the main content, instead, they are offset by 30% of the respective margin. You can control this offset by specifying the @page.header-ascent[`header-ascent`] and @page.footer-descent[`footer-descent`] arguments.

    Below, the guide will go more into detail on how to accomplish common page setup requirements with examples.
  ],
  zh-status: "need proofread",
  zh: [
    下例展示了页面内容、页眉和页脚的尺寸。页面内容即页面尺寸（ISO B7）减去各边的默认页边距。顶部和底部页边距中用描边矩形示意页眉和页脚；它们不与主体内容相接，而是分别偏移各自页边距的30%。您可以指定@page.header-ascent[`header-ascent`]和@page.footer-descent[`footer-descent`]参数来控制这一偏移量。

    下文将结合示例，更详细地介绍如何满足常见的页面设置需求。
  ],
)

= #babel(
  en: short-or-long[Customize Margins][Customize page size and margins],
  zh-status: "need proofread",
  zh: [自定义页面尺寸和页边距],
) <customize-margins>
#babel(
  en: [
    Typst's default page size is A4 paper. Depending on your region and your use case, you will want to change this. You can do this by using the @page[`{page}`] set rule and passing it a string argument to use a common page size. Options include the complete ISO 216 series (e.g. `"a4"` and `"iso-c2"`), customary US formats like `"us-legal"` or `"us-letter"`, and more. Check out the reference for the @page.paper[page's paper argument] to learn about all available options.
  ],
  zh-status: "need proofread",
  zh: [
    Typst的默认页面尺寸是A4纸。视所在地区和使用场景，您可能想更改它。只需使用@page[`{page}`]的set规则，传入一个字符串参数来指定常用页面尺寸即可。可选项包括完整的ISO 216系列（如`"a4"`和`"iso-c2"`）、美制惯例尺寸如`"us-legal"`或`"us-letter"`等。所有可用选项请查阅@page.paper[page的`paper`参数]的参考文档。
  ],
)

```example
>>> #set page(margin: auto)
#set page("us-letter")

This page likes freedom.
```

#babel(
  en: [
    If you need to customize your page size to some dimensions, you can specify the named arguments @page.width[`width`] and @page.height[`height`] instead.
  ],
  zh-status: "need proofread",
  zh: [
    如果您需要把页面尺寸自定义为特定大小，可以改用命名参数@page.width[`width`]和@page.height[`height`]来指定。
  ],
)

```example
>>> #set page(margin: auto)
#set page(width: 12cm, height: 12cm)

This page is a square.
```

== #babel(
  en: short-or-long[Change Margins][Change the page's margins],
  zh-status: "need proofread",
  zh: [更改页边距],
) <change-margins>
#babel(
  en: [
    Margins are a vital ingredient for good typography: #link("https://webtypography.net/2.1.2")[Typographers consider lines that fit between 45 and 75 characters best length for legibility] and your margins and @guides:page-setup:columns[columns] help define line widths. By default, Typst will create margins proportional to the page size of your document. To set custom margins, you will use the @page.margin[`margin`] argument in the @page[`{page}`] set rule.

    The `margin` argument will accept a length if you want to set all margins to the same width. However, you often want to set different margins on each side. To do this, you can pass a dictionary:
  ],
  zh-status: "need proofread",
  zh: [
    页边距是优秀排版的关键一环：#link("https://webtypography.net/2.1.2")[排版师认为，每行容纳45到75个字符最利于阅读]，而页边距和@guides:page-setup:columns[栏]共同决定行宽。默认情况下，Typst会按文档的页面尺寸成比例地生成页边距。要自定义页边距，请在@page[`{page}`]的set规则中使用@page.margin[`margin`]参数。

    若想把所有页边距设为同一宽度，`margin`参数可接受一个长度值。不过，您往往需要为各边设置不同的页边距，这时可以传入一个字典：
  ],
)


```example
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))

#lorem(100)
```

#babel(
  en: [
    The page margin dictionary can have keys for each side (`top`, `bottom`, `left`, `right`), but you can also control left and right together by setting the `x` key of the margin dictionary, like in the example. Likewise, the top and bottom margins can be adjusted together by setting the `y` key.

    If you do not specify margins for all sides in the margin dictionary, the old margins will remain in effect for the unset sides. To prevent this and set all remaining margins to a common size, you can use the `rest` key. For example, `[#set page(margin: (left: 1.5in, rest: 1in))]` will set the left margin to 1.5 inches and the remaining margins to one inch.
  ],
  zh-status: "need proofread",
  zh: [
    页边距字典可以为每条边设置键（`top`、`bottom`、`left`、`right`），但您也可以像示例中那样，通过设置边距字典的`x`键同时控制左右页边距。类似地，设置`y`键可同时调整上下页边距。

    如果页边距字典没有为所有边指定页边距，未指定的边会沿用原有页边距。若想避免这种情况，把所有剩余页边距设为同一尺寸，可以使用`rest`键。例如，`[#set page(margin: (left: 1.5in, rest: 1in))]`会把左边距设为1.5英寸，其余页边距设为1英寸。
  ],
)

== #babel(
  en: short-or-long[Alternating Margins][Different margins on alternating pages],
  zh-status: "need proofread",
  zh: [在奇偶页设置不同的页边距],
) <alternating-margins>
#babel(
  en: [
    Sometimes, you'll need to alternate horizontal margins for even and odd pages, for example, to have more room towards the spine of a book than on the outsides of its pages. Typst keeps track of whether a page is to the left or right of the binding. You can use this information and set the `inside` or `outside` keys of the margin dictionary. The `inside` margin points towards the spine, and the `outside` margin points towards the edge of the bound book.
  ],
  zh-status: "need proofread",
  zh: [
    有时您需要为偶数页和奇数页交替设置水平页边距，例如让靠近书脊的一侧比页面外侧留出更多空间。Typst会跟踪页面位于装订线的左侧还是右侧。您可以利用这一信息，设置页边距字典的`inside`或`outside`键。`inside`页边距指向书脊，`outside`页边距指向装订书籍的外缘。
  ],
)

```typ
#set page(margin: (inside: 2.5cm, outside: 2cm, y: 1.75cm))
```

#babel(
  en: [
    Typst will assume that documents written in Left-to-Right scripts are bound on the left while books written in Right-to-Left scripts are bound on the right. However, you will need to change this in some cases: If your first page is output by a different app, the binding is reversed from Typst's perspective. Also, some books, like English-language Mangas are customarily bound on the right, despite English using Left-to-Right script. To change the binding side and explicitly set where the `inside` and `outside` are, set the @page.binding[`binding`] argument in the @page[`{page}`] set rule.
  ],
  zh-status: "need proofread",
  zh: [
    Typst假定用从左到右文字书写的文档在左侧装订，而用从右到左文字书写的书籍在右侧装订。但在某些情况下您需要更改这一设定：如果您的第一页由其它应用输出，那么从Typst的角度看，装订方向就是相反的。此外，有些书籍如英文漫画，尽管英文从左到右书写，却习惯上在右侧装订。要更改装订侧，明确指定`inside`和`outside`的位置，请在@page[`{page}`]的set规则中设置@page.binding[`binding`]参数。
  ],
)

```typ
// Produce a book bound on the right,
// even though it is set in Spanish.
#set text(lang: "es")
#set page(binding: right)
```

#babel(
  en: [
    If `binding` is `left`, `inside` margins will be on the left on odd pages, and vice versa.
  ],
  zh-status: "need proofread",
  zh: [
    如果`binding`为`left`，`inside`页边距在奇数页位于左侧，反之亦然。
  ],
)

= #babel(
  en: short-or-long[Headers And Footers][Add headers and footers],
  zh-status: "need proofread",
  zh: [添加页眉和页脚],
)  <headers-and-footers>
#babel(
  en: [
    Headers and footers are inserted in the top and bottom margins of every page. You can add custom headers and footers or just insert a page number.

    In case you need more than just a page number, the best way to insert a header and a footer are the @page.header[`header`] and @page.footer[`footer`] arguments of the @page[`{page}`] set rule. You can pass any content as their values:
  ],
  zh-status: "need proofread",
  zh: [
    页眉和页脚插入每一页的顶部和底部页边距中。您可以添加自定义的页眉和页脚，也可以只插入页码。

    如果除了页码还需要其它内容，插入页眉和页脚的最佳方式是使用@page[`{page}`]set规则中的@page.header[`header`]和@page.footer[`footer`]参数。它们的值可以是任意内容：
  ],
)

```example
>>> #set page("a5", margin: (x: 2.5cm, y: 3cm))
#set page(header: [
  _Lisa Strassner's Thesis_
  #h(1fr)
  National Academy of Sciences
])

#lorem(150)
```

#babel(
  en: [
    Headers are bottom-aligned by default so that they do not collide with the top edge of the page. You can change this by wrapping your header in the @align[`{align}`] function.
  ],
  zh-status: "need proofread",
  zh: [
    页眉默认底部对齐，以免与页面顶端相撞。您可以把页眉内容包在@align[`{align}`]函数中改变对齐方式。
  ],
)

== #babel(
  en: short-or-long[Specific Pages][Different header and footer on specific pages],
  zh-status: "need proofread",
  zh: [为特定页面设置不同的页眉和页脚],
) <specific-pages>
#babel(
  en: [
    You'll need different headers and footers on some pages. For example, you may not want a header and footer on the title page. The example below shows how to conditionally remove the header on the first page:
  ],
  zh-status: "need proofread",
  zh: [
    有些页面需要使用不同的页眉和页脚。例如，您可能不希望标题页出现页眉和页脚。下面的示例展示了如何按条件移除第一页的页眉：
  ],
)

```typ
#set page(header: context {
  if counter(page).get().first() > 1 [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})

#lorem(150)
```

#babel(
  en: [
    This example may look intimidating, but let's break it down: By using the `{context}` keyword, we are telling Typst that the header depends on where we are in the document. We then ask Typst if the page @counter[counter] is larger than one at our (context-dependent) current position. The page counter starts at one, so we are skipping the header on a single page. Counters may have multiple levels. This feature is used for items like headings, but the page counter will always have a single level, so we can just look at the first one.

    You can, of course, add an `else` to this example to add a different header to the first page instead.
  ],
  zh-status: "need proofread",
  zh: [
    这个示例看起来可能有些吓人，我们逐步拆解一下：通过`{context}`关键字，我们告诉Typst页眉取决于文档中的当前位置。然后我们询问Typst：在（依上下文确定的）当前位置，页面@counter[计数器]是否大于1。页面计数器从1开始，所以这样可以跳过某一页的页眉。计数器可以有多个层级，例如章节标题就用到这一特性，但页面计数器始终只有一个层级，因此只需看第一个。

    当然，您也可以在这个示例中加上`else`，改为给第一页设置不同的页眉。
  ],
)

== #babel(
  en: short-or-long[Specific Elements][Adapt headers and footers on pages with specific elements],
  zh-status: "need proofread",
  zh: [在包含特定元素的页面上调整页眉和页脚],
) <specific-elements>
#babel(
  en: [
    The technique described in the previous section can be adapted to perform more advanced tasks using Typst's labels. For example, pages with big tables could omit their headers to help keep clutter down. We will mark our tables with a `<big-table>` @label[label] and use the @query[query system] to find out if such a label exists on the current page:
  ],
  zh-status: "need proofread",
  zh: [
    上一节介绍的方法可以借助Typst的标签完成更高级的任务。例如，含大型表格的页面可以省略页眉，以减少杂乱。我们将用`<big-table>`@label[标签]标记表格，再用@query[查询系统]判断当前页面上是否存在这样的标签：
  ],
)

```typ
#set page(header: context {
  let matches = query(<big-table>)
  let current = counter(page).get()
  let has-table = matches.any(m =>
    counter(page).at(m.location()) == current
  )

  if not has-table [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})

#lorem(100)
#pagebreak()

#table(
  columns: 2 * (1fr,),
  [A], [B],
  [C], [D],
) <big-table>
```

#babel(
  en: [
    Here, we query for all instances of the `<big-table>` label. We then check that none of the tables are on the page at our current position. If so, we print the header. This example also uses variables to be more concise. Just as above, you could add an `else` to add another header instead of deleting it.
  ],
  zh-status: "need proofread",
  zh: [
    这里我们查询`<big-table>`标签的所有实例，然后检查没有表格位于当前位置所在的页面上。如果没有，就打印页眉。这个示例还用变量让代码更简洁。和上面一样，您可以加上`else`来添加另一个页眉，而不是把它删掉。
  ],
)

= #babel(
  en: short-or-long[Page Numbers][Add and customize page numbers],
  zh-status: "need proofread",
  zh: [添加和自定义页码],
) <page-numbers>
#babel(
  en: [
    Page numbers help readers keep track of and reference your document more easily. The simplest way to insert page numbers is the @page.numbering[`numbering`] argument of the @page[`{page}`] set rule. You can pass a @numbering.numbering[_numbering pattern_] string that shows how you want your pages to be numbered.
  ],
  zh-status: "need proofread",
  zh: [
    页码能帮助读者更方便地跟踪和引用您的文档。插入页码最简单的方法是使用@page[`{page}`]set规则中的@page.numbering[`numbering`]参数。您可以传入一个@numbering.numbering[_编号模式_]字符串，指定页码的编号方式。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "1")

This is a numbered page.
```

#babel(
  en: [
    Above, you can check out the simplest conceivable example. It adds a single Arabic page number at the center of the footer. You can specify other characters than `"1"` to get other numerals. For example, `"i"` will yield lowercase Roman numerals. Any character that is not interpreted as a number will be output as-is. For example, put dashes around your page number by typing this:
  ],
  zh-status: "need proofread",
  zh: [
    上面的示例是最简单的例子：它在页脚中央添加一个阿拉伯数字页码。除了`"1"`，您还可以指定其它字符来得到别的数字形式。例如，`"i"`会生成小写罗马数字。任何不被解释为数字的字符都会原样输出。例如，在页码两侧加上破折号可以这样写：
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "— 1 —")

This is a — numbered — page.
```

#babel(
  en: [
    You can add the total number of pages by entering a second number character in the string.
  ],
  zh-status: "need proofread",
  zh: [
    在字符串中再写一个数字字符，即可添加总页数。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "1 of 1")

This is one of many numbered pages.
```

#babel(
  en: [
    Go to the @numbering.numbering[`{numbering}` function reference] to learn more about the arguments you can pass here.

    In case you need to right- or left-align the page number, use the @page.number-align[`number-align`] argument of the @page[`{page}`] set rule. Alternating alignment between even and odd pages is not currently supported using this property. To do this, you'll need to specify a custom footer and query the page counter as described in the section on conditionally omitting headers and footers.
  ],
  zh-status: "need proofread",
  zh: [
    关于此处可传入的参数，请查阅@numbering.numbering[`{numbering}`函数的参考文档]。

    如果您需要将页码右对齐或左对齐，请使用@page[`{page}`]set规则中的@page.number-align[`number-align`]参数。目前还不支持用该属性在偶数页和奇数页之间交替对齐。要做到这一点，您需要自定义页脚，并按「有条件地省略页眉和页脚」一节所述查询页面计数器。
  ],
)

== #babel(
  en: [Custom footer with page numbers],
  zh-status: "need proofread",
  zh: [自定义带页码的页脚],
) <custom-footer-with-page-numbers>
#babel(
  en: [
    Sometimes, you need to add other content than a page number to your footer. However, once a footer is specified, the @page.numbering[`numbering`] argument of the @page[`{page}`] set rule is ignored. This section shows you how to add a custom footer with page numbers and more.
  ],
  zh-status: "need proofread",
  zh: [
    有时您需要在页脚中添加页码以外的其它内容。不过，一旦指定了页脚，@page[`{page}`]set规则中的@page.numbering[`numbering`]参数就会被忽略。本节将介绍如何添加带有页码及其它内容的自定义页脚。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(footer: context [
  *American Society of Proceedings*
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
])

This page has a custom footer.
```

#babel(
  en: [
    First, we add some strongly emphasized text on the left and add free space to fill the line. Then, we call `counter(page)` to retrieve the page counter and use its `display` function to show its current value. We also set `both` to `{true}` so that our numbering pattern applies to the current _and_ final page number.

    We can also get more creative with the page number. For example, let's insert a circle for each page.
  ],
  zh-status: "need proofread",
  zh: [
    首先，我们在左侧添加一段加粗强调的文本，再用弹性空白填满整行。然后，我们调用`counter(page)`获取页面计数器，并用它的`display`函数显示当前值。我们还将`both`设为`{true}`，让编号模式同时作用于当前页码_和_末页页码。

    我们还可以把页码做得更有创意。例如，为每一页插入一个圆圈。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(footer: context [
  *Fun Typography Club*
  #h(1fr)
  #let (num,) = counter(page).get()
  #let circles = num * (
    box(circle(
      radius: 2pt,
      fill: navy,
    )),
  )
  #box(
    inset: (bottom: 1pt),
    circles.join(h(1pt))
  )
])

This page has a custom footer.
```

#babel(
  en: [
    In this example, we use the number of pages to create an array of @circle[circles]. The circles are wrapped in a @box[box] so they can all appear on the same line because they are blocks and would otherwise create paragraph breaks. The length of this @array[array] depends on the current page number.

    We then insert the circles at the right side of the footer, with 1pt of space between them. The join method of an array will attempt to @reference:scripting:blocks[_join_] the different values of an array into a single value, interspersed with its argument. In our case, we get a single content value with circles and spaces between them that we can use with the align function. Finally, we use another box to ensure that the text and the circles can share a line and use the @box.inset[`inset` argument] to raise the circles a bit so they line up nicely with the text.
  ],
  zh-status: "need proofread",
  zh: [
    在这个示例中，我们用页数创建一个由@circle[圆圈]组成的数组。由于圆圈是块级元素，否则会产生段落换行，所以要把它们包在@box[box]里，使它们能出现在同一行上。这个@array[数组]的长度取决于当前页码。

    然后，我们将这些圆圈插到页脚右侧，彼此间隔1pt。数组的join方法会尝试把数组的不同值@reference:scripting:blocks[_连接_]成单个值，并在其间插入其参数。在此例中，我们得到一个由圆圈和间隔组成的内容值，可以传给`align`函数。最后，我们再用一个`box`确保文本和圆圈能位于同一行，并用@box.inset[`inset`参数]将圆圈稍微抬高，使它们与文本对齐。
  ],
)

== #babel(
  en: short-or-long[Skip Pages][Reset the page number and skip pages],
  zh-status: "need proofread",
  zh: [重置页码并跳过页面],
) <skip-pages>
#babel(
  en: [
    Do you, at some point in your document, need to reset the page number? Maybe you want to start with the first page only after the title page. Or maybe you need to skip a few page numbers because you will insert pages into the final printed product.

    The right way to modify the page number is to manipulate the page @counter[counter]. The simplest manipulation is to set the counter back to 1.
  ],
  zh-status: "need proofread",
  zh: [
    您是否需要在文档中的某处重置页码？也许您想让第一页从标题页之后才开始，或者因为要在最终印刷品中插入页面而需要跳过几个页码。

    修改页码的正确做法是操作页面@counter[计数器]。最简单的操作是把计数器设回1。
  ],
)

```typ
#counter(page).update(1)
```

#babel(
  en: [
    This line will reset the page counter back to one. It should be placed at the start of a page because it will otherwise create a page break. You can also update the counter given its previous value by passing a function:
  ],
  zh-status: "need proofread",
  zh: [
    这一行会把页面计数器重置为1。它应放在页面开头，否则会制造一个分页符。您也可以根据计数器的先前值更新它，只需传入一个函数：
  ],
)

```typ
#counter(page).update(n => n + 5)
```

#babel(
  en: [
    In this example, we skip five pages. `n` is the current value of the page counter and `n + 5` is the return value of our function.

    In case you need to retrieve the actual page number instead of the value of the page counter, you can use the @location.page[`page`] method on the return value of the @here function:
  ],
  zh-status: "need proofread",
  zh: [
    在这个示例中，我们跳过了五页。`n`是页面计数器的当前值，`n + 5`是函数的返回值。

    如果您需要获取实际页码而不是页面计数器的值，可以对@here\函数的返回值调用@location.page[`page`]方法：
  ],
)

```example
#counter(page).update(n => n + 5)

// This returns one even though the
// page counter was incremented by 5.
#context here().page()
```

#babel(
  en: [
    You can also obtain the page numbering pattern from the location returned by `here` with the @location.page-numbering[`page-numbering`] method.
  ],
  zh-status: "need proofread",
  zh: [
    您还可以用@location.page-numbering[`page-numbering`]方法，从`here`返回的位置获取页码编号模式。
  ],
)

= #babel(en: short-or-long[Columns][Add columns], zh-status: "need proofread", zh: [添加栏]) <columns>
#babel(
  en: [
    Add columns to your document to fit more on a page while maintaining legible line lengths. Columns are vertical blocks of text which are separated by some whitespace. This space is called the gutter.

    To lay out your content in columns, just specify the desired number of columns in a @page.columns[`{page}`] set rule. To adjust the amount of space between the columns, add a set rule on the @columns[`columns` function], specifying the `gutter` parameter.
  ],
  zh-status: "need proofread",
  zh: [
    在文档中添加栏，可以在保持行长易读的同时让一页容纳更多内容。栏是由空白分隔的竖直文本块，这些空白称为栏间距（gutter）。

    要让内容分栏排版，只需在@page.columns[`{page}`]的set规则中指定所需的栏数。要调整栏与栏之间的空白大小，请对@columns[`columns`函数]添加set规则，指定`gutter`参数：
  ],
)

```example
>>> #set page(height: 120pt)
#set page(columns: 2)
#set columns(gutter: 12pt)

#lorem(30)
```

#babel(
  en: [
    Very commonly, scientific papers have a single-column title and abstract, while the main body is set in two-columns. To achieve this effect, Typst's @place[`place` function] can temporarily escape the two-column layout by specifying `{float: true}` and `{scope: "parent"}`:
  ],
  zh-status: "need proofread",
  zh: [
    很常见的情况是，科学论文的标题和摘要采用单栏，而正文采用双栏。要实现这种效果，可以使用Typst的@place[`place`函数]，通过指定`{float: true}`和`{scope: "parent"}`暂时脱离双栏版式：
  ],
)

#example(
  single: true,
  ```
  >>> #set page(height: 180pt)
  >>> #show heading.where(level: 1): set text(size: 0.9em)
  #set document(
    title: [Impacts of Odobenidae],
  )
  #set page(columns: 2)
  #set par(justify: true)

  #place(
    top + center,
    float: true,
    scope: "parent",
    title(),
  )

  = About seals in the wild
  #lorem(80)
  ```,
)

_Floating placement_ refers to elements being pushed to the top or bottom of the column or page, with the remaining content flowing in between. It is also frequently used for @figure.placement[figures].

== #babel(
  en: short-or-long[Columns Anywhere][Use columns anywhere in your document],
  zh-status: "need proofread",
  zh: [在文档的任何位置使用栏],
) <columns-anywhere>
#babel(
  en: [
    To create columns within a nested layout, e.g. within a rectangle, you can use the @columns[`columns` function] directly. However, it really should only be used within nested layouts. At the page-level, the page set rule is preferable because it has better interactions with things like page-level floats, footnotes, and line numbers.
  ],
  zh-status: "need proofread",
  zh: [
    要在嵌套版式（例如矩形）内创建栏，可以直接使用@columns[`columns`函数]。不过它实际上只应在嵌套版式中使用。在页面层面，更推荐使用页面set规则，因为它与页面级浮动体、脚注和行号等特性的配合更好：
  ],
)

```example
#rect(
  width: 6cm,
  height: 3.5cm,
  columns(2, gutter: 12pt)[
    In the dimly lit gas station,
    a solitary taxi stood silently,
    its yellow paint fading with
    time. Its windows were dark,
    its engine idle, and its tires
    rested on the cold concrete.
  ]
)
```

== #babel(en: [Balanced columns], zh-status: "need proofread", zh: [平衡栏])<balanced-columns>
#babel(
  en: [
    If the columns on the last page of a document differ greatly in length, they may create a lopsided and unappealing layout. That's why typographers will often equalize the length of columns on the last page. This effect is called balancing columns. Typst cannot yet balance columns automatically. However, you can balance columns manually by placing @colbreak[`[#colbreak()]`] at an appropriate spot in your markup, creating the desired column break manually.
  ],
  zh-status: "need proofread",
  zh: [
    如果文档最后一页各栏的长度相差很大，版面会显得歪斜难看。因此，排版师常常会把最后一页各栏的长度调匀，这种效果称为平衡栏。Typst目前还不能自动平衡栏。不过，您可以在标记的适当位置放置@colbreak[`[#colbreak()]`]，手动制造所需的分栏，从而手动平衡栏。
  ],
)

= #babel(en: [One-off modifications], zh-status: "need proofread", zh: [一次性修改]) <one-off-modifications>
#babel(
  en: [
    You do not need to override your page settings if you need to insert a single page with a different setup. For example, you may want to insert a page that's flipped to landscape to insert a big table or change the margin and columns for your title page. In this case, you can call @page[`{page}`] as a function with your content as an argument and the overrides as the other arguments. This will insert enough new pages with your overridden settings to place your content on them. Typst will revert to the page settings from the set rule after the call.
  ],
  zh-status: "need proofread",
  zh: [
    如果只需插入一个设置不同的页面，您不必覆盖整个页面设置。例如，您可能想插入一个翻转为横向的页面来放一张大表格，或者为标题页更改页边距和栏数。在这种情况下，您可以像调用函数那样调用@page[`{page}`]，把内容作为参数传入，把要覆盖的设置作为其它参数传入。这样会插入足够多的、采用覆盖设置的新页面来容纳您的内容。调用之后，Typst会恢复set规则中的页面设置。
  ],
)

```example
>>> #set page("a6")
#page(flipped: true)[
  = Multiplication table

  #table(
    columns: 5 * (1fr,),
    ..for x in range(1, 10) {
      for y in range(1, 6) {
        (str(x*y),)
      }
    }
  )
]
```
