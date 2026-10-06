#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, example, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Making a Template",
    zh-status: "proofread",
    zh: "制作模板",
  ),
  route: "/tutorial/making-a-template",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    In the previous three chapters of this tutorial, you have learned how to write a document in Typst, apply basic styles, and customize its appearance in-depth to comply with a publisher's style guide. Because the paper you wrote in the previous chapter was a tremendous success, you have been asked to write a follow-up article for the same conference. This time, you want to take the style you created in the previous chapter and turn it into a reusable template. In this chapter you will learn how to create a template that you and your team can use with just one show rule. Let's get started!
  ],
  zh-status: "need proofread",
  zh: [
    在本教程前三章中，您学习了如何在Typst中撰写文档、应用基本样式，并深入自定义外观以符合出版社的样式规范。由于您在上一章写的论文大获成功，有人邀请您为同一会议写一篇后续文章。这一次，您想沿用上一章创建的样式，把它变成可复用的模板。本章您将学习如何创建一个模板，让您和团队只需一条show规则就能使用。让我们开始吧！
  ],
)

= #short-or-long[Variables][Reusing data with variables] <variables>
In the past chapters, most of the content of the document was entered by hand. In the third chapter, we used the `document` element and context to cut down on repetition and only enter the title once. But in practice, there may be many more things that occur multiple times in your document. There are multiple good reasons to just define these repeated values once:

+ It makes changing them later easier
+ It allows you to quickly find all instances where you used something
+ It makes it easy to be consistent throughout
+ For long or hard-to-enter repeated segments, a shorter variable name is often more convenient to type

If you were using a conventional word processor, you might resort to using a placeholder value that you can later search for. In Typst, however, you can instead use variables to safely store content and reuse it across your whole document through a variable name.

The technique of using context to reproduce an element's property we have learned earlier is not always the most appropriate for this: Typst's built-in elements focus on semantic properties like the title and description of a document, or things that directly relate to typesetting, like the text size.

For our example, we want to take a look at Typst's pronunciation. One of the best ways to transcribe pronunciation is the International Phonetic Alphabet (IPA). But because it uses characters not found on common keyboards, typing IPA repeatedly can become cumbersome. So let's instead define a variable that we can reference multiple times.

```typ
#let ipa = [taɪpst]
```

Here, we use a new keyword, `{let}`, to indicate a variable definition. Then, we put the name of our variable, in this case, `ipa`. Finally, we type an equals sign and the value of our variable. It is enclosed in square brackets because it is content, mirroring how you would call a function accepting content. In other words, this syntax mirrors the phrase _"Let the variable `ipa` have the value `{[taɪpst]}`."_

Now, we can use the variable in our document:

```example
#let ipa = [taɪpst]

The canonical way to
pronounce Typst is #ipa.

#table(
  columns: (1fr, 1fr),
  [Name], [Typst],
  [Pronunciation], ipa,
)
```

In the example, you can see that the variable can be used both in markup (prefixed with a `#`) and in a function call (by just typing its name). Of course, we can change the value of the variable and all its occurrences will automatically change with it. Let's make it a bit clearer what is IPA and what is normal prose by rendering IPA in italics. We are also using slashes which, by convention, often enclose IPA.

```example
#let ipa = text(
  style: "italic",
<<< )[/taɪpst/]
>>> box[/taɪpst/])

The canonical way to
pronounce Typst is #ipa.

#table(
  columns: (1fr, 1fr),
  [Name], [Typst],
  [Pronunciation], ipa,
)
```

Here, we called the text function and assigned its _return value_ to the variable. When you call a function, it processes its arguments and then yields another value (often content). So far in this tutorial, we called most functions directly in markup, like this: `[#text(fill: red)[CRIMSON!]]`. This call to the text function returns the red text as a return value. Because we placed it in markup, its return value just immediately got inserted into the content we wrote. With variables, we can instead store it to use it later or compose it with other values.

Variables are not limited to storing content: they can store any data type Typst knows about. Throughout this tutorial, you made use of many data types when you passed them to Typst's built-in functions. Here is an example assigning each of them to a variable:

```typ
// Content with markup inside
#let blind-text = [_Lorem ipsum_ dolor sit amet]

// Unformatted strings
#let funny-font = "MS Comic Sans"

// Absolute lengths (see also pt, in, ...)
#let mile = 160934cm

// Lengths relative to the font size
#let double-space = 2em

// Ratios
#let progress = 80%

// Integer numbers
#let answer = 42

// Booleans
#let truth = false

// Horizontal and vertical alignment
#let focus = center
```

In this chapter of the tutorial, you will leverage variables and your own functions to build templates that can be reused across multiple documents.

= #babel(
  en: short-or-long[Toy Template][A toy template],
  zh-status: "need proofread",
  zh: short-or-long[玩具模板][一个玩具模板],
) <toy-template>
#babel(
  en: [
    In Typst, templates are functions in which you can wrap your whole document. To learn how to do that, let's first review how to write your very own functions. They can do anything you want them to, so why not go a bit crazy?
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，模板就是可以把整篇文档包进去的函数。要学习如何做到这一点，我们先回顾一下如何编写自己的函数。函数可以让它做任何事，那何不玩得疯狂一点？
  ],
)

```example
#let amazed(term) = box[✨ #term ✨]

You are #amazed[beautiful]!
```

#babel(
  en: [
    Comparing this against the previous section, you may have noticed that this looks a lot like a variable definition using `{let}`. This instinct is correct: Functions are just another data type. Here, we are defining the variable `amazed`, assigning it a function that takes a single argument, `term`, and returns content with the `term` surrounded by sparkles. We also put the whole thing in a @box so that the term we are amazed by cannot be separated from its sparkles by a line break. The special function definition syntax makes the definition shorter and more readable, but you can also use the regular variable definition syntax (see @reference:scripting:bindings[the scripting reference] for details). After its definition, we are able to call the function just like all built-in functions.

    Many functions that come with Typst have optional named parameters. Our functions can also have them. Let's add a parameter to our function that lets us choose the color of the text. We need to provide a default color in case the parameter isn't given.
  ],
  zh-status: "need proofread",
  zh: [
    与上一节对比，您可能注意到它很像用`{let}`定义变量。这个直觉是对的：函数只是另一种数据类型。这里我们定义了变量`amazed`，把「接收单个参数`term`、返回被小星星环绕的`term`内容」的函数赋给它。我们还把整个内容放进@box，这样令人惊叹的`term`就不会与星星被换行分开。这种特殊的函数定义语法让定义更简短易读，不过您也可以用普通的变量定义语法（详见@reference:scripting:bindings[脚本参考]）。定义之后，我们就能像调用所有内置函数那样调用它。

    Typst自带的许多函数都有可选的命名参数，我们的函数也可以有。下面给函数加一个参数，用来选择文字颜色。需要提供一个默认颜色，以防调用时没有给出该参数。
  ],
)

```example
#let amazed(term, color: blue) = {
  text(color, box[✨ #term ✨])
}

You are #amazed[beautiful]!
I am #amazed(color: purple)[amazed]!
```

#babel(
  en: [
    Templates now work by wrapping our whole document in a custom function like `amazed`. But wrapping a whole document in a giant function call would be cumbersome! Instead, we can use an "everything" show rule to achieve the same with cleaner code. To write such a show rule, put a colon directly after the show keyword and then provide a function. This function is given the rest of the document as a parameter. The function can then do anything with this content. Since the `amazed` function can be called with a single content argument, we can just pass it by name to the show rule. Let's try it:
  ],
  zh-status: "need proofread",
  zh: [
    模板的用法是：用一条「所有内容」show规则把自定义函数应用到整篇文档。我们来用`amazed`函数试一试。
  ],
)

```example
>>> #let amazed(term, color: blue) = {
>>>   text(color, box[✨ #term ✨])
>>> }
#show: amazed
I choose to focus on the good
in my life and let go of any
negative thoughts or beliefs.
In fact, I am amazing!
```

#babel(
  en: [
    Our whole document will now be passed to the `amazed` function, as if we wrapped it around it. Of course, this is not especially useful with this particular function, but when combined with set rules and named arguments, it can be very powerful.
  ],
  zh-status: "need proofread",
  zh: [
    现在整篇文档都会被传给`amazed`函数，就像我们把它包在`amazed`外面一样。当然，对这个特定函数来说这没什么用，但把它和set规则、命名参数结合起来，就会非常强大。
  ],
)

= #babel(
  en: short-or-long[Set And Show Rules][Embedding set and show rules],
  zh-status: "need proofread",
  zh: short-or-long[set与show规则][嵌入set和show规则],
) <set-and-show-rules>
#babel(
  en: [
    To apply some set and show rules to our template, we can use `set` and `show` within a content block in our function and then insert the document into that content block.
  ],
  zh-status: "need proofread",
  zh: [
    要给模板应用一些set规则和show规则，可以在函数内的内容块里使用`set`和`show`，再把文档插入该内容块。
  ],
)

```example
#let template(doc) = [
  #set text(font: "Inria Serif")
  #show "something cool": [Typst]
  #doc
]

#show: template
I am learning something cool today.
It's going great so far!
```

#babel(
  en: [
    Just like we already discovered in the previous chapter, set rules will apply to everything within their content block. Since the everything show rule passes our whole document to the `template` function, the text set rule and string show rule in our template will apply to the whole document. Let's use this knowledge to create a template that reproduces the body style of the paper we wrote in the previous chapter.
  ],
  zh-status: "need proofread",
  zh: [
    正如上一章所述，set规则会作用于其内容块内的所有内容。由于「所有内容」show规则会把整篇文档传给`template`函数，模板里的`text` set规则和字符串show规则就会作用于整篇文档。下面用这些知识创建一个模板，复现上一章论文的正文样式。
  ],
)

```example
#let conf(title, doc) = {
  set page(
    paper: "us-letter",
>>> margin: auto,
    header: align(
      right + horizon,
      title
    ),
>>> numbering: "1",
    columns: 2,
<<<     ...
  )
  set par(justify: true)
  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  // Heading show rules.
<<<   ...
>>> show heading.where(level: 1): set align(center)
>>> show heading.where(level: 1): set text(size: 13pt, weight: "regular")
>>> show heading.where(level: 1): smallcaps
>>>
>>> show heading.where(level: 2): set text(
>>>   size: 11pt,
>>>   weight: "regular",
>>>   style: "italic",
>>> )
>>> show heading.where(
>>>   level: 2
>>> ): it => {
>>>   it.body + [.]
>>> }

  doc
}

#show: doc => conf(
  [Paper title],
  doc,
)

= Introduction
<<< ...
>>> #lorem(90)
>>>
>>> == Motivation
>>> #lorem(140)
>>>
>>> == Problem Statement
>>> #lorem(50)
>>>
>>> = Related Work
>>> #lorem(200)
```

#babel(
  en: [
    We copy-pasted most of that code from the previous chapter. The two differences are this:

    + We wrapped everything in the function `conf` using an everything show rule. The function applies a few set and show rules and echoes the content it has been passed at the end.

    + Moreover, we used a curly-braced code block instead of a content block. This way, we don't need to prefix all set rules and function calls with a `#`. In exchange, we cannot write markup directly in the code block anymore.

    Also note where the title comes from: We previously had it inside of a variable. Now, we are receiving it as the first parameter of the template function. To do so, we passed a closure (that's a function without a name that is used right away) to the everything show rule. We did that because the `conf` function expects two positional arguments, the title and the body, but the show rule will only pass the body. Therefore, we add a new function definition that allows us to set a paper title and use the single parameter from the show rule.
  ],
  zh-status: "need proofread",
  zh: [
    我们复制粘贴了上一章中的大部分代码。区别只有两处：

    + 我们用「所有内容」show规则把所有内容都包进了函数`conf`。该函数会应用几条set规则和show规则，并在末尾原样输出传给它的内容。

    + 此外，我们用的是大括号脚本块，而不是内容块。这样就不必给所有set规则和函数调用都加上`#`前缀；代价是不能再在脚本块里直接写标记。

    还要注意标题从何而来：以前它放在变量里，现在我们把它作为模板函数的第一个参数接收。为此，我们给「所有内容」show规则传了一个闭包（即没有名字、定义后立即使用的函数）。这样做是因为`conf`函数需要两个位置参数——标题和正文，而show规则只会传入正文。于是我们新增一个函数定义，以便能设置论文标题，并使用show规则传入的单个参数。
  ],
)

= #babel(
  en: short-or-long[Named Arguments][Templates with named arguments],
  zh-status: "need proofread",
  zh: short-or-long[命名参数][带命名参数的模板],
) <named-arguments>
#babel(
  en: [
    Our paper in the previous chapter had a title and an author list. We can keep the title as @document metadata, but our template should also accept a list of authors with their affiliations and the paper's abstract. We'll add those as named arguments. In the end, we want it to work like this:
  ],
  zh-status: "need proofread",
  zh: [
    上一章的论文有标题和作者列表。我们可以把标题保留为@document\元数据，同时让模板还接受作者列表（含姓名、单位、邮箱）和论文摘要，把它们作为命名参数加入。最后我们希望它这样用：
  ],
)

```typ
#set document(title: [
  A Fluid Dynamic Model for
  Glacier Flow
])

#show: doc => conf(
  authors: (
    (
      name: "Theresa Tungsten",
      affiliation: "Artos Institute",
      email: "tung@artos.edu",
    ),
    (
      name: "Eugene Deklan",
      affiliation: "Honduras State",
      email: "e.deklan@hstate.hn",
    ),
  ),
  abstract: lorem(80),
  doc,
)

...
```

#babel(
  en: [
    Let's build this new template function. The title can be displayed with the @title function and accessed through `document.title`, so the template only needs named `authors` and `abstract` parameters with empty defaults. Next, we copy the code that generates title, abstract and authors from the previous chapter into the template, replacing the fixed details with the parameters.

    The new `authors` parameter expects an @array[array] of @dictionary[dictionaries] with the keys `name`, `affiliation` and `email`. Because we can have an arbitrary number of authors, we dynamically determine if we need one, two or three columns for the author list. First, we determine the number of authors using the @array.len[`.len()`] method on the `authors` array. Then, we set the number of columns as the minimum of this count and three, so that we never create more than three columns. If there are more than three authors, a new row will be inserted instead. For this purpose, we have also added a `row-gutter` parameter to the `grid` function. Otherwise, the rows would be too close together. To extract the details about the authors from the dictionary, we use the @reference:scripting:fields[field access syntax].

    We still have to provide an argument to the grid for each author: Here is where the array's @array.map[`map` method] comes in handy. It takes a function as an argument that gets called with each item of the array. We pass it a function that formats the details for each author and returns a new array containing content values. We've now got one array of values that we'd like to use as multiple arguments for the grid. We can do that by using the @arguments[`spread` operator]. It takes an array and applies each of its items as a separate argument to the function.

    The resulting template function looks like this:
  ],
  zh-status: "need proofread",
  zh: [
    我们来构建这个新模板函数。标题可以用@title\函数显示，并通过`document.title`访问，所以模板只需新增命名参数`authors`和`abstract`，默认值为空。接着，我们把上一章中生成标题、摘要和作者列表的代码复制进模板，用参数替换其中写死的部分。

    新的`authors`参数接收一个@array[数组]，其中每个元素是带`name`、`affiliation`和`email`键的@dictionary[字典]。作者数量任意，因此我们动态判断作者列表需要一列、两列还是三列。首先，用@array.len[`.len()`]方法在`authors`数组上求出作者数量。然后把列数设为该数量与3的较小值，这样最多只会有三列；作者超过三名时会另起一行。为此，我们还给`grid`函数加了`row-gutter`参数，否则各行会挨得太近。要从字典里取出作者信息，用@reference:scripting:fields[字段访问语法]。

    我们还得为每位作者向网格传一个参数：这正是数组的@array.map[`map`方法]的用武之地。它接收一个函数作为参数，并对数组的每一项调用它。我们传入的函数会格式化每位作者的信息，并返回一个包含内容值的新数组。现在有了一个值数组，想把它当作网格的多个参数使用，可以用@arguments[`spread`操作符]：它接收一个数组，把其中每一项作为单独的参数传给函数。

    最终的模板函数如下所示：
  ],
)

```typ
#let conf(
  authors: (),
  abstract: [],
  doc,
) = {
  // Set and show rules from before.
  // ...

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      title()

      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 24pt,
        ..authors.map(author => [
          #author.name \
          #author.affiliation \
          #link("mailto:" + author.email)
        ]),
      )

      par(justify: false)[
        *Abstract* \
        #abstract
      ]

    }
  )

  doc
}
```

= #babel(
  en: short-or-long[Separate File][A separate file],
  zh-status: "need proofread",
  zh: short-or-long[单独的文件][单独的模板文件],
) <separate-file>
#babel(
  en: [
    Most of the time, a template is specified in a different file and then imported into the document. This way, the main file you write in is kept clutter free and your template is easily reused. Create a new text file in the file panel by clicking the plus button and name it `conf.typ`. Move the `conf` function definition inside of that new file. Now you can access it from your main file by adding an import before the show rule. Specify the path of the file between the `{import}` keyword and a colon, then name the function that you want to import.
  ],
  zh-status: "need proofread",
  zh: [
    多数情况下，模板会放在另一个文件里，再导入到文档中。这样，您编写的主文件能保持整洁，模板也便于复用。在文件面板中单击加号按钮新建一个文本文件，命名为`conf.typ`，把`conf`函数的定义移进这个新文件。现在，只要在主文件的show规则之前加一条导入，就能访问它。在`{import}`关键字和冒号之间写上文件路径，然后写明要导入的函数名。
  ],
)

Another thing that you can do to make applying templates just a bit more elegant is to use the @function.with[`.with`] method on functions to pre-populate all the named arguments. This way, you can avoid spelling out a closure and appending the content argument at the bottom of your template list. Templates on #link("https://typst.app/universe")[Typst Universe] are designed to work with this style of function call.

#example(
  single: true,
  ```
  >>> #let conf(
  >>>   authors: (),
  >>>   abstract: [],
  >>>   doc,
  >>> ) = {
  >>>   set page(
  >>>     "us-letter",
  >>>     margin: auto,
  >>>     header: align(
  >>>       right + horizon,
  >>>       context document.title,
  >>>     ),
  >>>     numbering: "1",
  >>>     columns: 2,
  >>>   )
  >>>   set par(justify: true)
  >>>   set text(font: "Libertinus Serif", 11pt)
  >>>   show title: set text(size: 17pt)
  >>>   show title: set align(center)
  >>>   show title: set block(below: 1.2em)
  >>>
  >>>   show heading.where(level: 1): set align(center)
  >>>   show heading.where(level: 1): set text(size: 13pt, weight: "regular")
  >>>   show heading.where(level: 1): smallcaps
  >>>
  >>>   show heading.where(level: 2): set text(
  >>>     size: 11pt,
  >>>     weight: "regular",
  >>>     style: "italic",
  >>>   )
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => {
  >>>     it.body + [.]
  >>>   }
  >>>
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => text(
  >>>     size: 11pt,
  >>>     weight: "regular",
  >>>     style: "italic",
  >>>     it.body + [.],
  >>>   )
  >>>
  >>>   place(
  >>>     top + center,
  >>>     float: true,
  >>>     scope: "parent",
  >>>     clearance: 2em,
  >>>     {
  >>>       title()
  >>>
  >>>       let count = authors.len()
  >>>       let ncols = calc.min(count, 3)
  >>>       grid(
  >>>         columns: (1fr,) * ncols,
  >>>         row-gutter: 24pt,
  >>>         ..authors.map(author => [
  >>>           #author.name \
  >>>           #author.affiliation \
  >>>           #link("mailto:" + author.email)
  >>>         ]),
  >>>       )
  >>>
  >>>       par(justify: false)[
  >>>         *Abstract* \
  >>>         #abstract
  >>>       ]
  >>>     }
  >>>   )
  >>>
  >>>   doc
  >>> }
  <<< #import "conf.typ": conf

  #set document(title: [
    A Fluid Dynamic Model for
    Glacier Flow
  ])

  #show: conf.with(
    authors: (
      (
        name: "Theresa Tungsten",
        affiliation: "Artos Institute",
        email: "tung@artos.edu",
      ),
      (
        name: "Eugene Deklan",
        affiliation: "Honduras State",
        email: "e.deklan@hstate.hn",
      ),
    ),
    abstract: lorem(80),
  )

  = Introduction
  #lorem(90)

  == Motivation
  #lorem(140)

  == Problem Statement
  #lorem(50)

  = Related Work
  #lorem(200)
  ```,
)

#babel(
  en: [
    We have now converted the conference paper into a reusable template for that conference! Why not share it in the #link("https://forum.typst.app/")[Forum] or on #link("https://discord.gg/2uDybryKPe")[Typst's Discord server] so that others can use it too?
  ],
  zh-status: "need proofread",
  zh: [
    现在我们已经把会议论文变成了该会议的可复用模板！何不把它分享到#link("https://forum.typst.app/")[论坛]或#link("https://discord.gg/2uDybryKPe")[Typst的Discord服务器]上，让其他人也能用呢？
  ],
)

= #babel(en: [Review], zh-status: "proofread", zh: [总结]) <review>
#babel(
  en: [
    Congratulations, you have completed Typst's Tutorial! In this section, you have learned how to define your own functions and how to create and apply templates that define reusable document styles. You've made it far and learned a lot. You can now use Typst to write your own documents and share them with others.

    We are still a super young project and are looking for feedback. If you have any questions, suggestions or you found a bug, please let us know in the #link("https://forum.typst.app/")[Forum], on our #link("https://discord.gg/2uDybryKPe")[Discord server], on #link("https://github.com/typst/typst/")[GitHub], or via the web app's feedback form (always available in the Help menu).

    So what are you waiting for? #link("https://typst.app")[Sign up] and write something!
  ],
  zh-status: "need proofread",
  zh: [
    恭喜，您完成了Typst的教程！在本节中，您学习了如何定义自己的函数，以及如何创建和应用定义可复用文档样式的模板。您一路走来，收获颇丰。现在您可以用Typst撰写自己的文档，并分享给他人了。

    我们仍是一个非常年轻的项目，期待您的反馈。如果您有任何问题、建议，或发现了bug，欢迎到#link("https://forum.typst.app/")[论坛]、我们的#link("https://discord.gg/2uDybryKPe")[Discord服务器]、#link("https://github.com/typst/typst/")[GitHub]上告诉我们，也可以通过在线应用里的反馈表单（始终可在帮助菜单中找到）。

    那还等什么？快#link("https://typst.app")[注册]并写点什么吧！
  ],
)
