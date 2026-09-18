#import "i18n-translation.typ": Translation, translation
#import "i18n-inputs.typ": enable-pagefind, link-pdf-docs

#let _icon = (
  // https://simpleicons.org/?q=git
  git-24: html.elem(
    "svg",
    attrs: (
      width: "24",
      height: "24",
      role: "graphics-symbol",
      viewBox: "0 0 24 24",
      xmlns: "http://www.w3.org/2000/svg",
      fill: "currentColor",
    ),
    {
      html.elem("title")[Git]
      html.elem("path", attrs: (
        d: "M13.09 23.549a1.54 1.54 0 0 1-2.18 0L.451 13.089a1.54 1.54 0 0 1 0-2.179l7.191-7.19 2.733 2.733a1.85 1.85 0 0 0 .964 2.326v6.66a1.849 1.849 0 1 0 1.54 0V8.957l2.508 2.508a1.85 1.85 0 1 0 1.09-1.09l-2.634-2.634a1.85 1.85 0 0 0-2.378-2.377L8.73 2.63 10.91.451a1.54 1.54 0 0 1 2.179 0l10.459 10.46a1.54 1.54 0 0 1 0 2.179z",
      ))
    },
  ),
  // https://tabler.io/icons?icon=world
  world-16: html.elem(
    "svg",
    attrs: (
      width: "16",
      height: "16",
      role: "graphics-symbol",
      viewBox: "0 0 24 24",
      xmlns: "http://www.w3.org/2000/svg",
      fill: "none",
      stroke: "currentColor",
    ),
    {
      html.elem("title")[World]
      html.elem("path", attrs: (stroke: "none", d: "M0 0h24v24H0z", fill: "none"))
      html.elem("path", attrs: (d: "M3 12a9 9 0 1 0 18 0a9 9 0 0 0 -18 0"))
      html.elem("path", attrs: (d: "M3.6 9h16.8"))
      html.elem("path", attrs: (d: "M3.6 15h16.8"))
      html.elem("path", attrs: (d: "M11.5 3a17 17 0 0 0 0 18"))
      html.elem("path", attrs: (d: "M12.5 3a17 17 0 0 1 0 18"))
    },
  ),
)

#let insertions = (
  header-after-hamburger: {
    // Copied from typst-docs-web, licensed under Apache-2.0.
    let SiteTitle = (
      html.div(class: "site-title", {
        html.span(style: "color: #239dad;")[*Typst*]
        Translation.document
        html.span(style: "font-size: 0.8em;", Translation.langVersion)
        html.span(class: "version-badge")[v#sys.version + dev #stdx.commit]
      }),
      ```css
      .site-title {
        display: flex;
        align-items: baseline;
        gap: 0.25rem;
        opacity: 0.8;

        .version-badge {
          font-size: 0.7em;
          padding-block: 0.125rem;
          padding-inline: 0.4rem;
          border-radius: 0.5rem;
          /* bg-gray-200 */
          background: oklch(92.8% .006 264.531);
        }
      }

      /* Overwrite docs.css */
      .dev-version-warning {
        display: none;
      }
      header.w695 {
        display: flex;
        align-items: center;
        gap: 0.5rem;
      }
      ```.text,
    )
    let SiteNoticeBanner = (
      html.aside(id: "site-notice", hidden: true, {
        html.p(strong(Translation.siteNoticeBannerTitle))
        html.div(class: "divider")
        html.div(Translation.siteNoticeBannerDescription)

        context {
          let prelude = ```js
          const banner = document.getElementById("site-notice");
          const storageKey = "typst-docs-8138 ({}): banner-hidden";
          ```
            .text
            .replace("{}", stdx.config.content-base)

          html.script({
            prelude
            ```js
            const isBannerHidden = localStorage.getItem(storageKey) === "true";
            if (isBannerHidden) {
              banner.style.display = "none";
            }
            ```.text
          })
          context html.elem(
            "button",
            attrs: (
              type: "button",
              onclick: prelude
                + ```js
                banner.style.display = "none";
                localStorage.setItem(storageKey, "true");
                ```.text,
            ),
            html.img(src: stdx.config.asset-base + "icons/16-close.svg", width: 16, height: 16, alt: translation.close),
          )
        }
      }),
      ```css
      #site-notice {
        position: fixed;
        top: 0;
        left: 0;
        z-index: 10;
        padding-block: 1em;
        padding-inline: 2em;
        background: white;
        /* shadow-md */
        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);

        display: grid;
        grid-template-columns: auto auto 1fr;
        align-items: center;
        gap: 1em;

        .divider {
          height: 3em;
          width: 1px;
          /* bg-neutral-200 */
          background: oklch(92.2% 0 0);
        }

        .divider + div {
          font-size: 0.8em;
          opacity: 0.8;
        }

        button {
          position: absolute;
          top: 0.5em;
          right: 1em;
          padding: 0.5em;
          background: none;
          border: none;

          &:hover,
          &:focus {
            /* bg-neutral-100 */
            background: oklch(97% 0 none);
          }
        }
      }
      @media screen and (max-width: 695px) {
        #site-notice {
          padding-block: 2em;
          grid-template-columns: 1fr;

          .divider {
            display: none;
          }

          button {
            top: 2.5em;
            right: 2em;
          }
        }
      }

      #site-notice {
        translate: 0 0;
        /* ease-out */
        animation: site-notice-down 0.5s cubic-bezier(0, 0, 0.2, 1) both;
      }
      @keyframes site-notice-down {
        from { translate: 0 -100%; }
        to { translate: 0 0; }
      }
      ```.text,
    )

    array.zip(SiteTitle, SiteNoticeBanner).map(v => v.join())
  },

  ..if enable-pagefind {
    (
      after-search-box: (
        // Align the native search box with pagefind-modal-trigger https://pagefind.app/docs/components/modal-trigger/
        html.span(class: "pf-trigger-shortcut", aria-hidden: true, style: "margin-left: -2em", {
          html.span(class: "pf-trigger-key")[S]
        }),
        ```css
        pagefind-modal-trigger button {
          padding-left: 0.5em !important; /* More important than pagefind's id selectors */
        }
        ```.text,
      ),
      before-nav-items: (
        // See https://pagefind.app/docs/search-ui/
        {
          let pagefind(tag, ..args) = html.elem("pagefind-" + tag, ..args)

          context pagefind("config", attrs: (bundle-path: stdx.config.content-base + "pagefind/", faceted: ""))

          pagefind("modal-trigger", attrs: (placeholder: translation.searchPagefindShort, style: "width: 100%"))
          pagefind("modal", {
            pagefind("modal-header", {
              pagefind("input", attrs: (placeholder: translation.searchPagefindLong))
            })
            pagefind("modal-body", {
              pagefind("summary")
              pagefind("results")
            })
            pagefind("modal-footer", {
              pagefind("keyboard-hints")
            })
          })
        },
        context {
          html.link(href: stdx.config.content-base + "pagefind/pagefind-component-ui.css", rel: "stylesheet")
          html.script(src: stdx.config.content-base + "pagefind/pagefind-component-ui.js", type: "module")
        },
      ),
    )
  },

  after-nav-items: (
    // Show only when the PDF is put properly by `just ci-build`
    context if link-pdf-docs {
      show: html.p.with(class: "after-nav-items")
      html.a(
        href: stdx.config.content-base + "typst-documentation.pdf",
        download: "typst-documentation.pdf",
        Translation.downloadPdfDocs,
      )
    },
    ```css
    .after-nav-items {
      /* Align with `<li>` in `nav-items` and search results. */
      padding-left: 8px;
      border-top: 1px solid #565565;
      margin-top: -16px;
      padding-top: 16px;
    }
    ```.text,
  ),

  ..{
    let body(class) = (route: "", keywords: ()) => {
      if "community-added" in keywords {
        return
      }
      html.elem("p", attrs: (class: ("link-official", class).join(" "), data-pagefind-ignore: ""), html.a(
        href: "https://typst.app/docs/" + route,
        target: "_blank",
        rel: "noopener",
        {
          _icon.world-16
          Translation.openOfficialDocs
        },
      ))
    }
    let css = ```css
    main .link-official {
      & > a {
        display: inline-flex;
        align-items: center;
        gap: 0.5em;

        font-size: 0.8em;
      }

      &.before-body {
        /* Compensate `<h1>` margin-top */
        margin-bottom: -1rem;

        & > a {
          /* text-gray-400 */
          color: oklch(70.7% .022 261.325);
          text-decoration: underline;

          &:hover,
          &:focus {
            /* text-gray-600 */
            color: oklch(44.6% .03 256.802);
          }
        }
      }

      &.after-body {
        /* Sync with `.page-end-buttons` */
        margin-top: 2rem;

        & > a {
          transition: 0.2s;
          padding: 0.5em 0.75em;
          /* border-gray-200 */
          border: 1px solid oklch(0.928 0.006 264.531);
          border-radius: 0.375rem;
          /* text-gray-800 */
          color: oklch(27.8% .033 256.848);
          text-decoration: none;

          &:hover,
          &:focus {
            /* border-gray-500 */
            border-color: oklch(55.1% .027 264.364);
            /* bg-gray-50 */
            background-color: oklch(98.5% .002 247.839);
            /* text-gray-900 */
            color: oklch(21% .034 264.665);
          }
        }
      }
    }
    ```.text
    (
      main-before-body: (body("before-body"), none),
      main-after-body: (body("after-body"), css),
    )
  },

  footer: (
    html.footer({
      // TODO: Replace this hard-coded URL
      html.a(href: "https://github.com/typst-doc-cn/docs-8138", target: "_blank", rel: "noopener", _icon.git-24)
      parbreak()
      Translation.footer
    }),
    ```css
    .main-grid + footer {
      width: 100%;
      padding-block: 2em;
      /* gray-200 */
      border-top: 1px solid oklch(92.8% .006 264.531);

      text-align: center;
      opacity: 0.8;

      a {
        color: unset;
      }
    }
    ```.text,
  ),
)

#let insertions = {
  let extra-head = ()
  let extra-css = ()
  for (key, (body, extra)) in insertions {
    if extra != none {
      if type(extra) == str {
        extra-css.push(extra)
      } else {
        extra-head.push(extra)
      }
    }

    ((key): body)
  }
  (extra-head: html.style(extra-css.join("\n")) + extra-head.join())
}
