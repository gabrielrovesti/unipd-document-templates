// UniPD Slide Theme for Touying
// Built on top of touying's `simple` theme, restyled with the official
// UniPD palette used across this repo's Notes/Typst template
// (Notes/Typst/unipd-doc.typ), so Notes and Slides stay visually consistent.
//
// Requires: touying >= 0.7.4  (https://typst.app/universe/package/touying)

#import "@preview/touying:0.7.4": *
#import themes.simple: simple-theme, focus-slide as simple-focus-slide

// ---------------------------------------------------------------------
// Palette (kept in sync with Notes/Typst/unipd-doc.typ)
// ---------------------------------------------------------------------
#let unipd-colors = (
  primary: rgb("#B41B21"), // Rosso UniPD
  secondary: rgb("#292754"), // Blu scuro UniPD
  accent: rgb("#F8C30F"), // Giallo/oro
  text: rgb("#333333"),
  text-light: rgb("#5A5A5A"),
  light-bg: rgb("#F1F1F1"),
  border: rgb("#DCDCDC"),
  white: rgb("#FFFFFF"),
)

// ---------------------------------------------------------------------
// Decorative helpers
// ---------------------------------------------------------------------

// Thin accent rule, used under titles/headers.
#let unipd-rule(width: 100%, color: unipd-colors.accent, thickness: 2pt) = {
  box(width: width, line(start: (0pt, 0pt), end: (width, 0pt), stroke: thickness + color))
}

// Corner "wave" made of three overlapping translucent bars, standing in for
// the official background_wave.svg asset (not redistributed in this repo).
// Purely decorative; safe to remove or replace with the real UniPD asset.
#let unipd-wave(fill: unipd-colors.primary) = {
  place(bottom + right, dx: 0pt, dy: 0pt, {
    box(width: 100%, height: 100%, {
      place(bottom + right, dx: 2cm, dy: 1.6cm, rotate(-8deg, rect(width: 14cm, height: 2.2cm, fill: fill.lighten(75%), stroke: none)))
      place(bottom + right, dx: 1.2cm, dy: 0.8cm, rotate(-8deg, rect(width: 14cm, height: 2.2cm, fill: fill.lighten(55%), stroke: none)))
      place(bottom + right, dx: 0.4cm, dy: 0cm, rotate(-8deg, rect(width: 14cm, height: 2.2cm, fill: fill, stroke: none)))
    })
  })
}

// ---------------------------------------------------------------------
// Slide variants
// ---------------------------------------------------------------------

// Title slide: institution header, rule-framed logo slot, title/subtitle,
// author block, decorative wave in the bottom-right corner.
#let unipd-title-slide(
  config: (:),
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  institution: "Università degli Studi di Padova",
  department: none,
  logo-path: none,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-common(freeze-slide-counter: true))
  touying-slide(
    self: self,
    config: config,
    {
      set align(center + horizon)
      unipd-wave()

      block(width: 90%, {
        text(size: 0.55em, fill: unipd-colors.secondary, style: "italic", institution)
        if department != none {
          v(0.3em)
          text(size: 0.45em, fill: unipd-colors.text-light, department)
        }

        v(1.2em)

        if logo-path != none {
          box(width: 30%, image(logo-path, width: 100%))
          v(1em)
        } else {
          box(width: 60%, unipd-rule(color: unipd-colors.primary.lighten(40%)))
          v(1em)
        }

        text(size: 1.5em, weight: "bold", fill: unipd-colors.primary, smallcaps(title))

        if subtitle != none {
          v(0.5em)
          text(size: 0.9em, fill: unipd-colors.secondary, subtitle)
        }

        v(2em)

        if authors != none {
          text(size: 0.7em, fill: unipd-colors.text, authors)
        }
        if date != none {
          v(0.4em)
          text(size: 0.6em, fill: unipd-colors.text-light, date)
        }

        v(1.5em)
        box(width: 40%, unipd-rule(color: unipd-colors.primary.lighten(50%), thickness: 1pt))
      })
    },
  )
})

// Section slide: full-bleed dark-blue background, gold rule, white text.
// Wired up automatically via `new-section-slide-fn` in `unipd-theme`.
#let unipd-section-slide(config: (:), body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(fill: unipd-colors.secondary))
  touying-slide(
    self: self,
    config: config,
    align(center + horizon, {
      set text(fill: unipd-colors.white)
      box(width: 30%, unipd-rule(color: unipd-colors.accent, thickness: 1.5pt))
      v(0.8em)
      text(size: 1.3em, weight: "bold", utils.display-current-heading(level: 1))
      v(0.5em)
      box(width: 30%, unipd-rule(color: unipd-colors.accent, thickness: 1.5pt))
      body
    }),
  )
})

// Focus slide (e.g. "Domande?"): red background, reuses simple-theme's
// mechanics but defaults to the UniPD primary color.
#let unipd-focus-slide(config: (:), background: unipd-colors.primary, foreground: unipd-colors.white, body) = simple-focus-slide(
  config: config,
  background: background,
  foreground: foreground,
  body,
)

// Closing slide: mirrors the title slide layout for a consistent bookend.
#let unipd-closing-slide(
  config: (:),
  title: "Grazie per l'attenzione",
  contact: none,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-common(freeze-slide-counter: true))
  touying-slide(
    self: self,
    config: config,
    align(center + horizon, {
      unipd-wave()
      text(size: 1.3em, weight: "bold", fill: unipd-colors.primary, smallcaps(title))
      if contact != none {
        v(1em)
        text(size: 0.7em, fill: unipd-colors.text-light, contact)
      }
    }),
  )
})

// ---------------------------------------------------------------------
// Theme entry point
// ---------------------------------------------------------------------

// - aspect-ratio: "16-9" or "4-3"
// - institution / department: shown in the header of every content slide
// - lang: "it" or "en", only affects the default footer separator
#let unipd-theme(
  aspect-ratio: "16-9",
  institution: "Università degli Studi di Padova",
  department: none,
  lang: "it",
  ..args,
  body,
) = {
  show: simple-theme.with(
    aspect-ratio: aspect-ratio,
    config-colors(
      primary: unipd-colors.primary,
      secondary: unipd-colors.secondary,
      accent: unipd-colors.accent,
      neutral-light: unipd-colors.text-light,
      neutral-lightest: unipd-colors.white,
      neutral-darkest: unipd-colors.text,
    ),
    config-common(new-section-slide-fn: unipd-section-slide),
    header: self => text(
      fill: unipd-colors.primary,
      weight: "medium",
      utils.display-current-heading(setting: utils.fit-to-width.with(grow: false, 100%), level: 1, depth: self.slide-level),
    ),
    header-right: self => text(size: 0.6em, fill: unipd-colors.text-light, style: "italic", institution),
    footer: text(size: 0.55em, fill: unipd-colors.text-light, style: "italic", institution),
    footer-right: context text(
      fill: unipd-colors.text-light,
      utils.slide-counter.display() + " / " + utils.last-slide-number,
    ),
    ..args,
  )
  set text(font: "New Computer Modern", size: 22pt, lang: lang)
  set par(justify: true)
  show heading.where(level: 1): set text(fill: unipd-colors.primary)
  show heading.where(level: 2): set text(fill: unipd-colors.secondary)

  // Restyle raw/code blocks to match Notes/Typst/unipd-doc.typ.
  show raw.where(block: true): it => block(
    width: 100%,
    fill: unipd-colors.light-bg.lighten(40%),
    radius: 4pt,
    inset: 0.9em,
    stroke: (top: 1.5pt + unipd-colors.primary.lighten(30%), rest: 0.5pt + unipd-colors.border),
    text(font: "Fira Code", size: 0.65em, fill: unipd-colors.text, it),
  )
  show raw.where(block: false): it => box(
    fill: unipd-colors.light-bg.lighten(40%),
    inset: (x: 3pt, y: 0pt),
    radius: 2pt,
    text(font: "Fira Code", size: 0.85em, it),
  )

  body
}
