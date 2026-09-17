#import "@typst/docs:0.0.0": docs

// `base` should only be used in deployment.
// In dev, `base != "/"` will cause `docit watch --open` to open the incorrect page.
#let base = "/"
#docs(content-base: base, asset-base: base + "assets/")

#import "i18n.typ"
#context if i18n.mode == "export-i18n" {
  i18n.asset-live()
  i18n.asset-static()
}
