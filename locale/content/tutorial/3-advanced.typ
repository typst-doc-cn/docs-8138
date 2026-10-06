#import "/i18n-scope.typ": babel
#import "/components/index.typ": checked-list, docs-chapter, docs-figure, example, folding-details, info, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Advanced Styling",
    zh-status: "proofread",
    zh: "高级样式",
  ),
  route: "/tutorial/advanced-styling",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    In the previous two chapters of this tutorial, you have learned how to write a document in Typst and how to change its formatting. The report you wrote throughout the last two chapters got a straight A and your supervisor wants to base a conference paper on it! The report will of course have to comply with the conference's style guide. Let's see how we can achieve that.

    Before we start, let's create a team, invite your supervisor and add them to the team. You can do this by going back to the app dashboard with the back icon in the top left corner of the editor. Then, choose the plus icon in the left toolbar and create a team. Finally, click on the new team and go to its settings by clicking 'manage team' next to the team name. Now you can invite your supervisor by email.
  ],
  zh-status: "need proofread",
  zh: [
    在本教程前两章中，您学习了如何在Typst中撰写文档、如何更改文档格式。您在前两章写的报告拿了全优，您的导师想以此为基础投一篇会议论文！当然，报告必须符合会议的样式规范。下面看看该如何做到。

    开始之前，我们先创建一个团队，邀请您的导师加入。回到在线应用首页即可操作：单击编辑器左上角的返回图标。然后，单击左侧工具栏的加号图标，新建一个团队。最后，单击新团队，再单击团队名称旁的「管理团队」进入其设置。现在就能通过电子邮件邀请您的导师了。
  ],
)

#docs-figure(
  "3-advanced-team-settings.png",
  alt: "The team settings",
  shadow: false,
)

#babel(
  en: [
    Next, move your project into the team: Open it, going to its settings by choosing the gear icon in the left toolbar and selecting your new team from the owners dropdown. Don't forget to save your changes!

    Now, your supervisor can also edit the project and you can both see the changes in real time. You can join our #link("https://discord.gg/2uDybryKPe")[Discord server] to find other users and try teams with them!
  ],
  zh-status: "need proofread",
  zh: [
    接着，把项目移入团队：打开项目，单击左侧工具栏的齿轮图标进入设置，在所有者下拉列表中选择新建的团队。别忘了保存更改！

    现在，您的导师也能编辑项目了，你们双方都能实时看到更改。您可以加入我们的#link("https://discord.gg/2uDybryKPe")[Discord服务器]，结识其他用户，与他们一起试用团队功能！
  ],
)

= #babel(
  en: short-or-long[Guidelines][The conference guidelines],
  zh-status: "need proofread",
  zh: short-or-long[规范][会议规范],
) <guidelines>
#babel(
  en: [
    The layout guidelines are available on the conference website. Let's take a look at them:

    - The font should be an 11pt serif font
    - The title should be in 17pt and bold
    - The paper contains a single-column abstract and two-column main text
    - The abstract should be centered
    - The main text should be justified
    - First level section headings should be 13pt, centered, and rendered in small capitals
    - Second level headings are run-ins, italicized and have the same size as the body text
    - Finally, the pages should be US letter sized, numbered in the center of the footer and the top right corner of each page should contain the title of the paper

    We already know how to do many of these things, but for some of them, we'll need to learn some new tricks.
  ],
  zh-status: "need proofread",
  zh: [
    会议的版式规范发布在会议网站上，我们来看一下：

    - 字体应为11pt的衬线字体
    - 标题应为17pt粗体
    - 论文含单栏摘要和双栏正文
    - 摘要应居中
    - 正文应两端对齐
    - 一级章节标题应为13pt、居中，并使用小型大写字母
    - 二级标题是同行标题，用斜体，字号与正文相同
    - 最后，页面尺寸应为US letter，页码位于页脚中央，且每页右上角都应包含论文标题

    这些要求大多我们已经会做，但有几项还需要学习一些新技巧。
  ],
)

= #babel(
  en: short-or-long[Set Rules][Writing the right set rules],
  zh-status: "need proofread",
  zh: short-or-long[set规则][编写正确的set规则],
) <set-rules>
#babel(
  en: [
    Let's start by writing some set rules for the document.
  ],
  zh-status: "need proofread",
  zh: [
    我们先为文档编写几条set规则。
  ],
)

```example
#set page(
>>> margin: auto,
  paper: "us-letter",
  header: align(right)[
    A Fluid Dynamic Model for
    Glacier Flow
  ],
  numbering: "1",
)
#set par(justify: true)
#set text(
  font: "Libertinus Serif",
  size: 11pt,
)

#lorem(600)
```

#babel(
  en: [
    You are already familiar with most of what is going on here. We set the text size to `{11pt}` and the font to Libertinus Serif. We also enable paragraph justification and set the page size to US letter.

    The `header` argument is new: With it, we can provide content to fill the top margin of every page. In the header, we specify our paper's title as requested by the conference style guide. We use the `align` function to align the text to the right.

    Last but not least is the `numbering` argument. Here, we can provide a @numbering[numbering pattern] that defines how to number the pages. By setting it to `{"1"}`, Typst only displays the bare page number. Setting it to `{"(1/1)"}` would have displayed the current page and total number of pages surrounded by parentheses. And we could even have provided a completely custom function here to format things to our liking.
  ],
  zh-status: "need proofread",
  zh: [
    这里的大部分内容您已经很熟悉了。我们把字号设为`{11pt}`，字体设为Libertinus Serif，同时启用了段落两端对齐，并把页面尺寸设为US letter。

    `header`参数是新面孔：有了它，我们就能填入内容来填充每页的上边距。在页眉中，我们按会议样式规范的要求填入了论文标题。我们用`align`函数把文字右对齐。

    最后是`numbering`参数。在这里，我们可以提供@numbering[编号模式]来定义页码的编号方式。把它设为`{"1"}`，Typst就只显示单纯的页码；设为`{"(1/1)"}`则会显示当前页码和总页数，并用圆括号括起来。我们甚至可以在这里提供完全自定义的函数，按自己的喜好来格式化。
  ],
)

= #babel(
  en: short-or-long[Title And Abstract][Creating a title and abstract],
  zh-status: "need proofread",
  zh: short-or-long[标题与摘要][创建标题与摘要],
) <title-and-abstract>
#babel(
  en: [
    Now, let's add a title and an abstract. We'll start with the title. Typst comes with a @title function. Let's start by providing our title as an argument:
  ],
  zh-status: "need proofread",
  zh: [
    现在我们来添加标题和摘要。先从标题入手。Typst自带@title\函数，我们先把它要显示的标题作为参数传进去：
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
#title[
  A Fluid Dynamic Model
  for Glacier Flow
]
```

You can see that the title is already boldfaced and has some space around it. However, it is left-aligned and not exactly 17pt large. Hence, we need to adjust its appearance. The title function does not come with any arguments for font or text size we could set. Instead, these properties are defined on the `text` and `align` functions.

#info[
  What is the difference between what the `title` function inserted and the headings we produced with equals signs?

  Headings, even first-level headings, can appear multiple times in your document whereas a title only appears once, usually at the beginning. Differentiating between the two helps Typst make your document accessible for users of Assistive Technology such as screen readers.
]

When we want to customize the properties of some element inside of another kind of element, we can use show-set rules. First, we use `show` to select which element we want to customize. We call this a _selector._ Then, we type a colon. Next, we write the set rule that should apply to elements matching the selector. Summarized, the syntax looks like this:

```typ
#show your-selector: set some-element(/* ... */)
```

Let's recall: We want to center-align the title and make it 17pt large. Hence, we need two show-set rules:

- One with the selector `title` and the rule `{set text(size: 17pt)}`
- One with the selector `title` and the rule `{set align(center)}`

Our example now looks like this:

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
#show title: set text(size: 17pt)
#show title: set align(center)

#title[
  A Fluid Dynamic Model
  for Glacier Flow
]
```

#babel(
  en: [
    This looks right. Let's also add the author list: Since we are writing this paper together with our supervisor, we'll add our own and their name.
  ],
  zh-status: "need proofread",
  zh: [
    看起来不错。接着添加作者列表：这篇论文是我们和导师一起写的，所以要把我们和导师的名字都加上。
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
>>>
>>> #show title: set text(size: 17pt)
>>> #show title: set align(center)
>>>
>>> #title[
>>>   A Fluid Dynamic Model
>>>   for Glacier Flow
>>> ]

#grid(
  columns: (1fr, 1fr),
  align(center)[
    Therese Tungsten \
    Artos Institute \
    #link("mailto:tung@artos.edu")
  ],
  align(center)[
    Dr. John Doe \
    Artos Institute \
    #link("mailto:doe@artos.edu")
  ]
)
```

#babel(
  en: [
    The two author blocks are laid out next to each other. We use the @grid function to create this layout. With a grid, we can control exactly how large each column is and which content goes into which cell. The `columns` argument takes an array of @relative[relative lengths] or @fraction[fractions]. In this case, we passed it two equal fractional sizes, telling it to split the available space into two equal columns. We then passed two content arguments to the grid function. The first with our own details, and the second with our supervisors'. We again use the `align` function to center the content within the column. The grid takes an arbitrary number of content arguments specifying the cells. Rows are added automatically, but they can also be manually sized with the `rows` argument.

    Looking at the authors and the title, they are a bit too close together. You can address this by using another show-set rule to configure the space below the title. The title, the grid, and all other elements that Typst arranges from the top to the bottom of the page (except for paragraphs) are called _blocks._ Each block is controlled by the @block function. It controls behaviors like their distance and whether a block can contain a page break. That means that we can write another show-set rule that selects the title to set the block spacing:
  ],
  zh-status: "need proofread",
  zh: [
    两个作者块并排排列，我们用@grid\函数实现这种布局。借助网格，我们能精确控制每列多宽、哪些内容放进哪个单元格。`columns`参数接收一个@relative[相对长度]或@fraction[比例]的数组。本例中传入了两个相等的比例，表示把可用空间等分为两列。随后我们给`grid`函数传入了两个内容块参数：第一个是我们自己的信息，第二个是导师的信息。我们再次用`align`函数让内容在列内居中。网格接收任意多个指定单元格的内容块参数；行会自动添加，也可以用`rows`参数手动指定尺寸。

    看一下作者和标题，它们挨得有点近。可以再用一条show-set规则来配置标题下方的间距。标题、网格，以及Typst从上到下排列的其它元素（段落除外）都称为_块_，每个块由@block\函数控制，它管着块间距、能否跨页等行为。也就是说，我们可以再写一条show-set规则，选中标题来设置块的间距：
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
>>>
#show title: set text(size: 17pt)
#show title: set align(center)
#show title: set block(below: 1.2em)

#title[
  A Fluid Dynamic Model
  for Glacier Flow
]

#grid(
<<<   // ...
>>>   columns: (1fr, 1fr),
>>>   align(center)[
>>>     Therese Tungsten \
>>>     Artos Institute \
>>>     #link("mailto:tung@artos.edu")
>>>   ],
>>>   align(center)[
>>>     Dr. John Doe \
>>>     Artos Institute \
>>>     #link("mailto:doe@artos.edu")
>>>   ]
)
```

#babel(
  en: [
    With this show-set rule, we overrode the spacing below the title. We have used the `em` unit: It allows us to express lengths as multiples of the font size. Here, we used it to space the title and the author list exactly 1.2× the font size apart. Now, let's add the abstract. Remember that the conference wants the abstract to be set ragged and centered.
  ],
  zh-status: "need proofread",
  zh: [
    这条show-set规则覆盖了标题下方的间距。我们用了`em`单位：它让我们能以字号倍数表示长度，这里用它把标题和作者列表的间距设为字号的1.2倍。现在来添加摘要。记住，会议要求摘要居中且不两端对齐（ragged）。
  ],
)

#example(
  zoom: (0pt, 0pt, 612pt, 317.5pt),
  ```
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(right + horizon)[
  >>>     A Fluid Dynamic Model for
  >>>     Glacier Flow
  >>>   ],
  >>>   numbering: "1",
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  >>>
  >>> #show title: set text(size: 17pt)
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  >>>
  >>> #title[
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ]
  >>>
  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   align(center)[
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   align(center)[
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  >>>
  <<< ...

  #align(center)[
    #set par(justify: false)
    *Abstract* \
    #lorem(80)
  ]
  >>> #lorem(600)
  ```,
)

#babel(
  en: [
    Well done! One notable thing is that we used a set rule within the content argument of `align` to turn off justification for the abstract. This does not affect the remainder of the document even though it was specified after the first set rule because content blocks _scope_ styling. Anything set within a content block will only affect the content within that block.

    Another tweak could be to remove the duplication between the header and the title element's argument. Since they share the title, it would be convenient to store it in a place designed to hold metadata about the document. We would then need a way to retrieve the title in both places. The `document` element can help us with the former: By using it in a set rule, we can store document metadata like title, description, and keywords.
  ],
  zh-status: "need proofread",
  zh: [
    干得漂亮！有一点值得注意：我们在`align`的内容参数里用了一条set规则，关闭摘要的两端对齐。尽管这条规则写在第一条set规则之后，它并不会影响文档的其余部分，因为内容块会_限定_样式作用域——在内容块里设置的任何东西只影响该块内的内容。

    另一处可以改进的地方是：消除页眉与`title`元素参数之间的重复。二者都用到论文标题，把它存到专门存放文档元数据的地方会更方便。这样我们还需要一种在两者中都能取出标题的办法。前者可以借助`document`元素：在set规则中使用它，就能存储标题、描述、关键词等文档元数据。
  ],
)

```typ
#set document(title: [A Fluid Dynamic Model for Glacier Flow])
```

When exporting a PDF, the title set here will appear in the title bar of your PDF reader. Your operating system will also use this title to make the file retrievable with search. Last but not least, it contributes to making your document more accessible and is required if you choose to comply with PDF/UA, a PDF standard focused on accessibility.

Now, we need a way to retrieve the value we set in the main title and the header. Because the `title` function is designed to work together with the `document` element, calling it with no arguments will just print the title. For the header, we will need to be more explicit: Because Typst has no way of knowing that we want to insert the title there, we will need to tell it to do so manually.

Using _context,_ we can retrieve the contents of any values we have set on elements before. When we use the `{context}` keyword, we can access any property of any element, including the document element's title property. Its use looks like this:

#example(
  single: true,
  ```
  #set document(title: [
    A Fluid Dynamic Model
    for Glacier Flow
  ])

  <<< ...

  #set page(
  >>> "us-letter",
  >>> margin: auto,
    header: align(
      right + horizon,
      // Retrieve the document
      // element's title property.
      context document.title,
    ),
  <<<   ...
  >>> numbering: "1",
  )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)

  >>> #show title: set text(size: 17pt)
  >>>
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  #title()

  <<< ...

  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   align(center)[
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   align(center)[
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  >>>
  >>> #align(center)[
  >>>   #set par(justify: false)
  >>>   *Abstract* \
  >>>   #lorem(80)
  >>> ]
  >>>
  >>> #lorem(600)
  ```,
)

First, notice how we called the title function with empty, round parentheses. Because no argument was passed, it defaulted to what we set for the document element above. The distinction between empty round and empty square brackets is important: While empty round brackets show that you are passing nothing, empty square brackets mean that you are passing one argument: an empty content block. If called that way, the title would have no visible content.

Next, take a look at the header. Instead of the title in square parentheses, we used the context keyword to access the document title. This inserted exactly what we set above. The role of context is not limited to accessing properties: With it, you can check if some elements are present in the document, measure the physical dimensions of others, and more. Using context, you can build powerful templates that react to the preferences of the end-user.

#info[
  #folding-details(
    title: [Why is the context keyword required to access element properties?],
  )[
    Normally, when we access a variable, we know exactly what its value is going to be:

    - The variable could be a constant built into Typst, like `[#sym.pi]`
    - The variable could be defined by an argument
    - The variable could be defined or overwritten in the current scope

    However, sometimes, that's not enough. In this chapter of the tutorial, we have inserted a page header with the title. Even though we pass only one piece of content for the header, we may want different pages to have different headers. For example, we may want to print the chapter name or use the page number. When we use context, we can write a single context block that tells Typst to take a look at where it's inserted, look for the last heading, the current page number, or anything else, and go from there. That means that the same context block, inserted on different pages, can produce different output.

    For more information, read up on context @reference:context[in its docs] after completing this tutorial.
  ]
]

= #babel(
  en: short-or-long[Columns And Headings][Adding columns and headings],
  zh-status: "need proofread",
  zh: short-or-long[分栏与章节标题][添加分栏和章节标题],
) <columns-and-headings>
#babel(
  en: [
    The paper above unfortunately looks like a wall of lead. To fix that, let's add some headings and switch our paper to a two-column layout. Fortunately, that's easy to do: We just need to amend our `page` set rule with the `columns` argument.

    By adding `{columns: 2}` to the argument list, we have wrapped the whole document in two columns. However, that would also affect the title and authors overview. To keep them spanning the whole page, we can wrap them in a function call to @place[`{place}`]. Place expects an alignment and the content it should place as positional arguments. Using the named `{scope}` argument, we can decide if the items should be placed relative to the current column or its parent (the page). There is one more thing to configure: If no other arguments are provided, `{place}` takes its content out of the flow of the document and positions it over the other content without affecting the layout of other content in its container:
  ],
  zh-status: "need proofread",
  zh: [
    上面的论文看起来像一堵铅墙，实在难以阅读。我们来加点章节标题，并把论文改成双栏布局。这很容易：只需给`page`的set规则补上`columns`参数。

    在参数表中加入`{columns: 2}`后，整篇文档就被包进了双栏。但这也会影响标题和作者列表，为了让它们通栏（横跨整页），可以把它们包进@place[`{place}`]的函数调用中。`place`按位置接收一个对齐方式，以及要放置的内容。通过命名参数`{scope}`，可以决定放置是相对于当前栏还是其父级（即页面）。还有一点要配置：如果不提供其它参数，`{place}`会把内容移出文档流，叠放在其它内容之上，而不影响其容器内其它内容的排版：
  ],
)

```example
#place(
  top + center,
  rect(fill: black),
)
#lorem(30)
```

If we hadn't used `{place}` here, the square would be in its own line, but here it overlaps the few lines of text following it. Likewise, that text acts as if there was no square. To change this behavior, we can pass the argument `{float: true}` to ensure that the space taken up by the placed item at the top or bottom of the page is not occupied by any other content.

#example(
  single: true,
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  #set page(
  >>> margin: auto,
    paper: "us-letter",
    header: align(
      right + horizon,
      context document.title,
    ),
    numbering: "1",
    columns: 2,
  )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)

  #place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
  )[
  >>> #show title: set text(size: 17pt)
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  >>>
  >>> #title()
  >>>
  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   [
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   [
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  <<<   ...

    #par(justify: false)[
      *Abstract* \
      #lorem(80)
    ]
  ]

  = Introduction
  #lorem(300)

  = Related Work
  #lorem(200)
  ```,
)

In this example, we also used the `clearance` argument of the `{place}` function to provide the space between it and the body instead of using the @v[`{v}`] function. We can also remove the explicit `{align(center, ..)}` calls around the various parts since they inherit the center alignment from the placement.

#babel(
  en: [
    Now there is only one thing left to do: Style our headings. We need to make them centered and use small capitals. These properties are not available on the `heading` function, so we will need to write a few show-set rules and a show rule:
  ],
  zh-status: "need proofread",
  zh: [
    现在只剩最后一步：设置章节标题的样式。我们需要让标题居中并使用小型大写字母。`heading`函数没有提供这些属性，所以得写几条show-set规则和一条show规则：
  ],
)

- A show-set rule to make headings center-aligned
- A show-set rule to make headings 13pt large and use the regular weight
- A show rule to wrap the headings in a call to the `smallcaps` function

#example(
  zoom: (50pt, 250pt, 265pt, 270pt),
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(
  >>>     right + horizon,
  >>>     context document.title,
  >>>   ),
  >>>   numbering: "1",
  >>>   columns: 2,
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  #show heading: set align(center)
  #show heading: set text(
    size: 13pt,
    weight: "regular",
  )
  #show heading: smallcaps

  <<< ...
  >>> #place(
  >>>   top + center,
  >>>   float: true,
  >>>   scope: "parent",
  >>>   clearance: 2em,
  >>> )[
  >>>   #show title: set text(size: 17pt)
  >>>   #show title: set align(center)
  >>>   #show title: set block(below: 1.2em)
  >>>
  >>>   #title()
  >>>
  >>>   #grid(
  >>>     columns: (1fr, 1fr),
  >>>     [
  >>>       Therese Tungsten \
  >>>       Artos Institute \
  >>>       #link("mailto:tung@artos.edu")
  >>>     ],
  >>>     [
  >>>       Dr. John Doe \
  >>>       Artos Institute \
  >>>       #link("mailto:doe@artos.edu")
  >>>     ]
  >>>   )
  >>>
  >>>   #par(justify: false)[
  >>>     *Abstract* \
  >>>     #lorem(80)
  >>>   ]
  >>> ]

  = Introduction
  <<< ...
  >>> #lorem(35)

  == Motivation
  <<< ...
  >>> #lorem(45)
  ```,
)

#babel(
  en: [
    This looks great! We used show rules that apply to all headings. In the final show rule, we applied the `smallcaps` function to the complete heading. As we will see in the next example, we can also provide a custom rule to completely override the default look of headings.

    The only remaining problem is that all headings look the same now. The "Motivation" and "Problem Statement" subsections ought to be italic run-in headers, but right now, they look indistinguishable from the section headings. We can fix that by using a `where` selector on our show rule: This is a @reference:scripting:methods[method] we can call on headings (and other elements) that allows us to filter them by their properties. We can use it to differentiate between section and subsection headings:
  ],
  zh-status: "need proofread",
  zh: [
    太棒了！我们用了适用于所有章节标题的show规则。在最后一条show规则中，我们把`smallcaps`函数应用到了整个标题上。正如接下来的例子所示，我们还可以提供自定义规则，完全覆盖标题的默认外观。

    现在唯一剩下的问题是，所有标题看起来都一样。「Motivation」和「Problem Statement」这两个小节应当是斜体的同行标题，但目前它们与一级章节标题毫无分别。解决办法是在show规则上加一个`where`选择器：它是可以在标题（及其它元素）上调用的@reference:scripting:methods[方法]，让我们按其属性筛选元素。用它就能区分章节标题与子章节标题：
  ],
)

#example(
  zoom: (50pt, 250pt, 265pt, 245pt),
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(
  >>>     right + horizon,
  >>>     context document.title,
  >>>   ),
  >>>   numbering: "1",
  >>>   columns: 2,
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  >>>
  #show heading.where(level: 1): set align(center)
  #show heading.where(level: 1): set text(size: 13pt, weight: "regular")
  #show heading.where(level: 1): smallcaps

  #show heading.where(level: 2): set text(
    size: 11pt,
    weight: "regular",
    style: "italic",
  )
  #show heading.where(level: 2): it => {
    it.body + [.]
  }
  >>>
  >>> #place(
  >>>   top + center,
  >>>   float: true,
  >>>   scope: "parent",
  >>>   clearance: 2em,
  >>> )[
  >>>   #show title: set text(size: 17pt)
  >>>   #show title: set align(center)
  >>>   #show title: set block(below: 1.2em)
  >>>
  >>>   #title()
  >>>
  >>>   #grid(
  >>>     columns: (1fr, 1fr),
  >>>     [
  >>>       Therese Tungsten \
  >>>       Artos Institute \
  >>>       #link("mailto:tung@artos.edu")
  >>>     ],
  >>>     [
  >>>       Dr. John Doe \
  >>>       Artos Institute \
  >>>       #link("mailto:doe@artos.edu")
  >>>     ]
  >>>   )
  >>>
  >>>   #par(justify: false)[
  >>>     *Abstract* \
  >>>     #lorem(80)
  >>>   ]
  >>> ]
  >>>
  >>> = Introduction
  >>> #lorem(35)
  >>>
  >>> == Motivation
  >>> #lorem(45)
  ```,
)

In this example, we first scope our previous rules to first-level headings by using `{.where(level: 1)}` to make the selector more specific. Then, we add a show-set rule for the second heading level. Finally, we need a show rule with a custom function: Headings enclose their contents with a block by default. This has the effect that the heading gets its own line. However, we want it to run into the text, so we need to provide our own show rule to get rid of this block.

We provide the rule with a function that takes the heading as a parameter. This parameter is conventionally called `it`, but can have another name. The parameter can be used as content and will just display the whole default heading. Alternatively, when we want to build our own heading instead, we can use its fields like `body`, `numbering`, and `level` to compose a custom look. Here, we are just printing the body of the heading with a trailing dot and leave out the block that the built-in show rule produces. Note that this heading will no longer react to set rules for heading numbering and similar because we did not explicitly use `it.numbering` in the show rule. If you are writing show rules like this and want the document to remain customizable, you will need to take these fields into account.

#babel(
  en: [
    This looks great! We wrote show rules that selectively apply to the first and second level headings. We used a `where` selector to filter the headings by their level. We then rendered the subsection headings as run-ins. We also automatically add a period to the end of the subsection headings.

    Let's review the conference's style guide:
    #checked-list[
      - The font should be an 11pt serif font
      - The title should be in 17pt and bold
      - The paper contains a single-column abstract and two-column main text
      - The abstract should be centered
      - The main text should be justified
      - First level section headings should be centered, rendered in small caps and in 13pt
      - Second level headings are run-ins, italicized and have the same size as the body text
      - Finally, the pages should be US letter sized, numbered in the center and the top right corner of each page should contain the title of the paper
    ]

    We are now in compliance with all of these styles and can submit the paper to the conference! The finished paper looks like this:
  ],
  zh-status: "need proofread",
  zh: [
    太棒了！我们写出的show规则分别只作用于一级和二级章节标题：用`where`选择器按级别筛选标题，然后把子章节标题渲染成同行标题，还会自动在子章节标题末尾加一个句点。

    我们来对照会议的样式规范：
    #checked-list[
      - 字体应为11pt的衬线字体
      - 标题应为17pt粗体
      - 论文含单栏摘要和双栏正文
      - 摘要应居中
      - 正文应两端对齐
      - 一级章节标题应居中，使用小型大写字母，字号13pt
      - 二级标题是同行标题，用斜体，字号与正文相同
      - 最后，页面尺寸应为US letter，页码居中，且每页右上角都应包含论文标题
    ]

    现在这些样式我们全都符合了，可以向会议投稿了！最终论文如下所示：
  ],
)

#docs-figure(
  "3-advanced-paper.png",
  alt: "The finished paper",
  width: 400,
)

= #babel(en: [Review], zh-status: "proofread", zh: [小结]) <review>
#babel(
  en: [
    You have now learned how to create titles, headers, and footers, how to use functions, show-set rules, and scopes to locally override styles, how to create more complex layouts with the @grid function, how to access element properties with context, and how to write show rules for individual functions, and the whole document. You also learned how to use the @reference:styling:show-rules[`where` selector] to filter the headings by their level.

    The paper was a great success! You've met a lot of like-minded researchers at the conference and are planning a project which you hope to publish at the same venue next year. You'll need to write a new paper using the same style guide though, so maybe now you want to create a time-saving template for you and your team?

    In the next section, we will learn how to create templates that can be reused in multiple documents. This is a more advanced topic, so feel free to come back to it later if you don't feel up to it right now.
  ],
  zh-status: "need proofread",
  zh: [
    至此，您已经学会了如何创建标题、页眉和页脚，如何用函数、show-set规则和作用域局部覆盖样式，如何用@grid\函数创建更复杂的布局，如何用context访问元素属性，以及如何为单个函数和整篇文档编写show规则。您还学会了用@reference:styling:show-rules[`where`选择器]按级别筛选章节标题。

    这篇论文大获成功！您在会议上结识了许多志同道合的研究者，并打算做一个项目，希望明年能在同一会议上发表。不过，您需要用同样的样式规范再写一篇新论文，所以现在也许想为自己和团队创建一个省时的模板？

    下一节我们将学习如何创建可在多篇文档中复用的模板。这个主题更进阶，如果现在觉得还没准备好，也可以以后再回来看。
  ],
)
