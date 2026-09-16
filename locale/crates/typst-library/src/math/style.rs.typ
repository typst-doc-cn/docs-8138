#import "/i18n-scope.typ": *
#let live-item-data = (
  "bold": (
    9,
    babel(
      en: [
        Bold font style in math.

        ```example
        $ bold(A) := B^+ $
        ```
      ],
    ),
  ),
  "bold::body": (
    16,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "upright": (
    22,
    babel(
      en: [
        Upright (non-italic) font style in math.

        ```example
        $ upright(A) != A $
        ```
      ],
    ),
  ),
  "upright::body": (
    29,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "italic": (
    35,
    babel(
      en: [
        Italic font style in math.

        For roman letters and greek lowercase letters, this is already the default.
      ],
    ),
  ),
  "italic::body": (
    40,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "serif": (
    46,
    babel(
      en: [
        Serif (roman) font style in math.

        This is already the default.
      ],
    ),
  ),
  "serif::body": (
    51,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "sans": (
    57,
    babel(
      en: [
        Sans-serif font style in math.

        ```example
        $ sans(A B C) $
        ```
      ],
    ),
  ),
  "sans::body": (
    64,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "cal": (
    70,
    babel(
      en: [
        Calligraphic (chancery) font style in math.

        ```example
        Let $cal(P)$ be the set of ...
        ```

        This is the default calligraphic/script style for most math fonts. See
        @math.scr[`scr`] for more on how to get the other style (roundhand).
      ],
    ),
  ),
  "cal::body": (
    80,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "scr": (
    86,
    babel(
      en: [
        Script (roundhand) font style in math.

        ```example
        $scr(L)$ is not the set of linear
        maps $cal(L)$.
        ```

        There are two ways that fonts can support differentiating `cal` and `scr`.
        The first is using Unicode variation sequences. This works out of the box in
        Typst, however only a few math fonts currently support this.

        The other way is using @text.features[font features]. For example, the
        roundhand style might be available in a font through the
        _@text.stylistic-set[stylistic set] 1_ (`ss01`) feature. To use it in Typst,
        you could then define your own version of `scr` like in the example below.

        #example(
          title: "Recreation using stylistic set 1",
          ```
          #let scr(it) = text(
            stylistic-set: 1,
            $cal(it)$,
          )

          We establish $cal(P) != scr(P)$.
          ```,
        )
      ],
    ),
  ),
  "scr::body": (
    115,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "frak": (
    121,
    babel(
      en: [
        Fraktur font style in math.

        ```example
        $ frak(P) $
        ```
      ],
    ),
  ),
  "frak::body": (
    132,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "mono": (
    138,
    babel(
      en: [
        Monospace font style in math.

        ```example
        $ mono(x + y = z) $
        ```
      ],
    ),
  ),
  "mono::body": (
    145,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "bb": (
    151,
    babel(
      en: [
        Blackboard bold (double-struck) font style in math.

        For uppercase latin letters, blackboard bold is additionally available
        through @sym[symbols] of the form `NN` and `RR`.

        ```example
        $ bb(b) $
        $ bb(N) = NN $
        $ f: NN -> RR $
        ```
      ],
    ),
  ),
  "bb::body": (
    163,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "display": (
    169,
    babel(
      en: [
        Forced display style in math.

        This is the normal size for block equations.

        ```example
        $sum_i x_i/2 = display(sum_i x_i/2)$
        ```
      ],
    ),
  ),
  "display::body": (
    178,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "display::cramped": (
    180,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "inline": (
    190,
    babel(
      en: [
        Forced inline (text) style in math.

        This is the normal size for inline equations.

        ```example
        $ sum_i x_i/2
            = inline(sum_i x_i/2) $
        ```
      ],
    ),
  ),
  "inline::body": (
    200,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "inline::cramped": (
    202,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "script": (
    212,
    babel(
      en: [
        Forced script style in math.

        This is the smaller size used in powers or sub- or superscripts.

        ```example
        $sum_i x_i/2 = script(sum_i x_i/2)$
        ```
      ],
    ),
  ),
  "script::body": (
    221,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "script::cramped": (
    223,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "sscript": (
    233,
    babel(
      en: [
        Forced second script style in math.

        This is the smallest size, used in second-level sub- and superscripts
        (script of the script).

        ```example
        $sum_i x_i/2 = sscript(sum_i x_i/2)$
        ```
      ],
    ),
  ),
  "sscript::body": (
    243,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "sscript::cramped": (
    245,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
)
