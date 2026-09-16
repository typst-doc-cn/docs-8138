#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-figure, info, kbd, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Formatting",
    zh-status: "need proofread",
    zh: "格式",
  ),
  route: "/tutorial/formatting",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst 的教程。",
  ),
)

#babel(
  en: [
    So far, you have written a report with some text, a few equations and images. However, it still looks very plain. Your teaching assistant does not yet know that you are using a new typesetting system, and you want your report to fit in with the other student's submissions. In this chapter, we will see how to format your report using Typst's styling system.
  ],
  zh-status: "need proofread",
  zh: [
    到目前为止，您已经写了一份包含一些文本、一些数学公式和图像的报告。但是，它看起来仍然很朴素。您的助教还不知道您正在使用新的排版系统，并且您希望您的报告与其他学生提交的报告外观上一致。在本章中，我们将了解如何使用Typst的样式系统来格式化你的报告。
  ],
)

= #babel(en: [Set rules], zh-status: "proofread", zh: [set规则]) <set-rules>
#babel(
  en: [
    As we have seen in the previous chapter, Typst has functions that _insert_ content (e.g. the @image function) and others that _manipulate_ content that they received as arguments (e.g. the @align function). The first impulse you might have when you want, for example, to change the font, could be to look for a function that does that and wrap the complete document in it.
  ],
  zh-status: "need proofread",
  zh: [
    正如我们在上一章中看到的，Typst具有_插入_内容块的函数（例如@image\函数），以及其他将内容块作为参数接收的_操作_函数（例如@align\函数）。您可能第一个想法是，例如，为了报告的文本左右对齐（justify），您可能会寻找一个执行此操作的函数并将整个文稿包装在其中。
  ],
)

```example
#text(font: "New Computer Modern")[
  = Background
  In the case of glaciers, fluid
  dynamics principles can be used
  to understand how the movement
  and behaviour of the ice is
  influenced by factors such as
  temperature, pressure, and the
  presence of other fluids (such as
  water).
]
```

#babel(
  en: [
    Wait, shouldn't all arguments of a function be specified within parentheses? Why is there a second set of square brackets with content _after_ the parentheses? The answer is that, as passing content to a function is such a common thing to do in Typst, there is special syntax for it: Instead of putting the content inside of the argument list, you can write it in square brackets directly after the normal arguments, saving on punctuation.

    As seen above, that works. With the @text function, we can adjust the font for all text within it. However, wrapping the document in countless functions and applying styles selectively and in-situ can quickly become cumbersome.

    Fortunately, Typst has a more elegant solution. With _set rules,_ you can apply style properties to all occurrences of some kind of content. You write a set rule by entering the `{set}` keyword, followed by the name of the function whose properties you want to set, and a list of arguments in parentheses.
  ],
  zh-status: "need proofread",
  zh: [
    等等，函数的所有参数不应该在括号内指定吗？为什么在圆括号 _后面_ 有第二组方括号组成的内容块？  答案是，由于将内容块传递给函数在 Typst 中非常常见，因此它有着特殊的语法：  无需将内容块放在参数列表中，而是可以直接将其写在方括号中，并放在普通参数之后，从而节省标点符号。

    #info[
      译者注：这其实只是一个语法糖，即任何 `fn(...)[XXX][YYY][ZZZ]`，都会被自动转成 `fn(..., [XXX], [YYY], [ZZZ])`。

      所以你可以对任意一个函数使用，包括你自己的自定义函数，只要在转换后的结果符合函数入参要求即可。
    ]

    如上所示，这个语法是有效的。@par 函数左右对齐了里面的所有段落。  但是，将文稿包装在无数的函数中，并选择地就地应用样式，这很快就会变得麻烦且复杂。

    幸运的是，Typst 有一个更优雅的解决方案。  使用 _Set 规则_ ，您可以将样式属性应用于某类内容块的所有实例。  通过输入 `{set}` 关键字编写 Set 规则，后面跟随着你要设置属性的函数的名称，  并在括号中输入你需要的新默认参数列表。
  ],
)

```example
#set text(
  font: "New Computer Modern"
)

= Background
In the case of glaciers, fluid
dynamics principles can be used
to understand how the movement
and behaviour of the ice is
influenced by factors such as
temperature, pressure, and the
presence of other fluids (such as
water).
```

#info[
  #babel(
    en: [
      Want to know in more technical terms what is happening here?

      Set rules can be conceptualized as setting default values for some of the parameters of a function for all future uses of that function.
    ],
    zh-status: "need proofread",
    zh: [
      想以更深层的方式了解这里发生了什么吗？

      Set规则可以概念化为，为将来该函数的所有使用的某些参数设置默认值。
    ],
  )
]

= #babel(
  en: short-or-long[Autocomplete][The autocomplete panel],
  zh-status: "need proofread",
  zh: [自动补全面板],
) <autocomplete>
#babel(
  en: [
    If you followed along and tried a few things in the app, you might have noticed that always after you enter a `#` character, a panel pops up to show you the available functions, and, within an argument list, the available parameters. That's the autocomplete panel. It can be very useful while you are writing your document: You can apply its suggestions by hitting the Return key or navigate to the desired completion with the arrow keys. The panel can be dismissed by hitting the Escape key and opened again by typing `#` or hitting #kbd("Ctrl") + #kbd("Space"). Use the autocomplete panel to discover the right arguments for functions. Most suggestions come with a small description of what they do.
  ],
  zh-status: "need proofread",
  zh: [
    如果您按照操作并在App中尝试了一些操作，您可能已经注意到，在输入`#`字符后，总是会弹出一个面板，向您显示可用函数，并在参数列表中显示可用参数。这是自动补全面板。它在编写文档时非常有用：您可以通过按Return键或使用箭头键导航到所需的补全来应用该建议。面板可以通过按Esc键关闭，然后通过输入`#`或按 #kbd("Ctrl") + #kbd("Space") 再次打开。使用自动补全面板去掌握函数的正确参数。大多数建议都附有对它们所做的事情的简短描述。
  ],
)

#docs-figure(
  "2-formatting-autocomplete.png",
  alt: "Autocomplete panel",
  shadow: false,
)

= #babel(en: short-or-long[Page Setup][Set up the page], zh-status: "need proofread", zh: [设置页面]) <page-setup>
#babel(
  en: [
    Back to set rules: When writing a rule, you choose the function depending on what type of element you want to style. Here is a list of some functions that are commonly used in set rules:

    - @text to set font family, size, color, and other properties of text
    - @page to set the page size, margins, headers, enable columns, and footers
    - @par to justify paragraphs, set line spacing, and more
    - @heading to set the appearance of headings and enable numbering
    - @document to set the metadata contained in the PDF output, such as title and author

    Not all function parameters can be set. In general, only parameters that tell a function _how_ to do something can be set, not those that tell it _what_ to do it with. The function reference pages indicate which parameters are settable.

    Let's add a few more styles to our document. We want larger margins and a serif font. For the purposes of the example, we'll also set another page size.
  ],
  zh-status: "need proofread",
  zh: [
    回到Set规则：编写规则时，您可以根据要设置样式的元素类型来选择函数。以下是Set规则中常用的一些函数的列表：

    - @text\用于设置文本的字体、大小、颜色和其他属性
    - @page\用于设置页面大小、边距、页眉、启用栏和页脚
    - @par\用于对齐段落、设置行距等
    - @heading\用于设置标题的外观与启用编号
    - @document\用于设置PDF输出中包含的元数据，例如标题和作者

    并非所有函数参数都可以设置。通常，只能设置告诉函数_如何_做某事的参数，而不能设置告诉函数_做什么_的参数。函数参考页指明了哪些参数是可以应用Set规则的。

    让我们向文档添加更多样式，我们想要更大的边距和衬线字体。出于示例的目的，我们还将设置另一个页面大小。
  ],
)

```example
#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)
#set par(
  justify: true,
  leading: 0.52em,
)

= Introduction
In this report, we will explore the
various factors that influence fluid
dynamics in glaciers and how they
contribute to the formation and
behaviour of these natural structures.

>>> Glacier displacement is influenced
>>> by a number of factors, including
>>> + The climate
>>> + The topography
>>> + The geology
>>>
>>> This report will present a physical
>>> model of glacier displacement and
>>> dynamics, and will explore the
>>> influence of these factors on the
>>> movement of large bodies of ice.
<<< ...

#align(center + bottom)[
  #image("glacier.jpg", width: 70%)

  *Glaciers form an important
  part of the earth's climate
  system.*
]
```

#babel(
  en: [
    There are a few things of note here.

    First is the @page set rule. It receives two arguments: the page size and margins for the page. The page size is a string. Typst accepts @page.paper[many standard page sizes,] but you can also specify a custom page size. The margins are specified as a @dictionary[dictionary.] Dictionaries are a collection of key-value pairs. In this case, the keys are `x` and `y`, and the values are the horizontal and vertical margins, respectively. We could also have specified separate margins for each side by passing a dictionary with the keys `{left}`, `{right}`, `{top}`, and `{bottom}`.

    Next is the set @text set rule. Here, we set the font size to `{10pt}` and font family to `{"New Computer Modern"}`. The Typst app comes with many fonts that you can try for your document. When you are in the text function's argument list, you can discover the available fonts in the autocomplete panel.

    We have also set the spacing between lines (a.k.a. leading): It is specified as a @length[length] value, and we used the `em` unit to specify the leading relative to the size of the font: `{1em}` is equivalent to the current font size (which defaults to `{11pt}`).

    Finally, we have bottom aligned our image by adding a vertical alignment to our center alignment. Vertical and horizontal alignments can be combined with the `{+}` operator to yield a 2D alignment.
  ],
  zh-status: "need proofread",
  zh: [
    这里有几点需要注意。

    首先是@page\的Set规则，它接收两个参数：页面大小和页面边距。页面大小为字符串，Typst接受@page.paper[许多标准页面大小]，但您也可以指定自定义页面大小。边距为一个@dictionary[字典]，字典是键值对的集合。在本例中，键为`x`和`y`，值分别为水平边距和垂直边距。我们还可以通过传递带有键`{left}`、`{right}`、`{top}`和`{bottom}`的字典来为每边指定单独的边距。

    其次是@text\的Set规则。在这里，我们将字体大小设置为`{10pt}`，将字体设置为`{"NewComputerModern"}`。Typst App带有许多字体，您可以在您的文档自主尝试。当您在输入`text`函数的`font`参数时，您可以在自动补全面板中发现所有可用的字体。

    我们还设置了行间距（又名行距）：它被指定为@length[length]值，我们使用`em`单位来指定相对于字体大小的行距：`{1em}`相当于当前字体大小（默认为`{11pt}`）。

    最后，我们通过加入中心对齐和垂直对齐来对图像进行底部对齐。垂直和水平对齐可以与`{+}`运算符结合使用，以生成2D对齐。
  ],
)

= #babel(
  en: short-or-long[Sophistication][A hint of sophistication],
  zh-status: "need proofread",
  zh: [更复杂一点],
) <sophistication>
#babel(
  en: [
    To structure our document more clearly, we now want to number our headings. We can do this by setting the `numbering` parameter of the @heading function.
  ],
  zh-status: "need proofread",
  zh: [
    为了更清楚地组织我们的文档，我们现在要对标题进行编号。  我们可以通过设置 @heading 函数的 `numbering` 参数来做到这一点。
  ],
)

```example
>>> #set text(font: "New Computer Modern")
#set heading(numbering: "1.")

= Introduction
#lorem(10)

== Background
#lorem(12)

== Methods
#lorem(15)
```

#babel(
  en: [
    We specified the string `{"1."}` as the numbering parameter. This tells Typst to number the headings with arabic numerals and to put a dot between the number of each level. We can also use @numbering[letters, roman numerals, and symbols] for our headings:
  ],
  zh-status: "need proofread",
  zh: [
    我们指定了字符串`{"1."}`作为编号参数。这将告诉Typst用阿拉伯数字对标题进行编号，并在每个级别的编号之间放置一个点。我们还可以使用@numbering[字母，罗马数字和符号]作为编号：
  ],
)

```example
>>> #set text(font: "New Computer Modern")
#set heading(numbering: "1.a")

= Introduction
#lorem(10)

== Background
#lorem(12)

== Methods
#lorem(15)
```

#babel(
  en: [
    This example also uses the @lorem function to generate some placeholder text. This function takes a number as an argument and generates that many words of _Lorem Ipsum_ text.

    #info[
      Did you wonder why the headings and text set rules apply to all text and headings, even if they are not produced with the respective functions?

      Typst internally calls the `heading` function every time you write `[= Conclusion]`. In fact, the function call `[#heading[Conclusion]]` is equivalent to the heading markup above. Other markup elements work similarly, they are only _syntax sugar_ for the corresponding function calls.
    ]
  ],
  zh-status: "need proofread",
  zh: [
    此示例还使用@lorem\函数生成一些占位文本。此函数将一个数字作为参数，并生成许多_Lorem Ipsum_文本单词。

    #info[
      您是否想知道为什么标题和文本Set规则适用于所有文本和标题，即使它们不是使用函数生成的？

      Typst每次在你写`[=Conclusion]`时都会在内部调用`heading`函数。实际上，函数调用`[#heading[Conclusion]]`等效于上面的标题标记。其他标记元素的工作方式类似，它们仅仅是相应的函数调用的_语法糖_。
    ]
  ],
)

= #babel(en: [Show rules], zh-status: "proofread", zh: [show规则]) <show-rules>
#babel(
  en: [
    You are already pretty happy with how this turned out. But one last thing needs to be fixed: The report you are writing is intended for a larger project and that project's name should always be accompanied by a logo, even in prose.

    You consider your options. You could add an `[#image("logo.svg")]` call before every instance of the logo using search and replace. That sounds very tedious. Instead, you could maybe @function:defining-functions[define a custom function] that always yields the logo with its image. However, there is an even easier way:

    With show rules, you can redefine how Typst displays certain elements. You specify which elements Typst should show differently and how they should look. Show rules can be applied to instances of text, many functions, and even the whole document.
  ],
  zh-status: "need proofread",
  zh: [
    你已经对这个结果很满意了。但最后一件事需要修改：您正在编写的报告是为一个更大的项目准备的，在该项目的名称旁始终应该附上项目的Logo，即使是仅有文字的单调文章。

    你在考虑你的选择。您可以使用搜索和替换在Logo的每个实例之前添加`[#image("logo.svg")]`调用，这听起来很乏味。相反，你可以@function:defining-functions[定义一个自定义函数]，它将生成带有图像的Logo。但是，还有一种更简单的方法：

    使用Show规则，您可以重新定义Typst显示某些元素的方式。您可以指定Typst应以不同的方式显示哪些元素以及它们的外观。显示规则可以应用于文本实例、许多函数，甚至整个文档。
  ],
)

```example
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

This report is embedded in the
ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```

#babel(
  en: [
    There is a lot of new syntax in this example: We write the `{show}` keyword, followed by a string of text we want to show differently and a colon. Then, we write a function that takes the content that shall be shown as an argument. Here, we called that argument `name`. We can now use the `name` variable in the function's body to print the ArtosFlow name. Our show rule adds the logo image in front of the name and puts the result into a box to prevent linebreaks from occurring between logo and name. The image is also put inside of a box, so that it does not appear in its own paragraph.

    The calls to the first box function and the image function did not require a leading `#` because they were not embedded directly in markup. When Typst expects code instead of markup, the leading `#` is not needed to access functions, keywords, and variables. This can be observed in parameter lists, function definitions, and @reference:scripting[code blocks].
  ],
  zh-status: "need proofread",
  zh: [
    在这个例子中有很多新的语法：我们写入`{show}`关键字，后面跟一个我们希望以不同方式显示的文本字符串，以及一个冒号。然后，我们编写一个函数，该函数将应显示的内容作为参数输入，在这里，我们称该参数为`名称`。我们现在可以使用函数体中的`name`变量来输出名称`ArtosFlow`。我们的Show规则在名称前面添加Logo图像，并将结果放入`box`中，以防止Logo和名称之间出现换行符。图像也放在一个`box`中，这样它就不会出现在自己的段落中。

    对第一个`box`函数和`image`函数的调用不需要前导`#`，因为它们没有直接嵌入到标记文本中。当Typst处于代码模式而不是标记模式时，不需要前导`#`来访问函数、关键字和变量。同样的现象也可以在函数参数列表、函数定义和@reference:scripting[代码块]中观察到。
  ],
)

= #babel(en: [Review], zh-status: "need proofread", zh: [回顾]) <review>
#babel(
  en: [
    You now know how to apply basic formatting to your Typst documents. You learned how to set the font, justify your paragraphs, change the page dimensions, and add numbering to your headings with set rules. You also learned how to use a basic show rule to change how text appears throughout your document.

    You have handed in your report. Your supervisor was so happy with it that they want to adapt it into a conference paper! In the next section, we will learn how to format your document as a paper using more advanced show rules and functions.
  ],
  zh-status: "need proofread",
  zh: [
    您现在知道如何将基本格式应用于Typst文档。您学习了如何设置字体、对齐段落、更改页面尺寸以及使用Set规则向标题添加编号。您还学习了如何使用基本的Show规则来更改文本在整个文档中的显示方式。

    您提交了报告。您的导师对此非常满意，他们想将其改编成会议论文！在下一节中，我们将学习如何使用更高级的Show规则和函数将文档格式化为论文。
  ],
)
