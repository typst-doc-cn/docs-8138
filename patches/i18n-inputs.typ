#let _i18n-input(key, default: none) = {
  assert(default != none)
  sys.inputs.at("i18n--" + key, default: default)
}

// The docs loading mode.
//
// - import-l10n: load from locale/.
// - export-i18n: load from crates/ and export to i18n-export/.
//
// The export-i18n mode should be invoked via `just export-i18n`, because it requires additional setup.
#let mode = _i18n-input("mode", default: "import-l10n")
#assert(mode in ("export-i18n", "import-l10n"))

// The base path where the website will be hosted.
//
// This should only be used in deployment.
// In dev, `base != "/"` will cause `docit watch --open` to open an incorrect page.
//
// Note that this should only be used to call the `docs` function provided by `@typst/docs`.
// In most cases, `context stdx.config.content-base` or `stdx.config.asset-base` should be preferred.
#let base = _i18n-input("base", default: "/")
#assert(base.starts-with("/") and base.ends-with("/"))

// Whether to create a link to the PDF docs after other nav items on the website.
//
// This is disabled by default, because the link requires special build steps to work correctly.
// Use `just ci-build` to enable.
#let link-pdf-docs = json(bytes(_i18n-input("link-pdf-docs", default: "false")))
#assert.eq(type(link-pdf-docs), bool)

// Whether to enable pagefind search for the website.
//
// The original search does not work well after localization. Therefore, pagefind was introduced.
//
// This is disabled by default, because it does not work with `just serve` and requires additional setup.
// Use `just ci-build` to enable.
#let enable-pagefind = json(bytes(_i18n-input("enable-pagefind", default: "false")))
#assert.eq(type(enable-pagefind), bool)
