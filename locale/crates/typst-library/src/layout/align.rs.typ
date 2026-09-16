#import "/i18n-scope.typ": *
#let live-item-data = (
  "AlignElem": (
    13,
    babel(
      en: [
        Aligns content horizontally and vertically.

        = Example <example>
        Let's start with centering our content horizontally:

        ```example
        #set page(height: 120pt)
        #set align(center)

        Centered text, a sight to see \
        In perfect balance, visually \
        Not left nor right, it stands alone \
        A work of art, a visual throne
        ```

        To center something vertically, use _horizon_ alignment:

        ```example
        #set page(height: 120pt)
        #set align(horizon)

        Vertically centered, \
        the stage had entered, \
        a new paragraph.
        ```

        = Combining alignments <combining-alignments>
        You can combine two alignments with the `+` operator. Let's also only apply
        this to one piece of content by using the function form instead of a set
        rule:

        ```example
        #set page(height: 120pt)
        Though left in the beginning ...

        #align(right + bottom)[
          ... they were right in the end, \
          and with addition had gotten, \
          the paragraph to the bottom!
        ]
        ```

        = Nested alignment <nested-alignment>
        You can use varying alignments for layout containers and the elements within
        them. This way, you can create intricate layouts:

        ```example
        #align(center, block[
          #set align(left)
          Though centered together \
          alone \
          we \
          are \
          left.
        ])
        ```

        = Alignment within the same line <alignment-within-the-same-line>
        The `align` function performs block-level alignment and thus always
        interrupts the current paragraph. To have different alignment for parts of
        the same line, you should use @h[fractional spacing] instead:

        ```example
        Start #h(1fr) End
        ```
      ],
    ),
  ),
  "AlignElem::alignment": (
    80,
    babel(
      en: [
        The @alignment[alignment] along both axes.

        ```example
        #set page(height: 6cm)
        #set text(lang: "ar")

        مثال
        #align(
          end + horizon,
          rect(inset: 12pt)[ركن]
        )
        ```
      ],
    ),
  ),
  "AlignElem::body": (
    97,
    babel(
      en: [
        The content to align.
      ],
    ),
  ),
  "Alignment": (
    102,
    babel(
      en: [
        Where to align something along an axis.

        Possible values are:
        - `start`: Aligns at the @direction.start[start] of the
          @text.dir[text direction].
        - `end`: Aligns at the @direction.end[end] of the @text.dir[text direction].
        - `left`: Align at the left.
        - `center`: Aligns in the middle, horizontally.
        - `right`: Aligns at the right.
        - `top`: Aligns at the top.
        - `horizon`: Aligns in the middle, vertically.
        - `bottom`: Align at the bottom.

        These values are available globally and also in the alignment type's scope,
        so you can write either of the following two:

        ```example
        #align(center)[Hi]
        #align(alignment.center)[Hi]
        ```

        = 2D alignments <2d-alignments>
        To align along both axes at the same time, add the two alignments using the
        `+` operator. For example, `top + right` aligns the content to the top right
        corner.

        ```example
        #set page(height: 3cm)
        #align(center + bottom)[Hi]
        ```

        = Fields <fields>
        The `x` and `y` fields hold the alignment's horizontal and vertical
        components, respectively (as yet another `alignment`). They may be `{none}`.

        ```example
        #(top + right).x \
        #left.x \
        #left.y (none)
        ```
      ],
    ),
  ),
  "Alignment::axis": (
    187,
    babel(
      en: [
        The axis this alignment belongs to.
        - `{"horizontal"}` for `start`, `left`, `center`, `right`, and `end`
        - `{"vertical"}` for `top`, `horizon`, and `bottom`
        - `{none}` for 2-dimensional alignments

        ```example
        #left.axis() \
        #bottom.axis()
        ```
      ],
    ),
  ),
  "Alignment::inv": (
    205,
    babel(
      en: [
        The inverse alignment.

        ```example
        #top.inv() \
        #left.inv() \
        #center.inv() \
        #(left + bottom).inv()
        ```
      ],
    ),
  ),
)
