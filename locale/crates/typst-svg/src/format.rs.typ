#import "/i18n-scope.typ": *
#let live-item-data = (
  "SvgFormat": (
    11,
    [
      #babel(
        en: [
          Typst's SVG export format.

          Instead of creating a PDF, Typst can also directly render pages to scalable
          vector graphics (SVGs), which are the preferred format for embedding vector
          graphics in web pages. Like PDF files, SVGs display your document exactly
          how you have laid it out in Typst. Likewise, they share the benefit of not
          being bound to a specific resolution. Hence, you can print or view SVG files
          on any device without incurring a loss of quality. (Note that font printing
          quality may be better with a PDF.) In contrast to a PDF, an SVG cannot
          contain multiple pages. When exporting a multi-page document, Typst will
          emit multiple SVGs.

          SVGs can represent text in two ways: By embedding the text itself and
          rendering it with the fonts available on the viewer's computer or by
          embedding the shapes of each glyph in the font used to create the document.
          To ensure that the SVG file looks the same across all devices it is viewed
          on, Typst chooses the latter method. This means that the text in the SVG
          cannot be extracted automatically, for example by copy/paste or a screen
          reader. If you need the text to be accessible, export a PDF or HTML file
          instead.

          SVGs can have transparent backgrounds. By default, Typst will output an SVG
          with an opaque white background. You can make the background transparent
          using `[#set page(fill: none)]`. Learn more on the @page.fill[`page`
            function's reference page].
        ],
        zh-status: "need proofread",
        zh: [
          Typst除了创建PDF，还可以将页面直接渲染为可缩放矢量图形（SVG），这是在网页中嵌入矢量图形的首选格式。与PDF文件一样，SVG会完全按照您在Typst中的排版显示文档；同样，它们也不受限于特定分辨率。因此，您可以在任何设备上打印或查看SVG文件，而不会损失质量。（请注意，用PDF打印时，字体的打印质量可能更好。）与PDF不同，SVG不能包含多个页面。导出多页文档时，Typst会生成多个SVG。

          SVG可以用两种方式表示文本：嵌入文本本身，并用查看者计算机上可用的字体渲染；或者嵌入创建文档所用字体中每个字形的形状。为确保SVG文件在所有查看设备上看起来都一样，Typst选择后一种方式。这意味着SVG中的文本无法自动提取，例如无法通过复制粘贴或屏幕阅读器提取。如果您需要让文本可供无障碍访问，请改为导出PDF或HTML文件。

          SVG可以有透明背景。默认情况下，Typst输出的SVG背景为不透明白色。您可以使用`[#set page(fill: none)]`让背景透明。更多内容请参阅@page.fill[`page`函数的参考页]。
        ],
      )

      = #babel(en: [Exporting as SVG], zh-status: "need proofread", zh: [导出为SVG]) <exporting-as-svg>
      == #babel(en: [Command Line], zh-status: "need proofread", zh: [命令行]) <command-line>
      #babel(
        en: [
          Pass `--format svg` to the `compile` or `watch` subcommand or provide an
          output file name that ends with `.svg`.

          If your document has more than one page, Typst will create multiple image
          files. The output file name must then be a template string containing at
          least one of
          - `[{p}]`, which will be replaced by the page number
          - `[{0p}]`, which will be replaced by the zero-padded page number (so that
            all numbers have the same length)
          - `[{t}]`, which will be replaced by the total number of pages

          When exporting to SVG, you have the following configuration options:

          - Which pages to export by specifying `--pages` followed by a
            comma-separated list of numbers or dash-separated number ranges. Ranges
            can be half-open. Example: `2,3,7-9,11-`.
        ],
        zh-status: "need proofread",
        zh: [
          为`compile`或`watch`子命令指定`--format svg`，或提供一个以`.svg`结尾的输出文件名。

          如果文档超过一页，Typst会创建多个图片文件。此时，输出文件名必须是模板字符串，其中至少包含以下一项：
          - `[{p}]`，会被替换为页码
          - `[{0p}]`，会被替换为补零的页码（使所有数字长度一致）
          - `[{t}]`，会被替换为总页数

          导出为SVG时，您有以下配置选项：

          - 要导出的页面：指定`--pages`，后跟以逗号分隔的数字或以连字符分隔的数字范围列表。范围可以半开。例如：`2,3,7-9,11-`。
        ],
      )

      == #babel(en: [Web App], zh-status: "need proofread", zh: [在线应用]) <web-app>
      #babel(
        en: [
          Click "File" > "Export as" > "SVG" or click the downwards-facing arrow next
          to the quick download button and select "Export as SVG". When exporting to
          SVG, you have the following configuration options:

          - Which pages to export. Valid options are "All pages", "Current page", and
            "Custom ranges". Custom ranges are a comma-separated list of numbers or
            dash-separated number ranges. Ranges can be half-open. Example:
            `2,3,7-9,11-`.
        ],
        zh-status: "need proofread",
        zh: [
          点击「文件」→「导出为」→「SVG」，或点击快速下载按钮旁边的向下箭头并选择「导出为SVG」。导出为SVG时，您有以下配置选项：

          - 要导出的页面。有效选项为「所有页面」、「当前页面」和「自定义范围」。自定义范围是以逗号分隔的数字或以连字符分隔的数字范围列表。范围可以半开。例如：`2,3,7-9,11-`。
        ],
      )
    ],
  ),
  "SvgFormat::pretty": (
    67,
    babel(
      en: [
        Whether to pretty-print the produced SVG file.

        This formats the output in a more human-readable, but less
        space-efficient way.
      ],
    ),
  ),
)
