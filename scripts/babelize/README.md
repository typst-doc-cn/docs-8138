# Babelize

This library provides a utility to wrap localizable texts in live docs (`crates/`) with the [`babel` function](../../patches/i18n-babel.typ). It assumes the input to be in markup mode, and the output will be in code mode.

It is intended to be used by `just export-i18n` as a [Wasm plugin for Typst](https://typst.app/docs/reference/foundations/plugin/).

## Usage

```sh
rustup target add wasm32-unknown-unknown
just setup-babelize
```

```sh
$ cat input.typ
= Example <example>
Lorem ipsum.

$ typst eval 'str(plugin("patches/babelize.wasm").babelize_bytes(read("input.typ", encoding: none)))' | jq '"#" + .' --raw-output | typstyle
#[
  = #babel(en: [Example]) <example>
  #babel(
    en: [
      Lorem ipsum.
    ],
  )
]
```
