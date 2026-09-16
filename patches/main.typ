#import "@typst/docs:0.0.0": docs
#docs()

#import "i18n.typ"
#context if i18n.mode == "export-i18n" {
  i18n.asset-live()
  i18n.asset-static()
}
