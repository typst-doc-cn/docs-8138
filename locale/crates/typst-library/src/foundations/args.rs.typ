#import "/i18n-scope.typ": *
#let live-item-data = (
  "Args": (
    16,
    [
      #babel(
        en: [
          Captured arguments to a function.

          Arguments are either _positional_ or _named,_ and can be accessed through
          the @arguments.pos[`pos`], @arguments.named[`named`], and
          @arguments.at[`at`] methods.

          Additionally, named arguments can be accessed with @arguments.at[field
            syntax] similar to @dictionary[dictionaries].
        ],
        zh-status: "need proofread",
        zh: [
          函数捕获的参数。

          参数要么是_位置参数_，要么是_命名参数_，可以通过@arguments.pos[`pos`]、@arguments.named[`named`]和@arguments.at[`at`]方法访问。

          此外，命名参数还可以像@dictionary[字典]一样，用@arguments.at[字段语法]访问。
        ],
      )

      = #babel(en: [Argument Sinks], zh-status: "need proofread", zh: [参数收集器]) <argument-sinks>
      #babel(
        en: [
          Like built-in functions, custom functions can also take a variable number of
          arguments. You can specify an _argument sink_ which collects all excess
          arguments as `..sink`. The resulting `sink` value is of the `arguments`
          type. It exposes methods to access the positional and named arguments.
        ],
        zh-status: "need proofread",
        zh: [
          与内置函数一样，自定义函数也可以接受可变数量的参数。您可以指定一个_参数收集器_，将所有多余参数收集到`..sink`中。生成的`sink`值是`arguments`类型。它提供了一些方法，用于访问位置参数和命名参数。
        ],
      )

      ```example
      #let format(title, ..authors) = {
        let by = authors
          .pos()
          .join(", ", last: " and ")

        [*#title* \ _Written by #by;_]
      }

      #format("ArtosFlow", "Jane", "Joe")
      ```

      = #babel(en: [Spreading], zh-status: "need proofread", zh: [展开]) <spreading>
      #babel(
        en: [
          Inversely to an argument sink, you can _spread_ arguments, arrays and
          dictionaries into a function call with the `..spread` operator:
        ],
        zh-status: "need proofread",
        zh: [
          与参数收集器相反，您可以使用`..spread`运算符，将参数、数组和字典_展开_到函数调用中：
        ],
      )

      ```example
      #let array = (2, 3, 5)
      #calc.min(..array)
      #let dict = (fill: blue)
      #text(..dict)[Hello]
      ```
    ],
  ),
  "Args::construct": (
    323,
    [
      #babel(
        en: [
          Construct spreadable arguments in place.

          This function behaves like `{let args(..sink) = sink}`.
        ],
        zh-status: "need proofread",
        zh: [
          就地构造可展开的参数。

          此函数的行为类似于`{let args(..sink) = sink}`。
        ],
      )

      ```example
      #let args = arguments(stroke: red, inset: 1em, [Body])
      #box(..args)
      ```
    ],
  ),
  "Args::construct::arguments": (
    334,
    babel(
      en: [
        The arguments to construct.
      ],
      zh-status: "need proofread",
      zh: [
        要构造的参数。
      ],
    ),
  ),
  "Args::len": (
    342,
    babel(
      en: [
        The number of arguments, positional or named.
      ],
    ),
  ),
  "Args::at": (
    348,
    babel(
      en: [
        Returns the positional argument at the specified index, or the named
        argument with the specified name.

        If the key is an @int[integer], this is equivalent to first calling
        @arguments.pos[`pos`] and then @array.at. If it is a @str[string], this
        is equivalent to first calling @arguments.named[`named`] and then
        @dictionary.at.

        Named arguments can also be accessed with field syntax (e.g.
        `{arguments(key: 42).key}`) if no default is needed. Unlike
        @dictionary[dictionaries], fields on arguments cannot be modified.
      ],
      zh-status: "need proofread",
      zh: [
        返回指定索引处的位置参数，或指定名称的命名参数。

        如果键是@int[整数]，这相当于先调用@arguments.pos[`pos`]，再调用@array.at；如果是@str[字符串]，则相当于先调用@arguments.named[`named`]，再调用@dictionary.at。

        如果不需要默认值，命名参数还可以用字段语法访问（例如`{arguments(key: 42).key}`）。与@dictionary[字典]不同，参数上的字段无法修改。
      ],
    ),
  ),
  "Args::at::key": (
    362,
    babel(
      en: [
        The index or name of the argument to get.
      ],
      zh-status: "need proofread",
      zh: [
        要获取的参数的索引或名称。
      ],
    ),
  ),
  "Args::at::default": (
    364,
    babel(
      en: [
        A default value to return if the key is invalid.
      ],
    ),
  ),
  "Args::to_pos": (
    374,
    babel(
      en: [
        Returns the captured positional arguments as an array.
      ],
      zh-status: "need proofread",
      zh: [
        将捕获的位置参数以数组形式返回。
      ],
    ),
  ),
  "Args::to_named": (
    384,
    babel(
      en: [
        Returns the captured named arguments as a dictionary.
      ],
      zh-status: "need proofread",
      zh: [
        将捕获的命名参数以字典形式返回。
      ],
    ),
  ),
  "Args::filter": (
    393,
    [
      #babel(
        en: [
          Produces a new `arguments` with only the arguments for which the value
          passes the test.
        ],
      )

      ```example
      #{
        arguments(-1, a: 0, b: 1, 2)
          .filter(v => v > 0)
      }
      ```
    ],
  ),
  "Args::filter::test": (
    407,
    babel(
      en: [
        The function to apply to each value. Must return a boolean.
      ],
    ),
  ),
  "Args::map": (
    422,
    [
      #babel(
        en: [
          Produces a new `arguments` by transforming each argument value with the
          passed function.
        ],
      )

      ```example
      #{
        arguments(0, a: 1, 2)
          .map(v => v + 1)
      }
      ```
    ],
  ),
  "Args::map::mapper": (
    436,
    babel(
      en: [
        The function to apply to each value.
      ],
    ),
  ),
)
