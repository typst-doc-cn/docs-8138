#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, example, info, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Guide for LaTeX Users",
    zh-status: "proofread",
    zh: "LaTeX用户指南",
  ),
  route: "/guides/for-latex-users",
  description: babel(
    en: "Are you a LaTeX user? This guide explains the differences and similarities between Typst and LaTeX so you can get started quickly.",
    zh-status: "need proofread",
    zh: "您是LaTeX用户吗？本指南介绍了Typst与LaTeX的异同，助您快速上手。",
  ),
)

#babel(
  en: [
    This page is a good starting point if you have used LaTeX before and want to try out Typst. We will explore the main differences between these two systems from a user perspective. Although Typst is not built upon LaTeX and has a different syntax, you will learn how to use your LaTeX skills to get a head start.

    Just like LaTeX, Typst is a markup-based typesetting system: You compose your document in a text file and mark it up with commands and other syntax. Then, you use a compiler to typeset the source file into a PDF. However, Typst also differs from LaTeX in several aspects: For one, Typst uses more dedicated syntax (like you may know from Markdown) for common tasks. Typst's commands are also more principled: They all work the same, so unlike in LaTeX, you just need to understand a few general concepts instead of learning different conventions for each package. Moreover Typst compiles faster than LaTeX: Compilation usually takes milliseconds, not seconds, so the web app and the compiler can both provide instant previews.

    In the following, we will cover some of the most common questions a user switching from LaTeX will have when composing a document in Typst. If you prefer a step-by-step introduction to Typst, check out our @tutorial[tutorial].
  ],
  zh-status: "need proofread",
  zh: [
    如果您使用过LaTeX并想尝试Typst，这篇文章是个很好的入门指南。我们将从用户的角度出发，探讨这两套系统之间的主要区别。虽然Typst并不基于LaTeX，语法也完全不同，但您将学会如何利用已有的LaTeX经验快速上手。

    跟LaTeX一样，Typst是一门基于标记的排版系统：您在文本文件中撰写文档，并用命令和其他语法为其添加标记；然后使用编译器将源文件排版为PDF。不过，Typst在以下几个方面与LaTeX有所不同。其一，对于常见任务，Typst使用更专用的语法（您可能从Markdown中有所了解）。Typst的命令也更有章法：它们的工作方式完全一致，因此不同于LaTeX，您只需理解少量通用概念，而不必为每个包学习不同的约定。此外，Typst比LaTeX编译得更快：编译通常只需几毫秒，而非几秒，所以在线应用和编译器都能提供即时预览。

    下面，我们将回答从LaTeX转向Typst的用户在排版文档时会遇到的一些常见问题。如果您更喜欢循序渐进的Typst入门介绍，请阅读我们的@tutorial[教程]。
  ],
)

= #babel(en: [Installation], zh-status: "need proofread", zh: [安装]) <installation>
#babel(
  en: [
    You have two ways to use Typst: In #link("https://typst.app/signup/")[our web app] or by #link("https://github.com/typst/typst/releases")[installing the compiler] on your computer. When you use the web app, we provide a batteries-included collaborative editor and run Typst in your browser, no installation required.

    If you choose to use Typst on your computer instead, you can download the compiler as a single, small binary which any user can run, no root privileges required. Unlike popular LaTeX distributions such as TeX Live, packages are downloaded when you first use them and then cached locally, keeping your Typst installation lean. You can use your own editor and decide where to store your files with the local compiler.
  ],
  zh-status: "need proofread",
  zh: [
    您有两种使用Typst的方式：在#link("https://typst.app/signup/")[我们的在线应用]中，或在计算机上#link("https://github.com/typst/typst/releases")[安装编译器]。使用在线应用时，我们会提供一个功能齐全的协作编辑器，并在您的浏览器中运行Typst，无需安装。

    如果您选择改用计算机上的Typst，可以下载一个单独的、小巧的二进制文件形式的编译器，任何用户都能运行，无需root权限。与TeX Live等流行的LaTeX发行版不同，Typst的包在首次使用时才会下载，随后缓存在本地，从而让您的Typst安装保持精简。使用本地编译器时，您可以使用自己的编辑器，并自行决定文件的存储位置。
  ],
)

= #babel(
  en: short-or-long[Getting Started][How do I create a new, empty document?],
  zh-status: "need proofread",
  zh: [如何创建一个新的空文档？],
) <getting-started>
#babel(
  en: [
    That's easy. You just create a new, empty text file (the file extension is `.typ`). No boilerplate is needed to get started. Simply start by writing your text. It will be set on an empty A4-sized page. If you are using the web app, click "+ Empty document" to create a new project with a file and enter the editor. @parbreak[Paragraph breaks] work just as they do in LaTeX, just use a blank line.
  ],
  zh-status: "need proofread",
  zh: [
    很简单。您只需新建一个空的文本文件（文件扩展名为`.typ`），无需任何样板代码即可开始。直接开始输入文本，内容会排在空白的A4页面上。如果您使用在线应用，请单击"+ Empty document"新建一个含文件的项目并进入编辑器。@parbreak[分段]与LaTeX中的用法一样，只需空一行：
  ],
)

```example
Hey there!

Here are two paragraphs. The
output is shown to the right.
```

#babel(
  en: [
    If you want to start from an preexisting LaTeX document instead, you can use #link("https://pandoc.org")[Pandoc] to convert your source code to Typst markup. This conversion is also built into our web app, so you can upload your `.tex` file to start your project in Typst.
  ],
  zh-status: "need proofread",
  zh: [
    如果您想改为以现有的LaTeX文档为起点，可以使用#link("https://pandoc.org")[Pandoc]将源代码转换为Typst标记。我们的在线应用也内置了这一转换功能，因此您可以上传`.tex`文件，直接在Typst中开始您的项目。
  ],
)

= #babel(
  en: short-or-long[Elements][How do I create section headings, emphasis, ...?],
  zh-status: "need proofread",
  zh: [如何创建章节标题、强调……？],
) <elements>
#babel(
  en: [
    LaTeX uses the command `\section` to create a section heading. Nested headings are indicated with `\subsection`, `\subsubsection`, etc. Depending on your document class, there is also `\part` or `\chapter`.

    In Typst, @heading[headings] are less verbose: You prefix the line with the heading on it with an equals sign and a space to get a first-order heading: `[= Introduction]`. If you need a second-order heading, you use two equals signs: `[== In this paper]`. You can nest headings as deeply as you'd like by adding more equals signs.

    Emphasis (usually rendered as italic text) is expressed by enclosing text in `[_underscores_]` and strong emphasis (usually rendered in boldface) by using `[*stars*]` instead.

    Here is a list of common markup commands used in LaTeX and their Typst equivalents. You can also check out the @reference:syntax[full syntax cheat sheet].
  ],
  zh-status: "need proofread",
  zh: [
    LaTeX使用`\section`命令创建章节标题。嵌套标题分别用`\subsection`、`\subsubsection`等表示。视文档类而定，还有`\part`或`\chapter`。

    在Typst中，@heading[标题]没那么啰嗦：在标题所在行的行首加上等号和空格，就得到一级标题：`[= Introduction]`。如果您需要二级标题，使用两个等号：`[== In this paper]`。添加更多的等号，就可以嵌套任意层级的标题。

    #info[
      *译者注：*

      类比Markdown中`#`的作用，在接下来的阅读中您会不断看到这种「Markdown+LaTeX」杂糅的产物，结合这两者分别的痛点，可以更深入地了解Typst设计这些语法的原因。
    ]

    强调通常渲染为斜体，通过在文本两侧添加`[_下划线_]`来表达；而粗体强调则改用`[*星号*]`，通常渲染为粗体。

    下面列出LaTeX中常用的标记命令及其在Typst中的对应写法。您还可以查看@reference:syntax[完整语法速查表]。
  ],
)

#docs-table(
  table.header(
    babel(en: [Element], zh-status: "need proofread", zh: [元素]),
    [LaTeX],
    [Typst],
    [See],
  ),

  babel(en: [Strong emphasis], zh-status: "need proofread", zh: [粗体强调]),
  [`\textbf{strong}`],
  [`[*strong*]`],
  [@strong],

  babel(en: [Emphasis], zh-status: "need proofread", zh: [强调]),
  [`\emph{emphasis}`],
  [`[_emphasis_]`],
  [@emph],

  babel(en: [Link], zh-status: "proofread", zh: [链接]),
  [`\url{https://typst.app}`],
  [`[https://typst.app/]`],
  [@link],

  babel(en: [Label], zh-status: "proofread", zh: [标签]),
  [`\label{intro}`],
  [`[<intro>]`],
  [@label],

  babel(en: [Reference], zh-status: "proofread", zh: [交叉引用]),
  [`\ref{intro}`],
  [`[@intro]`],
  [@ref],

  babel(en: [Citation], zh-status: "proofread", zh: [文献引用]),
  [`\cite{humphrey97}`],
  [`[@humphrey97]`],
  [@cite],

  babel(en: [Monospace (typewriter)], zh-status: "need proofread", zh: [等宽（打字机）]),
  [`\texttt{mono}`],
  [`text` or `mono` functions],
  [@text, @math.mono[`mono`]],

  [Code],
  babel(en: [`lstlisting` environment], zh-status: "need proofread", zh: [`lstlisting`环境]),
  [``` [`print(f"{x}")`]```],
  [@raw],

  [Verbatim],
  babel(en: [`verbatim` environment], zh-status: "need proofread", zh: [`verbatim`环境]),
  [``` [`#typst-code()`]```],
  [@raw],

  babel(en: [Bullet list], zh-status: "proofread", zh: [项目符号列表]),
  babel(en: [`itemize` environment], zh-status: "need proofread", zh: [`itemize`环境]),
  [`[- List]`],
  [@list],

  babel(en: [Numbered list], zh-status: "proofread", zh: [编号列表]),
  babel(en: [`enumerate` environment], zh-status: "need proofread", zh: [`enumerate`环境]),
  [`[+ List]`],
  [@enum],

  babel(en: [Term list], zh-status: "proofread", zh: [术语列表]),
  babel(en: [`description` environment], zh-status: "need proofread", zh: [`description`环境]),
  [`[/ Term: List]`],
  [@terms],

  babel(en: [Figure], zh-status: "need proofread", zh: [图表]),
  babel(en: [`figure` environment], zh-status: "need proofread", zh: [`figure`环境]),
  [`figure` function],
  [@figure],

  babel(en: [Table], zh-status: "proofread", zh: [表格]),
  babel(en: [`table` environment], zh-status: "need proofread", zh: [`table`环境]),
  [`table` function],
  [@table],

  babel(en: [Equation], zh-status: "proofread", zh: [公式]),
  babel(
    en: [`$x$`, `align` / `equation` environments],
    zh-status: "need proofread",
    zh: [`$x$`, `align`/`equation`环境],
  ),
  [`[$x$]`, `[$ x = y $]`],
  [@math.equation[`equation`]],
)

#babel(
  en: [
    @list[Lists] do not rely on environments in Typst. Instead, they have lightweight syntax like headings. To create an unordered list (`itemize`), prefix each line of an item with a hyphen:
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，@list[列表]并不依赖「环境」，而是像标题一样采用轻量语法。要创建无序列表（`itemize`），只需在每一项的行首添加连字符`-`：
  ],
)

````example
To write this list in Typst...

```latex
\begin{itemize}
  \item Fast
  \item Flexible
  \item Intuitive
\end{itemize}
```

...just type this:

- Fast
- Flexible
- Intuitive

````

#babel(
  en: [
    Nesting lists works just by using proper indentation. Adding a blank line in between items results in a more @list.tight[widely] spaced list.

    To get a @enum[numbered list] (`enumerate`) instead, use a `+` instead of the hyphen. For a @terms[term list] (`description`), write `[/ Term: Description]` instead.
  ],
  zh-status: "need proofread",
  zh: [
    列表的嵌套只需正确缩进即可。在各项之间添加空行，会得到一个@list.tight[间距更宽松]的列表。

    想要@enum[编号列表]（`enumerate`）时，改用`+`代替连字符。要得到@terms[术语列表]（`description`），则改写`[/ Term: Description]`。
  ],
)

Note that the @raw[`raw` function] and syntax (e.g. ``` [`raw`]```) only work for verbatim (unformatted) text. If you require formatting, you can use the @text[`text` function] with a monospace font instead, like in the example below:

```example
#text(
  font: "DejaVu Sans Mono",
  size: 0.8em,
)[monospace *bold*]
```

= #babel(
  en: short-or-long[Commands][How do I use a command?],
  zh-status: "need proofread",
  zh: [如何使用命令？],
) <commands>
#babel(
  en: [
    LaTeX heavily relies on commands (prefixed by backslashes). It uses these _macros_ to affect the typesetting process and to insert and manipulate content. Some commands accept arguments, which are most frequently enclosed in curly braces: `\cite{rasmus}`.

    Typst differentiates between @reference:scripting:blocks[markup mode and code mode]. The default is markup mode, where you compose text and apply syntactic constructs such as `[*stars for bold text*]`. Code mode, on the other hand, parallels programming languages like Python, providing the option to input and execute segments of code.

    Within Typst's markup, you can switch to code mode for a single command (or rather, _expression_) using a hash (`#`). This is how you call functions to, for example, split your project into different @reference:scripting:modules[files] or render text based on some @reference:scripting:conditionals[condition]. Within code mode, it is possible to include normal markup @content[_content_] by using square brackets. Within code mode, this content is treated just as any other normal value for a variable.
  ],
  zh-status: "need proofread",
  zh: [
    LaTeX非常依赖以反斜杠开头的命令。它用这些_宏_来影响排版过程，以及插入和操作内容。有些命令接受参数，参数通常括在大括号中：`\cite{rasmus}`。

    Typst区分两种模式：@reference:scripting:blocks[标记模式和脚本模式]。默认是标记模式，您在其中撰写文本并使用诸如`[*星号表示粗体文本*]`这样的语法结构。而脚本模式则类似Python等编程语言，让您可以输入并执行代码片段。

    在Typst的标记中，您可以用井号（`#`）为单个命令（更确切地说，是_表达式_）切换到脚本模式。这样就能调用函数，例如把项目拆分到不同的@reference:scripting:modules[文件]中，或根据某些@reference:scripting:conditionals[条件]渲染文本。在脚本模式中，还可以用方括号包含普通的标记@content[_内容_]；在脚本模式中，这些内容与其他变量一样，被视作普通的值。
  ],
)

```example
First, a rectangle:
#rect()

Let me show how to do
#underline([_underlined_ text])

We can also do some maths:
#calc.max(3, 2 * 4)

And finally a little loop:
#for x in range(3) [
  Hi #x.
]
```

#babel(
  en: [
    A function call always involves the name of the function (@rect, @underline, @calc.max, @array.range[`range`]) followed by parentheses (as opposed to LaTeX where the square brackets and curly braces are optional if the macro requires no arguments). The expected list of arguments passed within those parentheses depends on the concrete function and is specified in the @reference[reference].
  ],
  zh-status: "need proofread",
  zh: [
    #info[
      *译者注：*

      这段英文原文表述得很不清晰，这里提供一点解释。

      标记模式，如同Markdown，不需要额外标记，默认就处在这个模式下：可以直接使用`_text_`或者`*text*`来实现斜体/粗体（参考上文）。

      脚本模式，以`#`开头（类比LaTeX中以`\`开头来书写命令），仅存在于一个命令（表达式）中；表达式结束之后，一切又回到标记模式中。在脚本模式中，无需额外使用`#`（命令/关键字会直接识别，不同于LaTeX），同时在命令中也可以使用标记模式（使用`[]`，比如例子给出的`[Hi #x]`）。

      此外：

      - 在标记模式中，可以通过`#`来引用脚本模式的函数、值。
      - 在脚本模式中，返回值为`content`的函数会直接在当前位置渲染出来；如果没有显式指明返回值，则默认会将函数体内的所有内容块相加并返回。
      - 在脚本模式中，标记模式的内容（`Content`）也可以作为变量的值。
    ]

    函数调用总是以函数名（@rect、@underline、@calc.max、@array.range[`range`]）开头，后跟圆括号（而不像LaTeX——若宏不需要参数，方括号和花括号都可省略）。圆括号中应传入哪些参数取决于具体的函数，并在@reference[参考]中说明。
  ],
)

== #babel(en: [Arguments], zh-status: "need proofread", zh: [参数]) <arguments>
#babel(
  en: [
    A function can have multiple arguments. Some arguments are positional, i.e., you just provide the value: The function `[#lower("SCREAM")]` returns its argument in all-lowercase. Many functions use named arguments instead of positional arguments to increase legibility. For example, the dimensions and stroke of a rectangle are defined with named arguments:
  ],
  zh-status: "need proofread",
  zh: [
    一个函数可以有多个参数。有些参数是位置参数，即只需提供值：函数`[#lower("SCREAM")]`会以全小写形式返回其参数。许多函数使用命名参数代替位置参数，以提高可读性。例如，矩形的尺寸和描边就是用命名参数定义的：
  ],
)

```example
#rect(
  width: 2cm,
  height: 1cm,
  stroke: red,
)
```

#babel(
  en: [
    You specify a named argument by first entering its name (above, it's `width`, `height`, and `stroke`), then a colon, followed by the value (`2cm`, `1cm`, `red`). You can find the available named arguments in the @reference[reference page] for each function or in the autocomplete panel when typing. Named arguments are similar to how some LaTeX environments are configured, for example, you would type `\begin{enumerate}[label={\alph*)}]` to start a list with the labels `a)`, `b)`, and so on.

    Often, you want to provide some @content[content] to a function. For example, the LaTeX command `\underline{Alternative A}` would translate to `[#underline([Alternative A])]` in Typst. The square brackets indicate that a value is @content[content]. Within these brackets, you can use normal markup. However, that's a lot of parentheses for a pretty simple construct. This is why you can also move trailing content arguments after the parentheses (and omit the parentheses if they would end up empty).
  ],
  zh-status: "need proofread",
  zh: [
    指定命名参数时，先输入参数名（上面是`width`、`height`和`stroke`），然后是冒号，再跟上值（`2cm`、`1cm`、`red`）。您可以在每个函数的@reference[参考页]中找到可用的命名参数，也可以在输入时查看自动补全面板。命名参数类似于某些LaTeX环境的配置方式，例如，您可以输入`\begin{enumerate}[label={\alph*)}]`来创建一个标签依次为`a)`、`b)`等的列表。

    您常常需要向函数传入一些@content[内容]。例如，LaTeX命令`\underline{Alternative A}`在Typst中应写成`[#underline([Alternative A])]`。方括号表示其中的值是一个@content[内容]。在这些方括号中，您可以照常使用标记语法。不过，对于这样一个相当简单的结构来说，括号还是太多了。正因如此，您也可以把位于尾部的内容参数移到圆括号之后（如果圆括号最后是空的，也可以省略）：
  ],
)

```example
Typst is an #underline[alternative]
to LaTeX.

#rect(fill: aqua)[Get started here!]
```

== #babel(en: [Data types], zh-status: "need proofread", zh: [数据类型]) <data-types>
#babel(
  en: [
    You likely already noticed that the arguments have distinctive data types. Typst supports many @type[data types]. Below, there is a table with some of the most important ones and how to write them. In order to specify values of any of these types, you have to be in code mode!
  ],
  zh-status: "need proofread",
  zh: [
    您可能已经注意到，这些参数有着不同的数据类型。Typst支持许多@type[数据类型]。下表列出其中一些最重要的类型及其写法。要指定这些类型的值，您必须处于脚本模式中！
  ],
)

#docs-table(
  table.header(
    babel(en: [Data type], zh-status: "need proofread", zh: [数据类型]),
    babel(en: [Example], zh-status: "need proofread", zh: [示例]),
  ),

  babel(en: [@content[Content]], zh-status: "need proofread", zh: [@content[内容]]),
  [`{[*fast* typesetting]}`],

  babel(en: [@str[String]], zh-status: "need proofread", zh: [@str[字符串]]),
  [`{"Pietro S. Author"}`],

  babel(en: [@int[Integer]], zh-status: "need proofread", zh: [@int[整数]]),
  [`{23}`],

  babel(en: [@float[Floating point number]], zh-status: "need proofread", zh: [@float[浮点数]]),
  [`{1.459}`],

  babel(en: [@length[Absolute length]], zh-status: "need proofread", zh: [@length[绝对长度]]),
  [`{12pt}`, `{5in}`, `{0.3cm}`, ...],

  babel(en: [@ratio[Relative length]], zh-status: "need proofread", zh: [@ratio[相对长度]]),
  [`{65%}`],
)

#babel(
  en: [
    The difference between content and string is that content can contain markup, including function calls, while a string really is just a plain sequence of characters.

    Typst provides @reference:scripting:conditionals[control flow constructs] and @reference:scripting:operators[operators] such as `+` for adding things or `==` for checking equality between two variables.

    You can also store values, including functions, in your own @reference:scripting:bindings[variables]. This can be useful to perform computations on them, create reusable automations, or reference a value multiple times. The variable binding is accomplished with the let keyword, which works similar to `\newcommand`:
  ],
  zh-status: "need proofread",
  zh: [
    内容与字符串的区别在于，内容可以包含标记（包括函数调用），而字符串实际上只是一个普通的字符序列。

    Typst提供了@reference:scripting:conditionals[控制流结构]和@reference:scripting:operators[运算符]，例如用`+`相加，用`==`检查两个变量是否相等。

    您还可以在自己定义的@reference:scripting:bindings[变量]中存储值（包括函数）。这样做有助于对其进行计算、创建可复用的自动化流程，或多次引用同一个值。变量绑定通过`let`关键字完成，其用法与`\newcommand`类似：
  ],
)

```example
// Store the integer `5`.
#let five = 5

// Define a function that
// increments a value.
#let inc(i) = i + 1

// Reference the variables.
I have #five fingers.

If I had one more, I'd have
#inc(five) fingers. Whoa!
```

== #babel(
  en: short-or-long[Rules][Commands to affect the remaining document],
  zh-status: "need proofread",
  zh: short-or-long[规则][影响文档其余部分的命令],
) <rules>
#babel(
  en: [
    In LaTeX, some commands like `\textbf{bold text}` receive an argument in curly braces and only affect that argument. Other commands such as `\bfseries bold text` act as switches (LaTeX calls this a declaration), altering the appearance of all subsequent content within the document or current scope.

    In Typst, the same function can be used both to affect the appearance for the remainder of the document, a block (or scope), or just its arguments. For example, `[#text(weight: "bold")[bold text]]` will only embolden its argument, while `[#set text(weight: "bold")]` will embolden any text until the end of the current block, or the end of the document, if there is none. The effects of a function are immediately obvious based on whether it is used in a call or a @reference:styling:set-rules[set rule.]
  ],
  zh-status: "need proofread",
  zh: [
    在LaTeX中，像`\textbf{bold text}`这样的命令接受放在大括号中的参数，并且只影响该参数。而像`\bfseries bold text`这样的命令则起开关作用（LaTeX称之为声明），会改变文档或当前作用域中后续所有内容的外观。

    在Typst中，同一个函数既可以影响文档的剩余部分，也可以影响某个块（或作用域），或者只影响它的参数。例如，`[#text(weight: "bold")[bold text]]`只会加粗它的参数，而`[#set text(weight: "bold")]`会加粗直到当前块结束为止的所有文本；若不在任何块中，则直到文档结束。函数的作用范围一眼就能看出：它是被用作调用，还是用作@reference:styling:set-rules[set规则]。
  ],
)

```example
I am starting out with small text.

#set text(14pt)

This is a bit #text(18pt)[larger,]
don't you think?
```

#babel(
  en: [
    Set rules may appear anywhere in the document. They can be thought of as default argument values of their respective function:
  ],
  zh-status: "need proofread",
  zh: [
    set规则可以出现在文档的任何位置，可以将其视为对应函数的默认参数值：
  ],
)

```example
#set enum(numbering: "I.")

Good results can only be obtained by
+ following best practices
+ being aware of current results
  of other researchers
+ checking the data for biases
```

#babel(
  en: [
    The `+` is syntactic sugar (think of it as an abbreviation) for a call to the @enum[`{enum}`] function, to which we apply a set rule above. @reference:syntax[Most syntax is linked to a function in this way.] If you need to style an element beyond what its arguments enable, you can completely redefine its appearance with a @reference:styling:show-rules[show rule] (somewhat comparable to `\renewcommand`).

    You can achieve the effects of LaTeX commands like `\textbf`, `\textsf`, `\rmfamily`, `\mdseries`, and `\itshape` with the @text.font[`font`], @text.style[`style`], and @text.weight[`weight`] arguments of the `text` function. The text function can be used in a set rule (declaration style) or with a content argument. To replace `\textsc`, you can use the @smallcaps function, which renders its content argument as smallcaps. Should you want to use it declaration style (like `\scshape`), you can use an @reference:styling:show-rules[_everything_ show rule] that applies the function to the rest of the scope:
  ],
  zh-status: "need proofread",
  zh: [
    `+`是对@enum[`{enum}`]函数调用的语法糖（可以把它看作一种简写），我们在上面为它应用了一条set规则。@reference:syntax[大多数语法都以这种方式与某个函数关联。]如果您需要的样式超出了参数所能表达的范围，还可以用@reference:styling:show-rules[show规则]完全重新定义元素的外观（有点类似于`\renewcommand`）。

    借助`text`函数的@text.font[`font`]、@text.style[`style`]和@text.weight[`weight`]参数，您可以实现`\textbf`、`\textsf`、`\rmfamily`、`\mdseries`和`\itshape`等LaTeX命令的效果。`text`函数既可以用在set规则中（声明式），也可以带内容参数使用。若要替代`\textsc`，可以使用@smallcaps\函数，它会把其内容参数渲染为小型大写字母。如果您想以声明式使用它（类似`\scshape`），可以用@reference:styling:show-rules[_everything_ show规则]把该函数应用到作用域的其余部分：
  ],
)

```example
#show: smallcaps

Boisterous Accusations
```

= #babel(
  en: short-or-long[Templates][How do I load a document class?],
  zh-status: "need proofread",
  zh: [如何加载文档类？],
) <templates>
#babel(
  en: [
    In LaTeX, you start your main `.tex` file with the `\documentclass{article}` command to define how your document is supposed to look. In that command, you may have replaced `article` with another value such as `report` and `amsart` to select a different look.

    When using Typst, you style your documents with @function[functions]. Typically, you use a template that provides a function that styles your whole document. First, you import the function from a template file. Then, you apply it to your whole document. This is accomplished with a @reference:styling:show-rules[show rule] that wraps the following document in a given function. The following example illustrates how it works:
  ],
  zh-status: "need proofread",
  zh: [
    在LaTeX中，您会在主`.tex`文件开头使用`\documentclass{article}`命令来定义文档应有的外观。在该命令中，您可能已将`article`替换为`report`、`amsart`等其他值，以选择不同的外观。

    在Typst中，您用@function[函数]来设置文档的样式。通常您会使用一个模板，它提供一个可以为整个文档设置样式的函数。首先从模板文件中导入该函数，然后将其应用到整个文档。具体做法是用@reference:styling:show-rules[show规则]把后面的文档包装进给定的函数中。下面的例子展示了它的用法：
  ],
)

#example(
  single: true,
  ```
  >>> #let conf(
  >>>   title: none,
  >>>   authors: (),
  >>>   abstract: [],
  >>>   doc,
  >>> ) = {
  >>>   set text(font: "Libertinus Serif", 11pt)
  >>>   set par(justify: true)
  >>>   set page(
  >>>     "us-letter",
  >>>     margin: auto,
  >>>     header: align(
  >>>       right + horizon,
  >>>       title
  >>>     ),
  >>>     numbering: "1",
  >>>     columns: 2
  >>>   )
  >>>
  >>>   show heading.where(
  >>>     level: 1
  >>>   ): it => block(
  >>>     align(center,
  >>>       text(
  >>>         13pt,
  >>>         weight: "regular",
  >>>         smallcaps(it.body),
  >>>       )
  >>>     ),
  >>>   )
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => box(
  >>>     text(
  >>>       11pt,
  >>>       weight: "regular",
  >>>       style: "italic",
  >>>       it.body + [.],
  >>>     )
  >>>   )
  >>>
  >>>   place(top, float: true, scope: "parent", {
  >>>     set align(center)
  >>>     text(17pt, title)
  >>>
  >>>     let count = calc.min(authors.len(), 3)
  >>>     grid(
  >>>       columns: (1fr,) * count,
  >>>       row-gutter: 24pt,
  >>>       ..authors.map(author => [
  >>>         #author.name \
  >>>         #author.affiliation \
  >>>         #link("mailto:" + author.email)
  >>>       ]),
  >>>     )
  >>>
  >>>     par(justify: false)[
  >>>       *Abstract* \
  >>>       #abstract
  >>>     ]
  >>>   })
  >>>
  >>>   set align(left)
  >>>   doc
  >>> }
  <<< #import "conf.typ": conf
  #show: conf.with(
    title: [
      Towards Improved Modelling
    ],
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

  Let's get started writing this
  article by putting insightful
  paragraphs right here!
  >>> #lorem(500)
  ```,
)

#babel(
  en: [
    The @reference:scripting:modules[`{import}`] statement makes @function[functions] (and other definitions) from another file available. In this example, it imports the `conf` function from the `conf.typ` file. This function formats a document as a conference article. We use a show rule to apply it to the document and also configure some metadata of the article. After applying the show rule, we can start writing our article right away!

    You can also use templates from Typst Universe (which is Typst's equivalent of CTAN) using an import statement like this: `[#import "@preview/elsearticle:0.2.1": elsearticle]`. Check the documentation of an individual template to learn the name of its template function. Templates and packages from Typst Universe are automatically downloaded when you first use them.

    In the web app, you can choose to create a project from a template on Typst Universe or even create your own using the template wizard. Locally, you can use the `typst init` CLI to create a new project from a template. Check out #link("https://typst.app/universe/search/?kind=templates")[the list of templates] published on Typst Universe. You can also take a look at the #link("https://github.com/qjcg/awesome-typst")[`awesome-typst` repository] to find community templates that aren't available through Universe.

    You can also @tutorial:making-a-template[create your own, custom templates.] They are shorter and more readable than the corresponding LaTeX `.sty` files by orders of magnitude, so give it a try!

    #info[
      Functions are Typst's "commands" and can transform their arguments to an output value, including document _content._ Functions are "pure", which means that they cannot have any effects beyond creating an output value / output content. This is in stark contrast to LaTeX macros that can have arbitrary effects on your document.

      To let a function style your whole document, the show rule processes everything that comes after it and calls the function specified after the colon with the result as an argument. The `.with` part is a _method_ that takes the `conf` function and pre-configures some of its arguments before passing it on to the show rule.
    ]
  ],
  zh-status: "need proofread",
  zh: [
    @reference:scripting:modules[`{import}`]语句让另一个文件中的@function[函数]（以及其他定义）可供使用。在本例中，它从`conf.typ`文件导入了`conf`函数。该函数把文档排版成会议论文的格式。我们用一条show规则把它应用到文档上，并配置文章的一些元数据。应用show规则之后，我们就能直接开始撰写文章了！

    您也可以使用如下import语句来使用Typst Universe上的模板（相当于Typst的CTAN）：`[#import "@preview/elsearticle:0.2.1": elsearticle]`。请查阅各个模板的文档，了解其模板函数的名称。首次使用Typst Universe的模板和包时，它们会自动下载。

    #info[
      在Typst中，函数被称为「命令」，它们可以将其参数转化为输出值，包括文档_内容_。函数是「纯」的，这意味着它们除了产生输出值／输出内容之外，不会有任何其他效果。这与LaTeX的宏形成了鲜明的对比，后者可以对您的文档产生任意的效果。

      为了让函数为整个文档设置样式，show规则会处理其后的所有内容，并把处理结果作为参数，调用冒号后指定的函数。`.with`部分是一个_方法_，它接收`conf`函数并预先配置它的部分参数，然后再把它交给show规则。

      *译者注：*

      `#show: conf.with(title: [标题])` 等价于Lambda表达式形式的 `#show: it => conf(title: [标题], it)`
    ]

    在在线应用中，您可以选择基于Typst Universe上的模板创建项目，甚至可以用模板向导创建自己的模板。在本地，您可以使用`typst init`命令行工具从模板创建新项目。看看Typst Universe上发布的#link("https://typst.app/universe/search/?kind=templates")[模板列表]。您还可以翻阅#link("https://github.com/qjcg/awesome-typst")[`awesome-typst`仓库]，寻找无法从Universe获得的社区模板。

    您也可以@tutorial:making-a-template[创建自己的自定义模板]。它们比对应的LaTeX`.sty`文件简短、易读好几个数量级，不妨一试！
  ],
)

= #babel(
  en: short-or-long[Packages][How do I load packages?],
  zh-status: "need proofread",
  zh: [如何加载包？],
) <packages>
#babel(
  en: [
    Typst is "batteries included," so the equivalent of many popular LaTeX packages is built right-in. Below, we compiled a table with frequently loaded packages and their corresponding Typst functions.
  ],
  zh-status: "need proofread",
  zh: [
    Typst「开箱即用」，许多流行的LaTeX包的功能都直接内置其中。下面我们整理了一张表，列出常用的LaTeX包及其对应的Typst函数。
  ],
)

#docs-table(
  table.header(
    babel(en: [LaTeX Package], zh-status: "need proofread", zh: [LaTeX包]),
    babel(en: [Typst Alternative], zh-status: "need proofread", zh: [Typst替代方案]),
  ),

  [graphicx, svg],
  babel(en: [@image function], zh-status: "need proofread", zh: [@image\函数]),

  [tabularx, tabularray],
  babel(en: [@table, @grid functions], zh-status: "need proofread", zh: [@table、@grid\函数]),

  [fontenc, inputenc, unicode-math],
  babel(en: [Just start writing!], zh-status: "need proofread", zh: [直接开始编写！]),

  [babel, polyglossia],
  babel(
    en: [@text.lang[`text`] function: `[#set text(lang: "zh")]`],
    zh-status: "need proofread",
    zh: [@text.lang[`text`]函数：`[#set text(lang: "zh")]`],
  ),

  [amsmath],
  babel(en: [@math[Math mode]], zh-status: "need proofread", zh: [@math[数学模式]]),

  [amsfonts, amssymb],
  babel(
    en: [@reference:symbols[`sym`] module and @reference:syntax:math[syntax]],
    zh-status: "need proofread",
    zh: [@reference:symbols[`sym`]模块和@reference:syntax:math[语法]],
  ),

  [geometry, fancyhdr],
  babel(en: [@page function], zh-status: "need proofread", zh: [@page\函数]),

  [xcolor],
  babel(
    en: [@text.fill[`text`] function: `[#set text(fill: rgb("#0178A4"))]`],
    zh-status: "need proofread",
    zh: [@text.fill[`text`]函数：`[#set text(fill: rgb("#0178A4"))]`],
  ),

  [hyperref],
  babel(en: [@link function], zh-status: "need proofread", zh: [@link\函数]),

  [bibtex, biblatex, natbib],
  babel(en: [@cite, @bibliography functions], zh-status: "need proofread", zh: [@cite、@bibliography\函数]),

  [lstlisting, minted],
  babel(en: [@raw function and syntax], zh-status: "need proofread", zh: [@raw\函数和语法]),

  [parskip],
  babel(
    en: [@block.spacing[`block`] and @par.first-line-indent[`par`] functions],
    zh-status: "need proofread",
    zh: [@block.spacing[`block`]和@par.first-line-indent[`par`]函数],
  ),

  [csquotes],
  babel(
    en: [Set the @text.lang[`text`] language and type `["]` or `[']`],
    zh-status: "need proofread",
    zh: [设置@text.lang[`text`]语言，并输入`["]`或`[']`],
  ),

  [caption],
  babel(en: [@figure function], zh-status: "need proofread", zh: [@figure\函数]),

  [enumitem],
  babel(en: [@list, @enum, @terms functions], zh-status: "need proofread", zh: [@list、@enum、@terms\函数]),

  [nicefrac],
  [@math.frac.style[`frac.style`] property],
)

#babel(
  en: [
    Although _many_ things are built-in, not everything can be. That's why Typst has its own #link("https://typst.app/universe")[package ecosystem] where the community share its creations and automations. Let's take, for instance, the _CeTZ_ package: This package allows you to create complex drawings and plots. To use CeTZ in your document, you can just write:
  ],
  zh-status: "need proofread",
  zh: [
    尽管_很多_功能都是内置的，但并非所有功能都能内置。正因如此，Typst有自己的一片#link("https://typst.app/universe")[包生态系统]，社区成员在其中分享自己的作品和自动化工具。以_CeTZ_包为例：这个包让您可以绘制复杂的图形和绘图。要在文档中使用CeTZ，只需编写：
  ],
)

```typ
#import "@preview/cetz:0.4.1"
```

#babel(
  en: [
    (The `@preview` is a _namespace_ that is used while the package manager is still in its early and experimental state. It will be replaced in the future.)

    Aside from the official package hub, you might also want to check out the #link("https://github.com/qjcg/awesome-typst")[awesome-typst repository], which compiles a curated list of resources created for Typst.

    If you need to load functions and variables from another file within your project, for example to use a template, you can use the same @reference:scripting:modules[`import`] statement with a file name rather than a package specification. To instead include the textual content of another file, you can use an @reference:scripting:modules[`include`] statement. It will retrieve the content of the specified file and put it in your document.
  ],
  zh-status: "need proofread",
  zh: [
    （`@preview`是一个_命名空间_，在包管理器仍处于早期实验阶段时使用，将来会被替换。）

    除了官方包仓库，您可能还想看看#link("https://github.com/qjcg/awesome-typst")[awesome-typst仓库]，其中汇总了一份为Typst创建的精选资源列表。

    如果您需要加载项目中另一个文件里的函数和变量，例如使用模板，可以使用同样的@reference:scripting:modules[`{import}`]语句，只是把包名换成文件名。若要改为包含另一个文件的文本内容，可以使用@reference:scripting:modules[`{include}`]语句，它会取出指定文件的内容并放进您的文档中。

  ],
)

= #babel(en: short-or-long[Maths][How do I input maths?], zh-status: "need proofread", zh: [如何输入数学公式？]) <maths>
#babel(
  en: [
    To enter math mode in Typst, just enclose your equation in dollar signs. You can enter display mode by adding spaces or newlines between the equation's contents and its enclosing dollar signs.
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，只需把公式括在美元符号中即可进入数学模式。在公式内容与两侧的美元符号之间添加空格或换行，即可进入独行公式模式。
  ],
)

```example
The sum of the numbers from
$1$ to $n$ is:

$ sum_(k=1)^n k = (n(n+1))/2 $
```

#babel(
  en: [
    @math[Math mode] works differently than regular markup or code mode. Numbers and single characters are displayed verbatim, while multiple consecutive (non-number) characters will be interpreted as Typst variables.

    Typst pre-defines a lot of useful variables in math mode. All Greek (`alpha`, `beta`, ...) and some Hebrew letters (`aleph`, `beth`, ...) are available through their name. Some symbols are additionally available through shorthands, such as `<=`, `>=`, and `->`.

    Refer to the @reference:symbols[symbol pages] for a full list of the symbols. If a symbol is missing, you can also access it through a @reference:syntax:escapes[Unicode escape sequence].

    Alternate and related forms of symbols can often be selected by @symbol[appending a modifier] after a period. For example, `arrow.l.squiggly` inserts a squiggly left-pointing arrow. If you want to insert multiletter text in your expression instead, enclose it in double quotes:
  ],
  zh-status: "need proofread",
  zh: [
    @math[数学模式]的工作方式与普通标记或脚本模式不同。数字和单个字符会原样显示，而多个连续（非数字）字符将被解释为Typst变量。

    Typst在数学模式下预定义了许多有用的变量。所有希腊字母（`alpha`、`beta`、……）和一些希伯来字母（`aleph`、`beth`、……）都可以通过名称直接使用。有些符号还可以用简写输入，例如`<=`、`>=`和`->`。

    符号的完整列表请参考@reference:symbols[符号页面]。如果某个符号不存在，也可以通过@reference:syntax:escapes[Unicode转义序列]来输入它。

    符号的变体及相关形式，通常可以通过在句点后@symbol[附加一个修饰符]来选择。例如，`arrow.l.squiggly`会插入一个波浪形向左的箭头。如果您想在表达式中插入多个字母的文本，请把它括在双引号中：
  ],
)

```example
$ delta "if" x <= 5 $
```

#babel(
  en: [
    In Typst, delimiters will scale automatically for their expressions, just as if `\left` and `\right` commands were implicitly inserted in LaTeX. You can customize delimiter behaviour using the @math.lr[`lr` function]. To prevent a pair of delimiters from scaling, you can escape them with backslashes.

    Typst will automatically set terms around a slash `/` as a fraction while honoring operator precedence. All round parentheses not made redundant by the fraction will appear in the output. Fractions are typeset vertically unless customized with @math.frac.style[`frac.style`]. You can also produce a slash as is by escaping it with a backslash (`\/`).
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，定界符会随其内部表达式自动缩放，就像LaTeX中隐式插入了`\left`和`\right`命令一样。您可以使用@math.lr[`lr`]函数自定义定界符的行为。要阻止一对定界符缩放，可以用反斜杠将其转义。

    在遵从运算符优先级的前提下，Typst会自动把斜线`/`两侧的项排版为分数。凡是因分数而变得多余的圆括号都不会出现在输出中；其余的圆括号则照常显示。分数默认竖直排版，除非用@math.frac.style[`frac.style`]自定义。您也可以用反斜杠转义斜线（`\/`），直接输出一个斜线：
  ],
)

```example
$ f(x) = (x + 1) / x $
```

#babel(
  en: [
    @math.attach[Sub- and superscripts] work similarly in Typst and LaTeX. `{$x^2$}` will produce a superscript, `{$x_2$}` yields a subscript. If you want to include more than one value in a sub- or superscript, enclose their contents in parentheses: `{$x_(a -> epsilon)$}`.

    Since variables in math mode do not need to be prepended with a `#` (or a `\` like in LaTeX), you can also call functions without these special characters:
  ],
  zh-status: "need proofread",
  zh: [
    @math.attach[下标和上标]在Typst和LaTeX中用法相似。`{$x^2$}`会生成上标，`{$x_2$}`会生成下标。如果您想在下标或上标中包含多个值，请将其内容放在圆括号中：`{$x_(a -> epsilon)$}`。

    数学模式下的变量无需以`#`（或LaTeX中的`\`）开头，因此您也可以不加这些特殊字符直接调用函数：
  ],
)

```example
$ f(x, y) := cases(
  1 "if" (x dot y)/2 <= 0,
  2 "if" x "is even",
  3 "if" x in NN,
  4 "else",
) $
```

#babel(
  en: [
    The above example uses the @math.cases[`cases` function] to describe f. Within the cases function, arguments are delimited using commas and the arguments are also interpreted as math. If you need to interpret arguments as Typst values instead, prefix them with a `#`:
  ],
  zh-status: "need proofread",
  zh: [
    上面的例子用@math.cases[`cases`函数]来定义`f`。在`cases`函数中，参数用逗号分隔，并且参数也按数学内容解释。如果您希望把参数解释为Typst值，请在参数前加上`#`：
  ],
)

```example
$ (a + b)^2
  = a^2
  + text(fill: #maroon, 2 a b)
  + b^2 $
```

#babel(
  en: [
    You can use all Typst functions within math mode and insert any content. If you want them to work normally, with code mode in the argument list, you can prefix their call with a `#`. Nobody can stop you from using rectangles or emoji as your variables anymore:
  ],
  zh-status: "need proofread",
  zh: [
    在数学模式下，您可以使用任何Typst函数，也可以插入任何内容。如果您希望它们正常工作（参数列表处于脚本模式），只需要在调用前加上`#`。现在没人能阻止您用矩形或emoji当变量了：
  ],
)

```example
$ sum^10_(🤓=1)
  #rect(width: 4mm, height: 2mm)/🤓
  = 🧠 maltese $
```

#babel(
  en: [
    If you'd like to enter your mathematical symbols directly as Unicode, that is possible, too!

    Math calls can have two-dimensional argument lists using `;` as a delimiter. The most common use for this is the @math.mat[`mat` function] that creates matrices:
  ],
  zh-status: "need proofread",
  zh: [
    您也可以直接用Unicode输入数学符号！

    数学调用可以带有二维参数列表，用`;`作为分隔符。最常见的用途是使用@math.mat[`mat`函数]创建矩阵：
  ],
)

```example
$ mat(
  1, 2, ..., 10;
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, 10, ..., 10;
) $
```

= #babel(
  en: short-or-long[Latex Look][How do I get the "LaTeX look?"],
  zh-status: "need proofread",
  zh: [如何获得「LaTeX外观」？],
) <latex-look>
#babel(
  en: [
    Papers set in LaTeX have an unmistakeable look. This is mostly due to their font, Computer Modern, justification, narrow line spacing, and wide margins.

    The example below
    - sets wide @page.margin[margins]
    - enables @par.justify[justification], @par.leading[tighter lines] and @par.first-line-indent[first-line-indent]
    - @text.font[sets the font] to "New Computer Modern", an OpenType derivative of Computer Modern for both text and @raw[code blocks]
    - decreases the @text.weight[font weight] in math mode
    - disables paragraph @block.spacing[spacing]
    - increases @block.spacing[spacing] around @heading[headings]
  ],
  zh-status: "need proofread",
  zh: [
    用LaTeX排版的论文有一种一眼就能认出的外观。这主要是由于它们的字体#link("https://zh.wikipedia.org/wiki/Computer_Modern")[Computer Modern]、两端对齐、窄行距和宽边距。

    下面是一个示例：

    - 设置宽@page.margin[边距]
    - 启用@par.justify[两端对齐]、@par.leading[更紧凑的行距]和@par.first-line-indent[首行缩进]
    - 将@text.font[字体]设为"New Computer Modern"，它是Computer Modern的OpenType衍生版本，适用于文本和@raw[代码段]
    - 降低数学模式下的@text.weight[字体粗细]
    - 禁用段落@block.spacing[间距]
    - 增加@heading[标题]周围的@block.spacing[间距]
  ],
)

```typ
#set page(margin: 1.75in)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show math.equation: set text(weight: "regular")
#show heading: set block(above: 1.4em, below: 1em)
```

#babel(
  en: [
    This should be a good starting point! If you want to go further, why not create a reusable template?
  ],
  zh-status: "need proofread",
  zh: [
    这应该是个不错的起点！如果您想更进一步，何不创建一个可复用的模板呢？
  ],
)

= #babel(en: [Bibliographies], zh-status: "need proofread", zh: [文献列表]) <bibliographies>
#babel(
  en: [
    Typst includes a fully-featured bibliography system that is compatible with BibTeX files. You can continue to use your `.bib` literature libraries by loading them with the @bibliography function. Another possibility is to use #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Typst's YAML-based native format].

    Typst uses the Citation Style Language to define and process citation and bibliography styles. You can compare CSL files to BibLaTeX's `.bbx` files. The compiler already includes @bibliography.style[over 80 citation styles], but you can use any CSL-compliant style from the #link("https://github.com/citation-style-language/styles")[CSL repository] or write your own.

    You can cite an entry in your bibliography or reference a label in your document with the same syntax: `[@key]` (this would reference an entry called `key`). Alternatively, you can use the @cite function.

    Alternative forms for your citation, such as year only and citations for natural use in prose (cf. `\citet` and `\textcite`) are available with @cite.form[`[#cite(<key>, form: "prose")]`].

    You can find more information on the documentation page of the @bibliography function.
  ],
  zh-status: "need proofread",
  zh: [
    Typst内置了功能完善的文献列表系统，兼容BibTeX文件。您可以继续用@bibliography\函数加载`.bib`文献库。另一种选择是使用#link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Typst原生的基于YAML的格式]。

    Typst使用Citation Style Language（引文样式语言，CSL）来定义和处理文献引用与文献列表样式。您可以把CSL文件类比为BibLaTeX的`.bbx`文件。编译器已经内置了@bibliography.style[80多种引文样式]，但您也可以使用#link("https://github.com/citation-style-language/styles")[CSL仓库]中任何符合CSL规范的样式，或者编写自己的样式。

    您可以用相同的语法`[@key]`引用文献列表中的条目，或交叉引用文档中的标签（这里会引用一个名为`key`的条目）。或者，您也可以使用@cite\函数。

    文献引用的其他形式，例如仅显示年份，以及在正文中自然使用的引用（参见`\citet`和`\textcite`），可以通过@cite.form[`[#cite(<key>, form: "prose")]`]获得。

    更多信息请见@bibliography\函数的文档页面。
  ],
)

= #babel(
  en: short-or-long[Limitations][What limitations does Typst currently have compared to LaTeX?],
  zh-status: "need proofread",
  zh: [与LaTeX相比，Typst目前有哪些局限？],
) <limitations>
#babel(
  en: [
    Although Typst can be a LaTeX replacement for many today, there are still features that Typst does not (yet) support. Here is a list of them which, where applicable, contains possible workarounds.

    - *Well-established plotting ecosystem.* LaTeX users often create elaborate charts along with their documents in PGF/TikZ. The Typst ecosystem does not yet offer the same breadth of available options, but the ecosystem around the #link("https://typst.app/universe/package/cetz")[`cetz` package] is catching up quickly.

    - *Change page margins without a pagebreak.* In LaTeX, margins can always be adjusted, even without a pagebreak. To change margins in Typst, you use the @page[`page` function] which will force a page break. If you just want a few paragraphs to stretch into the margins, then reverting to the old margins, you can use the @pad[`pad` function] with negative padding.
  ],
  zh-status: "need proofread",
  zh: [
    尽管如今Typst对许多人来说已经可以替代LaTeX，但仍有一些功能是Typst（还）不支持的。下面列出这些功能，并在适用处给出可能的变通方案。

    - *成熟的绘图生态系统。*LaTeX用户常使用PGF/TikZ在文档中绘制精细的图表。Typst的生态系统尚未提供同样丰富的选择，但围绕#link("https://typst.app/universe/package/cetz")[`cetz`包]的生态正在迅速赶上。

    - *在不分页的情况下更改页面边距。*在LaTeX中，页边距随时都能调整，甚至无需分页。而在Typst中更改页边距需要使用@page[`page`函数]，这会强制分页。如果您只是想让几个段落伸进页边距、之后再恢复原来的边距，可以使用@pad[`pad`函数]并设置负的内边距。
  ],
)
