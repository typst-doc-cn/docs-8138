set minimum-version := '1.55.0'
set shell := ["bash", "-uc"] # Some recipes requires brace expansion.

TYPST_REF := "094b9634d2aa506757d342103411a33a347e3012"

typstyle := "typstyle --line-width 120"

# List available recipes
@list:
    just --list

# Setup target/typst/docs/ and apply patches; after `git clone`, please run this recipe before running other recipes
[group("for contributors")]
setup:
    #!/usr/bin/env bash
    set -euxo pipefail

    mkdir -p target && cd target
    git clone --depth 1 --no-checkout --filter="tree:0" https://github.com/typst/typst

    cd typst
    git sparse-checkout init
    git sparse-checkout set docs
    git switch --detach {{ TYPST_REF }}

    cd docs
    git apply --ignore-whitespace ../../../patches/*.diff
    rm main.typ
    ln --symbolic \
        {{ quote(clean("../../../patches/main.typ")) }} \
        {{ quote(clean("../../../patches/i18n.typ")) }} \
        {{ quote(clean("../../../patches/i18n-babel.typ")) }} \
        {{ quote(clean("../../../patches/i18n-scope.typ")) }} \
        {{ quote(clean("../../../patches/i18n-translation.typ")) }} \
        {{ quote(clean("../../../locale")) }} \
        .

# Save patches from target/typst/docs/
[group("for maintainers")]
[working-directory("target/typst/")]
save-patches:
    git diff --no-ext-diff --abbrev=10 docs/assets/ > ../../patches/assets.diff
    git diff --no-ext-diff --abbrev=10 docs/components/ > ../../patches/components.diff
    git diff --no-ext-diff --abbrev=10 docs/content/index.typ > ../../patches/content-index.diff

# Set the mode for i18n; callers should keep import-l10n as the default mode
[arg("MODE", pattern='export-i18n|import-l10n')]
[private]
[working-directory("target/typst/")]
set-mode MODE:
    sd '#let mode = ".+"' '#let mode = "{{ MODE }}"' docs/i18n.typ
    git sparse-checkout set {{ if MODE == "export-i18n" { "docs crates" } else { "docs" } }}

# Call the typst-docs CLI
[private]
[working-directory("target/typst/")]
docit *ARGS:
    ../typst-docs {{ ARGS }}
# Export texts for internationalization to target/i18n-export/
[group("for maintainers")]
[working-directory("target/typst/")]
export-i18n: (set-mode "export-i18n") (docit "compile" "--format=website") (set-mode "import-l10n")
    rm -rf ../i18n-export/
    mv docs/dist/site/i18n-export/ ../

    cp -r docs/content/ ../i18n-export/
    rm -r ../i18n-export/content/{index.typ,changelog/}
    sd --max-replacements=1 \
        '#import "(\.\./)+components/index.typ"' \
        '#import "/i18n-scope.typ": babel\n#import "/components/index.typ"' \
        $(fd . --type file ../i18n-export/content/)

    {{ typstyle }} --inplace ../i18n-export/
    # ✅ Now you can compare target/i18n-export/ with locale/
# export-i18n requires `--format=website`, because it relies on `asset`, which does not work with `--format=pdf`.

# Start and open the server for website docs
[group("for contributors")]
serve: (docit "watch" "--format=website" "--open")

# Compile the docs as PDF and website to target/dist/
[group("for contributors")]
build: (docit "compile" "--format=pdf") (docit "compile" "--format=website")
    -rm -rf target/dist/
    mv target/typst/docs/dist/ target/
    # ✅ Now you can view or deploy target/dist/

# Build the project to target/dist/ for CI
[arg("BASE", pattern='/|(/.+/)')]
ci-build BASE="/base/":
    sd --fixed-strings '#let base = "/"' '#let base = "{{ BASE }}"' patches/main.typ
    just build
    mv target/dist/site{{ BASE }}* target/dist/
    mv target/dist/docs.pdf target/dist/typst-documentation.pdf

# Format files
fmt:
    {{ typstyle }} --inplace locale/ patches/
    just --fmt
