#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter

#show: docs-chapter.with(
  title: babel(
    en: "Context",
    zh-status: "proofread",
    zh: "上下文",
  ),
  route: "/reference/context",
  description: babel(
    en: "How to deal with content that reacts to its location in the document.",
    zh-status: "need proofread",
    zh: "如何处理能够对自身在文档中的位置做出反应的内容。",
  ),
)

#babel(
  en: [
    Sometimes, we want to create content that reacts to its location in the document. This could be a localized phrase that depends on the configured text language or something as simple as a heading number which prints the right value based on how many headings came before it. However, Typst code isn't directly aware of its location in the document. Some code at the beginning of the source text could yield content that ends up at the back of the document.

    To produce content that is reactive to its surroundings, we must thus specifically instruct Typst: We do this with the `{context}` keyword, which precedes an expression and ensures that it is computed with knowledge of its environment. In return, the context expression itself ends up opaque. We cannot directly access whatever results from it in our code, precisely because it is contextual: There is no one correct result, there may be multiple results in different places of the document. For this reason, everything that depends on the contextual data must happen inside of the context expression.

    Aside from explicit context expressions, context is also established implicitly in some places that are also aware of their location in the document: @reference:styling:show-rules[Show rules] provide context #footnote[Currently, all show rules provide @reference:context:style-context[style context], but only show rules on @location:locatable[locatable] elements provide a @reference:context:location-context[location context].] and numberings in the outline, for instance, also provide the proper context to resolve counters.
  ],
  zh-status: "need proofread",
  zh: [
    有时，我们希望创建能够对自身在文档中的位置做出反应的内容。这可能是一句依赖文本语言设置的本地化短语，也可能简单到只是一个章节标题编号——它根据前面有多少个章节标题，打印出正确的值。然而，Typst代码并不直接知晓自己在文档中的位置：源文本开头的某些代码，其产生的内容最终可能位于文档末尾。

    因此，要产生能够对周围环境做出反应的内容，我们必须明确指示Typst。我们使用`{context}`关键字，它置于表达式之前，确保该表达式在计算时知晓其所处环境。相应地，上下文表达式本身变得不透明：我们无法在代码中直接访问它的任何结果，这恰恰因为它与上下文相关——并不存在唯一正确的结果，文档的不同位置可能得到不同的结果。因此，所有依赖上下文数据的事情都必须在上下文表达式内部完成。

    除了显式的上下文表达式，上下文也会在一些同样知晓自身文档位置的地方隐式建立：@reference:styling:show-rules[show规则]提供上下文#footnote[目前，所有show规则都提供@reference:context:style-context[样式上下文]，但只有@location:locatable[可定位]元素上的show规则才提供@reference:context:location-context[位置上下文]。]，而大纲中的编号等也会提供恰当的上下文来解析计数器。
  ],
)

= #babel(en: [Style context], zh-status: "proofread", zh: [样式上下文]) <style-context>
#babel(
  en: [
    With set rules, we can adjust style properties for parts or the whole of our document. We cannot access these without a known context, as they may change throughout the course of the document. When context is available, we can retrieve them simply by accessing them as fields on the respective element function.
  ],
  zh-status: "need proofread",
  zh: [
    利用set规则，我们可以为文档的一部分或全部调整样式属性。这些属性在文档全篇中可能发生变化，因此没有已知上下文就无法访问。而当上下文可用时，我们只需把它们当作相应元素函数上的字段来访问即可获取。
  ],
)

```example
#set text(lang: "de")
#context text.lang
```

#babel(
  en: [
    As explained above, a context expression is reactive to the different environments it is placed into. In the example below, we create a single context expression, store it in the `value` variable and use it multiple times. Each use properly reacts to the current surroundings.
  ],
  zh-status: "need proofread",
  zh: [
    如上所述，上下文表达式会对它所置入的不同环境做出反应。在下面的示例中，我们只创建一个上下文表达式，把它存入`value`变量并多次使用。每次使用都会正确地对当前环境做出反应。
  ],
)

```example
#let value = context text.lang
#value

#set text(lang: "de")
#value

#set text(lang: "fr")
#value
```

#babel(
  en: [
    Crucially, upon creation, `value` becomes opaque @content[content] that we cannot peek into. It can only be resolved when placed somewhere because only then the context is known. The body of a context expression may be evaluated zero, one, or multiple times, depending on how many different places it is put into.
  ],
  zh-status: "need proofread",
  zh: [
    关键在于，创建之后，`value`就变成不透明的@content[内容]，我们无法窥探其内部。只有把它放在某处时它才能被解析，因为只有到那时上下文才是已知的。上下文表达式的主体可能被求值零次、一次或多次，取决于它被放入多少个不同的地方。
  ],
)

= #babel(en: [Location context], zh-status: "proofread", zh: [位置上下文]) <location-context>
#babel(
  en: [
    We've already seen that context gives us access to set rule values. But it can do more: It also lets us know _where_ in the document we currently are, relative to other elements, and absolutely on the pages. We can use this information to create very flexible interactions between different document parts. This underpins features like heading numbering, the table of contents, or page headers dependent on section headings.

    Some functions like @counter.get implicitly access the current location. In the example below, we want to retrieve the value of the heading counter. Since it changes throughout the document, we need to first enter a context expression. Then, we use `get` to retrieve the counter's current value. This function accesses the current location from the context to resolve the counter value. Counters have multiple levels and `get` returns an array with the resolved numbers. Thus, we get the following result:
  ],
  zh-status: "need proofread",
  zh: [
    我们已经看到，上下文让我们能够访问set规则的值。它还能做得更多：它还让我们知道自己在文档中的_位置_——相对于其它元素的位置，以及在页面上的绝对位置。我们可以利用这些信息，在不同文档部分之间建立非常灵活的交互。章节标题编号、目录、依赖章节标题的页眉等功能都以此为基础。

    像@counter.get\这样的一些函数会隐式访问当前位置。在下面的示例中，我们希望获取章节标题计数器的值。由于它在文档全篇中会发生变化，我们需要先进入一个上下文表达式，然后使用`get`获取计数器的当前值。该函数从上下文中访问当前位置，以解析计数器的值。计数器可以有多个级别，而`get`返回一个包含已解析数字的数组。因此，我们得到以下结果：
  ],
)

```example
#set heading(numbering: "1.")

= Introduction
#lorem(5)

#context counter(heading).get()

= Background
#lorem(5)

#context counter(heading).get()
```

#babel(
  en: [
    For more flexibility, we can also use the @here function to directly extract the current @location[location] from the context. The example below demonstrates this:

    - We first have `{counter(heading).get()}`, which resolves to `{(2,)}` as before.
    - We then use the more powerful  @counter.at with @here, which in combination is equivalent to `get`, and thus get `{(2,)}`.
    - Finally, we use `at` with a @label[label] to retrieve the value of the counter at a _different_ location in the document, in our case that of the introduction heading. This yields `{(1,)}`. Typst's context system gives us time travel abilities and lets us retrieve the values of any counters and states at _any_ location in the document.
  ],
  zh-status: "need proofread",
  zh: [
    为了获得更大的灵活性，我们还可以使用@here\函数直接从上下文中提取当前的@location[位置]。下面的示例演示了这一点：

    - 首先，我们得到`{counter(heading).get()}`，它像之前一样解析为`{(2,)}`。
    - 接着，我们把更强大的@counter.at\与@here\结合使用，这等同于`get`，因此也得到`{(2,)}`。
    - 最后，我们把`at`与@label[标签]一起使用，以获取文档中_另一个_位置处计数器的值——在本例中即引言章节标题的位置。这会得到`{(1,)}`。Typst的上下文系统赋予我们时间旅行的能力，让我们能够获取文档中_任意_位置的任何计数器和状态的值。
  ],
)

```example
#set heading(numbering: "1.")

= Introduction <intro>
#lorem(5)

= Background <back>
#lorem(5)

#context [
  #counter(heading).get() \
  #counter(heading).at(here()) \
  #counter(heading).at(<intro>)
]
```

#babel(
  en: [
    As mentioned before, we can also use context to get the physical position of elements on the pages. We do this with the @locate function, which works similarly to `counter.at`: It takes a location or other @selector[selector] that resolves to a unique element (could also be a label) and returns the position on the pages for that element.
  ],
  zh-status: "need proofread",
  zh: [
    如前所述，我们还可以使用上下文来获取元素在页面上的物理位置。这要用@locate\函数实现，它的工作方式与`counter.at`类似：它接收一个位置，或其它能解析为唯一元素的@selector[选择器]（也可以是标签），并返回该元素在页面上的位置。
  ],
)

```example
Background is at: \
#context locate(<back>).position()

= Introduction <intro>
#lorem(5)
#pagebreak()

= Background <back>
#lorem(5)
```

#babel(
  en: [
    There are other functions that make use of the location context, most prominently @query. Take a look at the @reference:introspection[introspection] category for more details on those.
  ],
  zh-status: "need proofread",
  zh: [
    还有其他一些函数会用到位置上下文，其中最主要的是@query。更多细节请参阅@reference:introspection[内省]类别。
  ],
)

= #babel(en: [Nested contexts], zh-status: "need proofread", zh: [嵌套上下文]) <nested-contexts>
#babel(
  en: [
    Context is also accessible from within function calls nested in context blocks. In the example below, `foo` itself becomes a contextual function, just like @length.to-absolute[`to-absolute`] is.
  ],
  zh-status: "need proofread",
  zh: [
    在上下文块中嵌套的函数调用内部也可以访问上下文。在下面的示例中，`foo`本身也变成上下文函数，就像@length.to-absolute[`to-absolute`]一样。
  ],
)

```example
#let foo() = 1em.to-absolute()
#context {
  foo() == text.size
}
```

#babel(
  en: [
    Context blocks can be nested. Contextual code will then always access the innermost context. The example below demonstrates this: The first `text.lang` will access the outer context block's styles and as such, it will *not* see the effect of `{set text(lang: "fr")}`. The nested context block around the second `text.lang`, however, starts after the set rule and will thus show its effect.
  ],
  zh-status: "need proofread",
  zh: [
    上下文块可以嵌套，此时上下文代码总是访问最内层的上下文。下面的示例演示了这一点：第一个`text.lang`访问的是外层上下文块的样式，因此它*不会*看到`{set text(lang: "fr")}`的效果；而第二个`text.lang`周围的嵌套上下文块在那条set规则之后才开始，因此会体现其效果。
  ],
)

```example
#set text(lang: "de")
#context [
  #set text(lang: "fr")
  #text.lang \
  #context text.lang
]
```

#babel(
  en: [
    You might wonder why Typst ignores the French set rule when computing the first `text.lang` in the example above. The reason is that, in the general case, Typst cannot know all the styles that will apply as set rules can be applied to content after it has been constructed. Below, `text.lang` is already computed when the template function is applied. As such, it cannot possibly be aware of the language change to French in the template.
  ],
  zh-status: "need proofread",
  zh: [
    您可能想知道，为什么Typst在上例中计算第一个`text.lang`时会忽略那条法语的set规则。原因在于，一般情况下，set规则可以在内容构建完成之后再应用于该内容，因此Typst无法预先知道所有将要生效的样式。下面，`text.lang`在模板函数被应用时就已经计算好了，因此它不可能知道模板中语言已改为法语。
  ],
)

```example
#let template(body) = {
  set text(lang: "fr")
  upper(body)
}

#set text(lang: "de")
#context [
  #show: template
  #text.lang \
  #context text.lang
]
```

#babel(
  en: [
    The second `text.lang`, however, _does_ react to the language change because evaluation of its surrounding context block is deferred until the styles for it are known. This illustrates the importance of picking the right insertion point for a context to get access to precisely the right styles.

    The same also holds true for the location context. Below, the first `{c.display()}` call will access the outer context block and will thus not see the effect of `{c.update(2)}` while the second `{c.display()}` accesses the inner context and will thus see it.
  ],
  zh-status: "need proofread",
  zh: [
    而第二个`text.lang`则_确实_会对语言变化做出反应，因为对它所在的上下文块求值会推迟到该块的样式已知之后。这说明了为上下文选择正确插入点、以便访问到恰好正确的样式的重要性。

    位置上下文同样如此。下面，第一个`{c.display()}`调用访问的是外层上下文块，因此不会看到`{c.update(2)}`的效果；而第二个`{c.display()}`访问的是内层上下文，因此会看到该效果。
  ],
)

```example
#let c = counter("mycounter")
#c.update(1)
#context [
  #c.update(2)
  #c.display() \
  #context c.display()
]
```

= #babel(en: [Compiler iterations], zh-status: "need proofread", zh: [编译器迭代]) <compiler-iterations>
#babel(
  en: [
    To resolve contextual interactions, the Typst compiler processes your document multiple times. For instance, to resolve a `locate` call, Typst first provides a placeholder position, layouts your document and then recompiles with the known position from the finished layout. The same approach is taken to resolve counters, states, and queries. In certain cases, Typst may even need more than two iterations to resolve everything. While that's sometimes a necessity, it may also be a sign of misuse of contextual functions (e.g. of @state:caution[state]). If Typst cannot resolve everything within five attempts, it will stop and output the warning "document did not converge within five attempts."

    A very careful reader might have noticed that not all of the functions presented above actually make use of the current location. While `{counter(heading).get()}` definitely depends on it, `{counter(heading).at(<intro>)}`, for instance, does not. However, it still requires context. While its value is always the same _within_ one compilation iteration, it may change over the course of multiple compiler iterations. If one could call it directly at the top level of a module, the whole module and its exports could change over the course of multiple compiler iterations, which would not be desirable.
  ],
  zh-status: "need proofread",
  zh: [
    为了处理上下文交互，Typst编译器会多次处理您的文档。例如，为了解析一次`locate`调用，Typst先提供一个占位符位置，对文档进行布局，然后带着已完成布局中已知的位置重新编译。解析计数器、状态和查询也采用同样的方法。在某些情况下，Typst甚至可能需要不止两次迭代才能解析所有内容。虽然这有时是必要的，但也可能是上下文函数（例如@state:caution[状态]）使用不当的迹象。如果Typst无法在五次尝试内解析所有内容，它将停止并输出警告“文档在五次尝试内未能收敛”。

    非常仔细的读者可能已经注意到，上面介绍的函数并非都真的会用到当前位置。虽然`{counter(heading).get()}`肯定依赖它，但`{counter(heading).at(<intro>)}`之类的函数则不然。然而，它们仍然需要上下文。虽然其值在_一次_编译迭代中总是相同，但它可能在多轮编译迭代中发生变化。如果可以直接在模块顶层调用它，那么整个模块及其导出都可能在多轮编译迭代中发生变化，这显然不是我们想要的。
  ],
)
