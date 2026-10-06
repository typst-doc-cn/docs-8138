#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Scripting",
    zh-status: "proofread",
    zh: "脚本",
  ),
  route: "/reference/scripting",
  description: babel(
    en: "Automate your document with Typst's scripting capabilities.",
    zh-status: "need proofread",
    zh: "利用Typst的脚本功能让文档自动化。",
  ),
)

#babel(
  en: [
    Typst embeds a powerful scripting language. You can automate your documents and create more sophisticated styles with code. Below is an overview over the scripting concepts.
  ],
  zh-status: "need proofread",
  zh: [
    Typst内置了一门强大的脚本语言。您可以用代码让文档自动化，并创建更复杂的样式。下面概述脚本相关的概念。
  ],
)

= #babel(en: [Expressions], zh-status: "proofread", zh: [表达式]) <expressions>
#babel(
  en: [
    In Typst, markup and code are fused into one. All but the most common elements are created with _functions._ To make this as convenient as possible, Typst provides compact syntax to embed a code expression into markup: An expression is introduced with a hash (`#`) and normal markup parsing resumes after the expression is finished. If a character would continue the expression but should be interpreted as text, the expression can forcibly be ended with a semicolon (`;`). You can @reference:syntax:escapes[escape a literal `#` or `;` with a backslash].
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，标记与代码融为一体。除了最常见的文档元素，其他所有元素都由_函数_创建。为了尽可能方便，Typst提供了简洁的语法，可将代码表达式嵌入标记中：用井号（`#`）引入一个表达式，表达式结束后即恢复正常标记解析。如果某个字符本会延续表达式，但应解释为文本，可以用分号（`;`）强行结束表达式。您也可以@reference:syntax:escapes[用反斜杠转义字面的`#`或`;`]。
  ],
)

```example
#emph[Hello] \
#emoji.face \
#"hello".len()
```

#babel(
  en: [
    The example above shows a few of the available expressions, including @function[function calls], @reference:scripting:fields[field accesses], and @reference:scripting:methods[method calls]. More kinds of expressions are discussed in the remainder of this chapter. A few kinds of expressions are not compatible with the hash syntax (e.g. binary operator expressions). To embed these into markup, you can use parentheses, as in `[#(1 + 2)]`.
  ],
  zh-status: "need proofread",
  zh: [
    上面的示例展示了几种可用的表达式，包括@function[函数调用]、@reference:scripting:fields[字段访问]和@reference:scripting:methods[方法调用]。本章余下部分会介绍更多种类的表达式。有几种表达式与井号语法不兼容（如二元运算表达式），要把它们嵌入标记中，可以使用圆括号，例如`[#(1 + 2)]`。
  ],
)

= #babel(en: [Blocks], zh-status: "need proofread", zh: [块]) <blocks>
#babel(
  en: [
    To structure your code and embed markup into it, Typst provides two kinds of _blocks:_

    - *Code block:* `{{ let x = 1; x + 2 }}` \
      When writing code, you'll probably want to split up your computation into multiple statements, create some intermediate variables and so on. Code blocks let you write multiple expressions where one is expected. The individual expressions in a code block should be separated by line breaks or semicolons. The output values of the individual expressions in a code block are joined to determine the block's value. Expressions without useful output, like `{let}` bindings yield `{none}`, which can be joined with any value without effect.

    - *Content block:* `{[*Hey* there!]}` \
      With content blocks, you can handle markup/content as a programmatic value, store it in variables and pass it to @function[functions]. Content blocks are delimited by square brackets and can contain arbitrary markup. A content block results in a value of type @content[content]. An arbitrary number of content blocks can be passed as trailing arguments to functions. That is, `{list([A], [B])}` is equivalent to `{list[A][B]}`.

    Content and code blocks can be nested arbitrarily. In the example below, `{[hello ]}` is joined with the output of  `{a + [ the ] + b}` yielding `{[hello from the *world*]}`.
  ],
  zh-status: "need proofread",
  zh: [
    为了组织代码，并将标记嵌入代码中，Typst提供了两种_块_：

    - *脚本块：* `{{ let x = 1; x + 2 }}` \
      编写代码时，您可能需要把一段计算拆成多条语句，创建一些中间变量，等等。在只允许写一个表达式的地方，脚本块可以让您写多个表达式。脚本块中的各个表达式应以换行或分号分隔。脚本块中各个表达式的输出值会合并起来，共同决定脚本块的值。有些表达式没有有用的输出，比如`{let}`绑定产出`{none}`，它与任何值合并都不会产生影响。

    - *内容块：* `{[*Hey* there!]}` \
      使用内容块，可以把标记（内容）当作可编程的值，存入变量，或传给@function[函数]。内容块由方括号界定，其中可以包含任意标记。一个内容块会生成一个@content[content]类型的值。可以按尾随参数的形式，把任意多个内容块传给函数，即`{list([A], [B])}`等价于`{list[A][B]}`。

    内容块和脚本块可以任意嵌套。下面示例中，`{[hello ]}`与`{a + [ the ] + b}`的输出合并，得到`{[hello from the *world*]}`。
  ],
)

```example
#{
  let a = [from]
  let b = [*world*]
  [hello ]
  a + [ the ] + b
}
```

= #babel(en: short-or-long[Bindings][Bindings and Destructuring], zh-status: "proofread", zh: [绑定和解构]) <bindings>
#babel(
  en: [
    As already demonstrated above, variables can be defined with `{let}` bindings. The variable is assigned the value of the expression that follows the `=` sign. A @reference:syntax:identifiers[valid variable name] may contain `-`, but cannot start with `-`. The assignment of a value is optional, if no value is assigned, the variable will be initialized as `{none}`. The `{let}` keyword can also be used to create a @function:defining-functions[custom named function]. Variables can be accessed for the rest of the containing block (or the rest of the file if there is no containing block).
  ],
  zh-status: "need proofread",
  zh: [
    如上文所述，可以用`{let}`绑定来定义变量。变量会取得等号`=`后表达式的值。@reference:syntax:identifiers[合法的变量名]可以包含`-`，但不能以`-`开头。赋值是可选的：如果没有赋值，变量会初始化为`{none}`。`{let}`关键字也可用于创建@function:defining-functions[自定义命名函数]。变量在其所在块的剩余部分都可以访问（如果没有外层块，则在整个文件的剩余部分都可以访问）。
  ],
)

```example
#let name = "Typst"
This is #name's documentation.
It explains #name.

#let my-add(x, y) = x + y
Sum is #my-add(2, 3).
```

#babel(
  en: [
    Let bindings can also be used to destructure @array[arrays] and @dictionary[dictionaries]. In this case, the structure of the left-hand side of the assignment should mirror the array or dictionary: With bindings corresponding by position for arrays and by key name for dictionaries. The `..` operator can be used once in the pattern to collect the remainder of the array's or the dictionary's items.
  ],
  zh-status: "need proofread",
  zh: [
    `let`绑定也可用于解构@array[数组]和@dictionary[字典]。此时，赋值左侧的结构应与数组或字典相对应：数组按位置对应，字典按键名对应。模式中可以使用一次`..`运算符，用来收集数组或字典中剩余的条目。
  ],
)

```example
#let (x, y) = (1, 2)
The coordinates are #x, #y.

#let (a, .., b) = (1, 2, 3, 4)
The first element is #a.
The last element is #b.

#let books = (
  Shakespeare: "Hamlet",
  Homer: "The Odyssey",
  Austen: "Persuasion",
)

#let (Austen,) = books
Austen wrote #Austen.

#let (Homer: h) = books
Homer wrote #h.

#let (Homer, ..other) = books
#for (author, title) in other [
  #author wrote #title.
]
```

#babel(
  en: [
    You can use the underscore to discard elements in a destructuring pattern:
  ],
  zh-status: "need proofread",
  zh: [
    在解构模式中，可以用下划线`_`丢弃元素：
  ],
)

```example
#let (_, y, _) = (1, 2, 3)
The y coordinate is #y.
```

#babel(
  en: [
    Destructuring also works in argument lists of functions ...
  ],
  zh-status: "need proofread",
  zh: [
    解构也可用于函数的参数列表中……
  ],
)

```example
#let left = (2, 4, 5)
#let right = (3, 2, 6)
#left.zip(right).map(
  ((a,b)) => a + b
)
```

#babel(
  en: [
    ... and on the left-hand side of normal assignments. This can be useful to swap variables among other things.
  ],
  zh-status: "need proofread",
  zh: [
    ……也可用于普通赋值的左侧。除其他用途外，这还可用来交换两个变量的值。
  ],
)

```example
#{
  let a = 1
  let b = 2
  (a, b) = (b, a)
  [a = #a, b = #b]
}
```

= #babel(en: [Conditionals], zh-status: "proofread", zh: [条件控制]) <conditionals>
#babel(
  en: [
    With a conditional, you can display or compute different things depending on whether some condition is fulfilled. Typst supports `{if}`, `{else if}` and `{else}` expressions. When the condition evaluates to `{true}`, the conditional yields the value resulting from the if's body. Otherwise, it yields the value resulting from the else's body.
  ],
  zh-status: "need proofread",
  zh: [
    借助条件表达式，您可以根据某个条件是否成立，展示或计算不同的内容。Typst支持`{if}`、`{else if}`和`{else}`表达式。当条件求值为`{true}`时，条件表达式产出`if`分支主体的值；否则产出`else`分支主体的值。
  ],
)

```example
#if 1 < 2 [
  This is shown
] else [
  This is not.
]
```

#babel(
  en: [
    Each branch can have a code or content block as its body.
  ],
  zh-status: "need proofread",
  zh: [
    每个分支的主体可以是脚本块或内容块。
  ],
)

- `{if condition {..}}`
- `{if condition [..]}`
- `{if condition [..] else {..}}`
- `{if condition [..] else if condition {..} else [..]}`

= #babel(en: [Loops], zh-status: "proofread", zh: [循环控制]) <loops>
#babel(
  en: [
    With loops, you can repeat content or compute something iteratively. Typst supports two types of loops: `{for}` and `{while}` loops. The former iterate over a specified collection whereas the latter iterate as long as a condition stays fulfilled. Just like blocks, loops _join_ the results from each iteration into one value.

    In the example below, the three sentences created by the for loop join together into a single content value and the length-1 arrays in the while loop join together into one larger array.
  ],
  zh-status: "need proofread",
  zh: [
    使用循环，您可以重复内容，或反复计算某些东西。Typst支持两种循环：`{for}`循环和`{while}`循环。前者遍历指定的集合，后者在条件持续成立时反复迭代。和块一样，循环会把每次迭代的结果_合并_为一个值。

    下面示例中，for循环生成的三句话会合并成一个内容值，while循环中各个长度为1的数组会合并成一个大数组。
  ],
)

```example
#for c in "ABC" [
  #c is a letter.
]

#let n = 2
#while n < 10 {
  n = (n * 2) - 1
  (n,)
}
```

#babel(
  en: [
    For loops can iterate over a variety of collections:
  ],
  zh-status: "need proofread",
  zh: [
    for循环可以遍历多种集合：
  ],
)

- `{for value in array {..}}` \
  #babel(
    en: [
      Iterates over the items in the @array[array]. The destructuring syntax described in @reference:scripting:bindings[Let binding] can also be used here.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@array[数组]中的条目。@reference:scripting:bindings[let绑定]中介绍的解构语法在这里也可以使用。
    ],
  )

- `{for pair in dict {..}}` \
  #babel(
    en: [
      Iterates over the key-value pairs of the @dictionary[dictionary]. The pairs can also be destructured by using `{for (key, value) in dict {..}}`. It is more efficient than `{for pair in dict.pairs() {..}}` because it doesn't create a temporary array of all key-value pairs.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@dictionary[字典]的键值对。也可以使用`{for (key, value) in dict {..}}`来解构键值对。这比`{for pair in dict.pairs() {..}}`更高效，因为它不会创建包含所有键值对的临时数组。
    ],
  )

- `{for letter in "abc" {..}}` \
  #babel(
    en: [
      Iterates over the characters of the @str[string]. Technically, it iterates over the grapheme clusters of the string. Most of the time, a grapheme cluster is just a single codepoint. However, a grapheme cluster could contain multiple codepoints, like a flag emoji.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@str[字符串]中的字符。严格来说，它遍历的是字符串的字素簇。大多数字素簇只是一个码位，但一个字素簇也可能包含多个码位，比如旗帜表情符号。
    ],
  )

- `{for byte in bytes("😀") {..}}` \
  #babel(
    en: [
      Iterates over the @bytes[bytes], which can be converted from a @str[string] or @read[read] from a file without encoding. Each byte value is an @int[integer] between `{0}` and `{255}`.
    ],
    zh: [],
  )

#babel(
  en: [
    To control the execution of the loop, Typst provides the `{break}` and `{continue}` statements. The former performs an early exit from the loop while the latter skips ahead to the next iteration of the loop.
  ],
  zh-status: "need proofread",
  zh: [
    Typst提供了`{break}`和`{continue}`语句来控制循环的执行。前者提前退出循环，后者跳过本次迭代，直接进入下一次迭代。
  ],
)

```example
#for letter in "abc nope" {
  if letter == " " {
    break
  }

  letter
}
```

#babel(
  en: [
    The body of a loop can be a code or content block:
  ],
  zh-status: "need proofread",
  zh: [
    循环体可以是脚本块，也可以是内容块：
  ],
)

- `{for .. in collection {..}}`
- `{for .. in collection [..]}`
- `{while condition {..}}`
- `{while condition [..]}`

= #babel(en: [Fields], zh-status: "proofread", zh: [字段]) <fields>
#babel(
  en: [
    You can use _dot notation_ to access fields on a value. For values of type @content, you can also use the @content.fields[`fields`] function to list the fields.

    The value in question can be either:
    - a @dictionary[dictionary] that has the specified key,
    - a @symbol[symbol] that has the specified modifier,
    - a @module[module] containing the specified definition,
    - @content[content] consisting of an element that has the specified field. The available fields match the arguments of the @function:element-functions[element function] that were given when the element was constructed.
  ],
  zh-status: "need proofread",
  zh: [
    您可以使用_点号_来访问值上的字段。对于@content\类型的值，还可以使用@content.fields[`fields`]函数列出其字段。

    所访问的值可以是：

    - 具有指定键的@dictionary[字典]，
    - 具有指定修饰符的@symbol[符号]，
    - 包含指定定义的@module[模块]，
    - 由具有指定字段的元素构成的@content[内容]，可用字段与构造该元素时传给@function:element-functions[元素函数]的参数相匹配。
  ],
)

```example
#let it = [= Heading]
#it.body \
#it.depth \
#it.fields()

#let dict = (greet: "Hello")
#dict.greet \
#emoji.face

```

= Methods <methods>
A _method call_ is a convenient way to call a function that is scoped to a value's @type[type]. For example, we can call the @str.len function in the following two equivalent ways:

```example
#str.len("abc") is the same as
#"abc".len()
```

The structure of a method call is `{value.method(..args)}` and its equivalent full function call is `{type(value).method(value, ..args)}`. The documentation of each type lists its scoped functions. You cannot currently define your own methods.

```example
#let values = (1, 2, 3, 4)
#values.pop() \
#values.len() \

#("a, b, c"
    .split(", ")
    .join[ --- ])

#"abc".len() is the same as
#str.len("abc")
```

There are a few special functions that modify the value they are called on (e.g. @array.push). These functions _must_ be called in method form. In some cases, when the method is only called for its side effect, its return value should be ignored (and not participate in joining). The canonical way to discard a value is with a let binding: `{let _ = array.remove(1)}`.

= #babel(en: [Modules], zh-status: "proofread", zh: [模块]) <modules>
#babel(
  en: [
    You can split up your Typst projects into multiple files called _modules._ A module can refer to the content and definitions of another module in multiple ways:

    - *Including:* `{include "bar.typ"}` \
      Evaluates the file at the @path[path] `bar.typ` and returns the resulting @content[content].

    - *Import:* `{import "bar.typ"}` \
      Evaluates the file at the @path[path] `bar.typ` and inserts the resulting @module[module] into the current scope as `bar` (filename without extension). You can use the `as` keyword to rename the imported module: `{import "bar.typ" as baz}`. You can import nested items using dot notation: `{import "bar.typ": baz.a}`.

    - *Import items:* `{import "bar.typ": a, b}` \
      Evaluates the file at the @path[path] `bar.typ`, extracts the values of the variables `a` and `b` (that need to be defined in `bar.typ`, e.g. through `{let}` bindings) and defines them in the current file. Replacing `a, b` with `*` loads all variables defined in a module. You can use the `as` keyword to rename the individual items: `{import "bar.typ": a as one, b as two}`

    Instead of a string or @path[path], you can also use a @module[module value], as shown in the following example:
  ],
  zh-status: "need proofread",
  zh: [
    您可以把Typst项目拆分到多个文件中，这些文件称为_模块_。一个模块可以用多种方式引用另一个模块的内容和定义：

    - *包含：* `{include "bar.typ"}` \
      对@path[路径]`bar.typ`处的文件求值，返回得到的@content[内容]。

    - *导入：* `{import "bar.typ"}` \
      对@path[路径]`bar.typ`处的文件求值，并将得到的@module[模块]以`bar`（不带扩展名的文件名）之名插入当前作用域。您可以使用`as`关键字重命名导入的模块：`{import "bar.typ" as baz}`。您还可以使用点号导入嵌套的条目：`{import "bar.typ": baz.a}`。

    - *导入条目：* `{import "bar.typ": a, b}` \
      对@path[路径]`bar.typ`处的文件求值，提取变量`a`和`b`的值（这些变量需在`bar.typ`中定义，例如通过`{let}`绑定），并在当前文件中定义它们。把`a, b`替换为`*`，可以加载模块中定义的所有变量。您可以使用`as`关键字重命名单个条目：`{import "bar.typ": a as one, b as two}`

    除了字符串或@path[路径]之外，您还可以使用@module[模块值]，如下面示例所示：
  ],
)

```example
#import emoji: face
#face.grin
```

= #babel(en: [Packages], zh-status: "proofread", zh: [包]) <packages>
#babel(
  en: [
    To reuse building blocks across projects, you can also create and import Typst _packages._ A package import is specified as a triple of a namespace, a name, and a version.
  ],
  zh-status: "need proofread",
  zh: [
    为了在不同项目间复用构建模块，您还可以创建并导入Typst_包_。导入包时需指定由命名空间、名称和版本号构成的三元组。
  ],
)

```example
>>> #let add(x, y) = x + y
<<< #import "@preview/example:0.1.0": add
#add(2, 7)
```

#babel(
  en: [
    The `preview` namespace contains packages shared by the community. You can find all available community packages on #link("https://typst.app/universe")[Typst Universe].

    If you are using Typst locally, you can also create your own system-local packages. For more details on this, see the #link("https://github.com/typst/packages")[package repository].
  ],
  zh-status: "need proofread",
  zh: [
    `preview`命名空间包含社区分享的包。您可以在#link("https://typst.app/universe")[Typst Universe]上找到所有可用的社区包。

    如果您在本地使用Typst，也可以创建自己的系统本地包。更多详情请参见#link("https://github.com/typst/packages")[包仓库]。
  ],
)

= #babel(en: [Operators], zh-status: "need proofread", zh: [操作符]) <operators>
#babel(
  en: [
    The following table lists all available unary and binary operators with effect, arity (unary, binary) and precedence level (higher binds stronger). Some operations, such as @calc.rem-euclid[modulus], do not have a special syntax and can be achieved using functions from the @calc module.
  ],
  zh-status: "need proofread",
  zh: [
    下表列出了所有可用的一元与二元操作符，以及它们的作用、参数数量（一元、二元）和优先级级别（数值越大，结合越紧密）。有些运算（如@calc.rem-euclid[取模]）没有专门的语法，可以用@calc\模块中的函数实现。
  ],
)

#let i18n--arity = (
  unary: babel(
    en: [Unary],
    zh-status: "proofread",
    zh: [一元],
  ),
  binary: babel(
    en: [Binary],
    zh-status: "proofread",
    zh: [二元],
  ),
)

#docs-table(
  table.header(
    babel(en: [Operator], zh-status: "need proofread", zh: [操作符]),
    babel(en: [Effect], zh-status: "need proofread", zh: [作用说明]),
    babel(en: [Arity], zh-status: "need proofread", zh: [参数数量]),
    babel(en: [Precedence], zh-status: "proofread", zh: [优先级]),
  ),

  [`{-}`],
  babel(en: [Negation], zh-status: "proofread", zh: [负号]),
  i18n--arity.unary,
  [7],

  [`{+}`],
  babel(en: [No effect (exists for symmetry)], zh-status: "need proofread", zh: [无作用（为对称而存在）]),
  i18n--arity.unary,
  [7],

  [`{*}`],
  babel(en: [Multiplication], zh-status: "proofread", zh: [乘号]),
  i18n--arity.binary,
  [6],

  [`{/}`],
  babel(en: [Division], zh-status: "proofread", zh: [除号]),
  i18n--arity.binary,
  [6],

  [`{+}`],
  babel(en: [Addition], zh-status: "proofread", zh: [加号]),
  i18n--arity.binary,
  [5],

  [`{-}`],
  babel(en: [Subtraction], zh-status: "proofread", zh: [减号]),
  i18n--arity.binary,
  [5],

  [`{==}`],
  babel(en: [Check equality], zh-status: "proofread", zh: [等号]),
  i18n--arity.binary,
  [4],

  [`{!=}`],
  babel(en: [Check inequality], zh-status: "need proofread", zh: [不等于号]),
  i18n--arity.binary,
  [4],

  [`{<}`],
  babel(en: [Check less-than], zh-status: "proofread", zh: [小于号]),
  i18n--arity.binary,
  [4],

  [`{<=}`],
  babel(en: [Check less-than or equal], zh-status: "proofread", zh: [小于等于号]),
  i18n--arity.binary,
  [4],

  [`{>}`],
  babel(en: [Check greater-than], zh-status: "proofread", zh: [大于号]),
  i18n--arity.binary,
  [4],

  [`{>=}`],
  babel(en: [Check greater-than or equal], zh-status: "proofread", zh: [大于等于号]),
  i18n--arity.binary,
  [4],

  [`{in}`],
  babel(en: [Check if in collection], zh-status: "proofread", zh: [属于]),
  i18n--arity.binary,
  [4],

  [`{not in}`],
  babel(en: [Check if not in collection], zh-status: "proofread", zh: [不属于]),
  i18n--arity.binary,
  [4],

  [`{not}`],
  babel(en: [Logical "not"], zh-status: "need proofread", zh: [逻辑非]),
  i18n--arity.unary,
  [3],

  [`{and}`],
  babel(en: [Short-circuiting logical "and"], zh-status: "need proofread", zh: [短路逻辑与]),
  i18n--arity.binary,
  [3],

  [`{or}`],
  babel(en: [Short-circuiting logical "or"], zh-status: "need proofread", zh: [短路逻辑或]),
  i18n--arity.binary,
  [2],

  [`{=}`],
  babel(en: [Assignment], zh-status: "need proofread", zh: [赋值]),
  i18n--arity.binary,
  [1],

  [`{+=}`],
  babel(en: [Add-Assignment], zh-status: "need proofread", zh: [加法赋值]),
  i18n--arity.binary,
  [1],

  [`{-=}`],
  babel(en: [Subtraction-Assignment], zh-status: "need proofread", zh: [减法赋值]),
  i18n--arity.binary,
  [1],

  [`{*=}`],
  babel(en: [Multiplication-Assignment], zh-status: "need proofread", zh: [乘法赋值]),
  i18n--arity.binary,
  [1],

  [`{/=}`],
  babel(en: [Division-Assignment], zh-status: "need proofread", zh: [除法赋值]),
  i18n--arity.binary,
  [1],
)
