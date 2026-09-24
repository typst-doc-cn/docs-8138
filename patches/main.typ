#import "@typst/docs:0.0.0": docs
#import "i18n-insertions.typ": insertions
#import "i18n-inputs.typ": base, mode

#docs(content-base: base, asset-base: base + "assets/", insertions: insertions)

#import "i18n.typ"
#context if mode == "export-i18n" {
  i18n.asset-live()
  i18n.asset-static()
}
