#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-figure, info, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Writing in Typst",
    zh-status: "need proofread",
    zh: "使用Typst写作",
  ),
  route: "/tutorial/writing-in-typst",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    Let's get started! Suppose you got assigned to write a technical report for university. It will contain prose, maths, headings, and figures. To get started, you create a new project on the Typst app. You'll be taken to the editor where you see two panels: A source panel where you compose your document and a preview panel where you see the rendered document.
  ],
  zh-status: "need proofread",
  zh: [
    让我们开始吧！假设你被要求为大学写一份技术报告，报告将包含文字、数学公式、标题和图表。  首先，请在 Typst App 上创建一个新项目。你将会看见一个分为两个面板的编辑器：  用于撰写文档的代码面板和查看渲染文档的预览面板。
  ],
)

#docs-figure(
  "1-writing-app.png",
  alt: "Typst app screenshot",
  shadow: false,
)

#babel(
  en: [
    You already have a good angle for your report in mind. So let's start by writing the introduction. Enter some text in the editor panel. You'll notice that the text immediately appears on the previewed page.
  ],
  zh-status: "need proofread",
  zh: [
    您在心中对报告内容的方向已经有了不错的想法。那么，让我们从写报告的介绍开始。在编辑器面板中输入一些文本，您会注意到文本会立即显示在预览的页面上。
  ],
)

```example
In this report, we will explore the
various factors that influence fluid
dynamics in glaciers and how they
contribute to the formation and
behaviour of these natural structures.
```

#babel(
  en: [
    _Throughout this tutorial, we'll show code examples like this one. Just like in the app, the first panel contains markup and the second panel shows a preview. We shrunk the page to fit the examples so you can see what's going on._
  ],
  zh-status: "need proofread",
  zh: [
    _在本教程中，我们将展示与此类似的代码示例。就像在App中一样，第一个面板包含标记文本，第二个面板显示文稿预览。我们缩小了页面以适应示例，以便您看得更清楚。_
  ],
)

#babel(
  en: [
    The next step is to add a heading and emphasize some text. Typst uses simple markup for the most common formatting tasks. To add a heading, enter the `=` character and to emphasize some text with italics, enclose it in `[_underscores_]`.
  ],
  zh-status: "need proofread",
  zh: [
    下一步是添加标题并对一些文本进行强调。Typst对最常见的格式使用简单的标记（markup）。要添加标题，请输入`=`字符，要用斜体强调某些文本，请将其括在`[_下划线_]`中。
  ],
)

```example
= Introduction
In this report, we will explore the
various factors that influence _fluid
dynamics_ in glaciers and how they
contribute to the formation and
behaviour of these natural structures.
```

#babel(
  en: [
    That was easy! To add a new paragraph, just add a blank line in between two lines of text. If that paragraph needs a subheading, produce it by typing `==` instead of `=`. The number of `=` characters determines the nesting level of the heading.

    Now we want to list a few of the circumstances that influence glacier dynamics. To do that, we use a numbered list. For each item of the list, we type a `+` character at the beginning of the line. Typst will automatically number the items.
  ],
  zh-status: "need proofread",
  zh: [
    这很简单！要添加新段落，只需在两行文本之间添加一个空行即可。如果该段落需要副标题，请输入`==`而非`=`来生成它。`=`字符的数量决定了标题的嵌套级别。

    现在我们想列出一些影响冰川动力学的因素。为此，我们使用有序列表。对于列表中的每个项目，我们在行首输入`+`字符。Typst将自动对项目进行编号。
  ],
)

```example
+ The climate
+ The topography
+ The geology
```

#babel(
  en: [
    If we wanted to add a bulleted list, we would use the `-` character instead of the `+` character. We can also nest lists: For example, we can add a sub-list to the first item of the list above by indenting it.
  ],
  zh-status: "need proofread",
  zh: [
    如果我们想添加一个无序列表，则应使用`-`字符而非`+`字符。我们还可以嵌套列表：例如，我们可以通过缩进将无序列表作为一个子列表，添加到上面列表的第一项中。
  ],
)

```example
+ The climate
  - Temperature
  - Precipitation
+ The topography
+ The geology
```

= #babel(en: short-or-long[Figure][Adding a figure], zh-status: "need proofread", zh: [加入图表]) <figure>
#babel(
  en: [
    You think that your report would benefit from a figure. Let's add one. Typst supports images in the formats PNG, JPEG, GIF, SVG, PDF, and WebP. To add an image file to your project, first open the _file panel_ by clicking the box icon in the left sidebar. Here, you can see a list of all files in your project. Currently, there is only one: The main Typst file you are writing in. To upload another file, click the button with the arrow in the top-right corner. This opens the upload dialog, in which you can pick files to upload from your computer. Select an image file for your report.
  ],
  zh-status: "need proofread",
  zh: [
    您认为图片对一份优秀的报告至关重要，所以现在让我们添加一个图片。Typst支持PNG、JPEG、GIF和SVG格式的图像。要将图像文件添加到项目中，请先通过单击左侧边栏中的箱子图标打开_文件面板_。在这里，您可以看到项目中所有文件的列表。目前，这里只有一个文件：您正在编辑的Typst主文件。要上传其他文件，请单击右上角带有箭头的按钮。这将打开一个上传对话框，您可以在其中选择要从计算机上传的文件。请为你的报告选择一个图像文件。
  ],
)

#docs-figure(
  "1-writing-upload.png",
  alt: "Upload dialog",
  shadow: false,
)

#babel(
  en: [
    We have seen before that specific symbols (called _markup_) have specific meaning in Typst. We can use `=`, `-`, `+`, and `_` to create headings, lists and emphasized text, respectively. However, having a special symbol for everything we want to insert into our document would soon become cryptic and unwieldy. For this reason, Typst reserves markup symbols only for the most common things. Everything else is inserted with _functions._ For our image to show up on the page, we use Typst's @image function.
  ],
  zh-status: "need proofread",
  zh: [
    我们之前已经看到，特定的符号（称为_标记（markup）_）在Typst中具有特定的含义。我们可以使用`=`、`-`、`+`和`_`分别创建标题、列表和强调文本。但是，若是为我们想要插入到文档中的所有内容都设置一个特殊符号，很快语法就会变得怪异且笨拙。为此，Typst只为最常见的内容保留标记符号。其他所有内容都将通过_函数_来插入。为了使图像显示在页面上，我们使用Typst的@image\函数。
  ],
)

```example
#image("glacier.jpg")
```

#babel(
  en: [
    In general, a function produces some output for a set of _arguments_. When you _call_ a function within markup, you provide the arguments and Typst inserts the result (the function's _return value_) into the document. In our case, the `image` function takes one argument: The path to the image file. To call a function in markup, we first need to type the `#` character, immediately followed by the name of the function. Then, we enclose the arguments in parentheses. Typst recognizes many different data types within argument lists. Our file path is a short @str[string of text], so we need to enclose it in double quotes.

    The inserted image uses the whole width of the page. To change that, pass the `width` argument to the `image` function. This is a _named_ argument and therefore specified as a `name: value` pair. If there are multiple arguments, they are separated by commas, so we first need to put a comma behind the path.
  ],
  zh-status: "need proofread",
  zh: [
    通常，函数会为一组_参数_生成一些输出。当您在标记模式中_调用_函数时，在读取到您输入的参数后，Typst会将结果（函数的_返回值_）插入到文档中。在我们的例子中，`image`函数接受一个参数：图像文件的路径。要在标记模式中调用函数，我们首先需要键入`#`字符，并且紧跟函数的名称。然后，我们将参数括在括号中。Typst可识别参数列表中的许多不同数据类型，我们的文件路径是一个较短的@str[文本字符串]，所以我们需要用双引号括起来。

    插入的图像默认宽度为页面宽度。要更改宽度，请将`width`参数传递给`image`函数。这是一个_命名（named）_参数，因此被指定为`name: value`对。如果有多个参数，则逗号分隔它们，所以我们首先需要在路径参数后面加上一个逗号。
  ],
)

```example
#image("glacier.jpg", width: 70%)
```

#babel(
  en: [
    The `width` argument is a @relative[relative length]. In our case, we specified a percentage, determining that the image shall take up `{70%}` of the page's width. We also could have specified an absolute value like `{1cm}` or `{0.7in}`.

    Just like text, the image is now aligned at the left side of the page by default. It's also lacking a caption. Let's fix that by using the @figure[figure] function. This function takes the figure's contents as a positional argument and an optional caption as a named argument.

    Within the argument list of the `figure` function, Typst is already in code mode. This means, you now have to remove the hash before the image function call. The hash is only needed directly in markup (to disambiguate text from function calls).

    The caption consists of arbitrary markup. To give markup to a function, we enclose it in square brackets. This construct is called a _content block._
  ],
  zh-status: "need proofread",
  zh: [
    `width`参数传入的参数表示一个@relative[相对长度]。在我们的例子中，我们指定了一个百分比，确定图像应占据页面宽度的`{70%}`。我们也可以指定一个绝对值，如`{1cm}`或`{0.7in}`。

    就像文本一样，默认情况下，图像现在在页面左侧对齐，并且它也缺少说明（caption）。让我们使用@figure[figure]函数来解决这个问题。该函数将图表的内容作为位置参数，将可选的说明（caption）作为命名参数。

    在`figure`函数的参数列表中，Typst已经处于代码模式。这意味着，您现在可以在`image`函数调用的前面删除井号。井号仅在标记模式时才用的到（它被用来消除函数调用中的文本歧义）。

    标题由任意标记文本组成。为了给函数提供标记文本，我们将其括在方括号中。此被称为_内容块_。
  ],
)

```example
#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
)
```

#babel(
  en: [
    You continue to write your report and now want to reference the figure. To do that, first attach a label to figure. A label uniquely identifies an element in your document. Add one after the figure by enclosing some name in angle brackets. You can then reference the figure in your text by writing an `[@]` symbol followed by that name. Headings and equations can also be labelled to make them referenceable.
  ],
  zh-status: "need proofread",
  zh: [
    您继续编写报告，现在想要引用该图表。为此，首先在图表上贴上标签。标签用于唯一标识文档中的元素，你只需要通过在尖括号中将标签名称括起来，并在图表后加入。然后，您可以通过在文本中键入`[@]`符号，后面跟标签名称来引用该图表。标题和表达式也可以加入标签，以使其可引用。
  ],
)

```example
Glaciers as the one shown in
@glaciers will cease to exist if
we don't take action soon!

#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
) <glaciers>
```

#info[
  #babel(
    en: [
      So far, we've passed content blocks (markup in square brackets) and strings (text in double quotes) to our functions. Both seem to contain text. What's the difference?

      A content block can contain text, but also any other kind of markup, function calls, and more, whereas a string is really just a _sequence of characters_ and nothing else.

      For example, the image function expects a path to an image file. It would not make sense to pass, e.g., a paragraph of text or another image as the image's path parameter. That's why only strings are allowed here. In contrast, strings work wherever content is expected because text is a valid kind of content.
    ],
    zh-status: "need proofread",
    zh: [
      到目前为止，我们已经将内容块（方括号中的标记文本）和字符串（双引号中的文本）传递给我们的函数。  两者都似乎包含文本，它们有什么区别呢？

      内容块可以包含文本，也可以包含任何其他类型的标记、函数调用等，  而字符串实际上只是 _字符构成的串_，不包含其他内容。

      例如，`image` 函数需要图像文件的路径，而将一段文本或另一张图像，作为图像的路径参数传递是没有意义的。  这就是为什么这里只允许输入字符串作为参数。  相反，字符串适用于任何需要内容块的地方，因为文本是一种有效的内容块。
    ],
  )
]

= #babel(
  en: short-or-long[Bibliography][Adding a bibliography],
  zh-status: "need proofread",
  zh: [添加参考文献],
) <bibliography>
#babel(
  en: [
    As you write up your report, you need to back up some of your claims. You can add a bibliography to your document with the @bibliography function. This function expects a path to a bibliography file.

    Typst's native bibliography format is #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva], but for compatibility you can also use BibLaTeX files. As your classmate has already done a literature survey and sent you a `.bib` file, you'll use that one. Upload the file through the file panel to access it in Typst.

    Once the document contains a bibliography, you can start citing from it. Citations use the same syntax as references to a label. As soon as you cite a source for the first time, it will appear in the bibliography section of your document. Typst supports different citation and bibliography styles. Consult the @bibliography.style[reference] for more details.
  ],
  zh-status: "need proofread",
  zh: [
    在撰写报告时，您需要引用资料来支持您的一些论证。您可以使用@bibliography\函数向文档添加参考文献。此函数需要参考文献文件的路径。

    Typst的原生参考文献格式是#link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva]，考虑到兼容性，Typst同样支持BibLaTeX文件。由于您的同学已经完成了文献调查并向您发送了`.bib`文件，您可以直接使用该文件。请在文件面板中上传文件，以在Typst App中访问它。

    一旦文档引入了参考文献，您就可以引用它了。引用参考文献的语法与对标签的引用相同。在您第一次引用一个资料来源后，它就会出现在您文档的参考文献部分。Typst支持不同的引用和参考文献样式。有关的详细信息，请阅读@bibliography.style[参考]。
  ],
)

```example
= Methods
We follow the glacier melting models
established in @glacier-melt.

#bibliography("works.bib")
```

= #babel(en: [Maths], zh-status: "need proofread", zh: [数学]) <maths>
#babel(
  en: [
    After fleshing out the methods section, you move on to the meat of the document: Your equations. Typst has built-in mathematical typesetting and uses its own math notation. Let's start with a simple equation. We wrap it in `[$]` signs to let Typst know it should expect a mathematical expression:
  ],
  zh-status: "need proofread",
  zh: [
    充实了方法部分后，您继续完成这篇文稿的实质部分：数学公式。Typst具有内置的数学排版引擎，并使用自己的数学记号。让我们从一个简单的等式开始。我们使用`[$]`符号括住它，让Typst知道它正在处理一个数学表达式：
  ],
)

```example
The equation $Q = rho A v + C$
defines the glacial flow rate.
```

#babel(
  en: [
    The equation is typeset inline, on the same line as the surrounding text. If you want to have it on its own line instead, you should insert a single space at its start and end:
  ],
  zh-status: "need proofread",
  zh: [
    公式是内联排版的，与周围的文本在同一行上。  如果你想把它放在它自己的新行上，你应该在其开头和结尾插入一个空格：
  ],
)

```example
The flow rate of a glacier is
defined by the following equation:

$ Q = rho A v + C $
```

#babel(
  en: [
    We can see that Typst displayed the single letters `Q`, `A`, `v`, and `C` as-is, while it translated `rho` into a Greek letter. Math mode will always show single letters verbatim. Multiple letters, however, are interpreted as symbols, variables, or function names. To imply a multiplication between single letters, put spaces between them.

    If you want to have a variable that consists of multiple letters, you can enclose it in quotes:
  ],
  zh-status: "need proofread",
  zh: [
    我们可以看到，Typst按原样显示单个字母`Q`，`A`，`v`和`C`，而它将`rho`翻译成希腊字母。数学模式将始终原样地显示单个字母。然而，多个字母将被视作为符号、变量或函数名称。要隐式地表明这是单个字母之间的乘法，请在它们之间加入空格。

    如果你想要一个由多个字母组成的变量，你可以用引号括起来：
  ],
)

```example
The flow rate of a glacier is given
by the following equation:

$ Q = rho A v + "time offset" $
```

#babel(
  en: [
    You'll also need a sum formula in your paper. We can use the `sum` symbol and then specify the range of the summation in sub- and superscripts:
  ],
  zh-status: "need proofread",
  zh: [
    您还需要在论文中加入一个求和公式。我们可以使用`sum`符号，然后在下标和上标中指定求和的范围：
  ],
)

```example
Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla Q_i / 2 $
```

#babel(
  en: [
    To add a subscript to a symbol or variable, type a `_` character and then the subscript. Similarly, use the `^` character for a superscript. If your sub- or superscript consists of multiple things, you must enclose them in round parentheses.

    The above example also showed us how to insert fractions: Simply put a `/` character between the numerator and the denominator and Typst will automatically turn it into a fraction. Parentheses are smartly resolved, so you can enter your expression as you would into a calculator and Typst will replace parenthesized sub-expressions with the appropriate notation.
  ],
  zh-status: "need proofread",
  zh: [
    要向符号或变量添加下标，请输入`_`字符，然后输入下标。同样，为上标使用`^`字符。如果下标或上标由多个内容部分组成，则必须将它们括在圆括号中。

    上面的例子还向我们展示了如何插入分数：只需在分子和分母之间放置一个`/`字符，Typst就会自动将其变成分数。括号会被巧妙地解析，因此您可以像在计算器中一样输入数学表达式，Typst将用适当的符号替换括号中的子表达式。
  ],
)

```example
Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 $
```

#babel(
  en: [
    Not all math constructs have special syntax. Instead, we use functions, just like the `image` function we have seen before. For example, to insert a column vector, we can use the @math.vec[`vec`] function. Within math mode, function calls don't need to start with the `#` character.
  ],
  zh-status: "need proofread",
  zh: [
    并非所有数学结构都有特殊的语法。作为替代，我们会使用函数，就像我们之前看到的`image`函数一样。例如，要插入列向量，我们可以使用@math.vec[`vec`]函数。在数学模式下，函数调用不需要以`#`字符开头。
  ],
)

```example
$ v := vec(x_1, x_2, x_3) $
```

#babel(
  en: [
    Some functions are only available within math mode. For example, the @math.cal[`cal`] function is used to typeset calligraphic letters commonly used for sets. The @math[math section of the reference] provides a complete list of all functions that math mode makes available.

    One more thing: Many symbols, such as the arrow, have a lot of variants. You can select among these variants by appending a dot and a modifier name to a symbol's name:
  ],
  zh-status: "need proofread",
  zh: [
    某些函数仅在数学模式下可用。例如，@math.cal[`cal`]函数用于排版通常用于集合论的书法字母。@math[参考中的数学部分]提供了数学模式支持的所有函数的完整列表。

    还有一件事：许多符号（如箭头）有很多变体。您可以通过在符号名称后附加点和修饰符名称来选择这些变体：
  ],
)

```example
$ a arrow.squiggly b $
```

#babel(
  en: [
    This notation is also available in markup mode, but the symbol name must be preceded with `#sym.` there. See the @sym[symbols section] for a list of all available symbols.
  ],
  zh-status: "need proofread",
  zh: [
    这种记号在标记模式下也可以使用，但符号名称前面必须带有`#sym`。有关所有可用符号的列表，请参阅@sym[符号部分]。
  ],
)

= #babel(en: [Review], zh-status: "need proofread", zh: [回顾]) <review>
#babel(
  en: [
    You have now seen how to write a basic document in Typst. You learned how to emphasize text, write lists, insert images, align content, and typeset mathematical expressions. You also learned about Typst's functions. There are many more kinds of content that Typst lets you insert into your document, such as @table[tables], @reference:visualize[shapes], and @raw[code blocks]. You can peruse the @reference[reference] to learn more about these and other features.

    For the moment, you have completed writing your report. You have already saved a PDF by clicking on the download button in the top right corner. However, you think the report could look a bit less plain. In the next section, we'll learn how to customize the look of our document.
  ],
  zh-status: "need proofread",
  zh: [
    现在您已经了解了如何在Typst中编写基本的文档，包括如何强调文本、编写列表、插入图像、对齐内容和排版数学表达式。您还了解了Typst的函数机制。Typst允许您将更多种类的内容插入到文档中，例如@table[表格]、@reference:visualize[形状]和@raw[代码块]。您可以仔细阅读@reference[参考]以了解有关这些函数和其他函数的更多信息。

    目前，您已完成报告的编写。您已经通过单击右上角的下载按钮保存了PDF。但您可能认为报告看起来不应该那么朴素。在下一节中，我们将学习如何自定义文档的外观。
  ],
)
