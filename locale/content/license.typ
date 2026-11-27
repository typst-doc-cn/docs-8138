#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, short-or-long
#import "/i18n-translation.typ": Translation

#show: docs-chapter.with(
  title: babel(
    en: "License",
    zh-status: "proofread",
    zh: "版权许可",
  ),
  route: "/license",
  description: babel(
    en: "This documentation project is licensed under Apache 2.0.",
    zh-status: "proofread",
    zh: "本文档站采用Apache 2.0许可协议授权。",
  ),
  keywords: ("community-added",),
)

#babel(
  en: [
    This documentation project is licensed under Apache 2.0. The relevant source code can be obtained from the #link("https://github.com/typst/typst")[upstream Typst repository] and the #link("https://github.com/typst-doc-cn/docs-8138")[Chinese community's docs-8138 repository].
  ],
  zh-status: "proofread",
  zh: [
    本文档站采用Apache 2.0许可协议授权。相关源代码可从#link("https://github.com/typst/typst")[上游Typst仓库]与#link("https://github.com/typst-doc-cn/docs-8138")[中文社区docs-8138仓库]获取。
  ],
)


#let contributor-list(..github-logins) = {
  babel(
    en: [Contributors: ],
    zh-status: "proofread",
    zh: [贡献者：],
  )

  let name-map = (
    codeworm96: [Zhang Yuning],
    csimide: [Csimide],
    Dustella: [特菈 Dustella],
    Enter-tainer: [Wenzhuo Liu],
    IsshikiHugh: [Yan Xia],
    ItsukiKigoshi: [木越 斎], // aka. Itsuki "Cimetier" Kigoshi
    Myriad-Dreamin: [纸夜],
    OrangeX4: [方橙],
    Parsifa1: [汐], // aka. Aldric.li
    ptrdlr14: [Riddler], // aka. lywa1998
    relic-yuexi: [moontidef],
    Rsweater: [Seasoning],
    summerBreeze03: [summerBreeze630],
    tiankaima: [Tiankai Ma],
    YDX-2147483647: [Y.D.X.],
    // Others use their GitHub logins as names.
  )

  assert.eq(github-logins.named(), (:))
  github-logins
    .pos()
    .map(login => link("https://github.com/" + login, name-map.at(login, default: login)))
    .join(babel(en: [, ], zh-status: "proofread", zh: [、]))
  babel(en: [.], zh-status: "proofread", zh: [。])
}

= #babel(
  en: short-or-long[Notes][Supplementary notes on translation],
  zh-status: "proofread",
  zh: short-or-long[补充说明][关于翻译的补充说明],
) <notes>


#babel(
  en: [This project has imported some translations from the following projects. (sorted by the order of import start date, with earlier imports listed first)],
  zh-status: "proofread",
  zh: [本站导入了以下项目的部分翻译。（按开始导入的顺序排列，先导入的在前）],
)

+ #babel(
    en: [#link("https://github.com/typst-doc-cn/typst-doc-cn.github.io/tree/6eb732587f4faf35291973cac798ef52ff81565d")[Old translations by the Chinese community] — a fork of the Typst repository],
    zh-status: "proofread",
    zh: [#link("https://github.com/typst-doc-cn/typst-doc-cn.github.io/tree/6eb732587f4faf35291973cac798ef52ff81565d")[中文社区的旧版翻译]——Typst仓库的fork],
  )

  #babel(
    en: [This was the Chinese translation project from 2023-06 to 2025-03.],
    zh-status: "proofread",
    zh: [此项目是中文社区2023-06至2025-03的翻译。],
  )

  #contributor-list(..for logins in (
    // Maintainer:
    "OrangeX4",
    // At least three commits:
    "ptrdlr14, FuGangqiang, Parsifa1, chillcicada, csimide, summerBreeze03",
    // Two commits:
    "tiankaima, Enter-tainer",
    // Single commit:
    "Rsweater, wagaaa, codeworm96, IsshikiHugh, Dustella, relic-yuexi",
  ) {
    logins.split(", ")
  })

+ #babel(
    en: [#link("https://github.com/typst-community/typst-docs-web/tree/f462bf542d400dd706118d28ede47f49c32473f8")[typst-docs-web] — licensed under Apache 2.0],
    zh-status: "proofread",
    zh: [#link("https://github.com/typst-community/typst-docs-web/tree/f462bf542d400dd706118d28ede47f49c32473f8")[typst-docs-web]——按Apache 2.0授权],
  )

  #babel(
    en: [This was a folder in #link("https://github.com/typst-jp/docs")[Japanese community's translation project] before 2025-09.],
    zh-status: "proofread",
    zh: [此项目在2025-09之前是#link("https://github.com/typst-jp/docs")[日文社区翻译项目]中的一个文件夹。],
  )

  #contributor-list("3w36zj6", "YDX-2147483647", "ItsukiKigoshi")
  #babel(
    en: [ (may be incomplete)],
    zh-status: "proofread",
    zh: [（可能不全）],
  )

+ #babel(
    en: [#link("https://github.com/typst-doc-cn/docs/blob/b46b645975a2d9a1c31806f12fbffd992c8c7b64/locales/docs/")[typst-docs-l10n] — licensed under Apache 2.0],
    zh-status: "proofread",
    zh: [#link("https://github.com/typst-doc-cn/docs/blob/b46b645975a2d9a1c31806f12fbffd992c8c7b64/locales/docs/")[typst-docs-l10n]——按Apache 2.0授权],
  )

  #babel(
    en: [This was the Chinese translation project from 2025-07 to 2026-03.],
    zh-status: "proofread",
    zh: [此项目是中文社区2025-07至2026-03的翻译。],
  )

  #contributor-list("Myriad-Dreamin")
