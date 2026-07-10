# UniPD Slides — Typst (Touying)

Slide theme for [Touying](https://typst.app/universe/package/touying) restyled with the
UniPD palette used in `Notes/Typst/unipd-doc.typ` (rosso `#B41B21`, blu `#292754`, oro
`#F8C30F`), so notes and slides stay visually consistent.

Touying was chosen over Polylux because it's the actively maintained slide package for
Typst (2.2k★, releases through mid-2026) and gives heading-based slide authoring, native
`#pause`/`#meanwhile` animations, and PDF/PPTX/HTML export.

## Files

- `unipd-slides.typ` — the theme itself (`unipd-theme`, plus `unipd-title-slide`,
  `unipd-section-slide`, `unipd-focus-slide`, `unipd-closing-slide`).
- `main.typ` — worked example: title slide, outline, two-column layout, code block,
  table, incremental reveals, focus slide, closing slide.
- `images/` — drop `unipd-logo.png` here if you want the crest on the title slide
  (see "Logo" below). Empty by default: the official UniPD logo isn't redistributed
  in this repo.

## Requirements

- Typst compiler ≥ 0.13 (tested against 0.15.0).
- `touying` `0.7.4` (pulled automatically from `@preview` on first compile with
  network access).

## Usage

```bash
typst compile main.typ presentation.pdf
# or, for live preview:
typst watch main.typ presentation.pdf
```

Minimal skeleton for a new deck:

```typst
#import "@preview/touying:0.7.4": *
#import "unipd-slides.typ": *

#show: unipd-theme.with(
  aspect-ratio: "16-9",           // or "4-3"
  institution: "Università degli Studi di Padova",
  department: "Il tuo dipartimento",
  lang: "it",                     // or "en"
)

#unipd-title-slide(
  title: [Titolo],
  subtitle: [Sottotitolo],
  authors: [Nome Cognome],
  date: [10 luglio 2026],
)

= Sezione 1
== Prima slide
Contenuto...
```

Headings (`=`, `==`) drive slide/section structure exactly as in a normal Touying deck —
see `main.typ` for two-column layouts (`#slide(composer: (1fr, 1fr))[...][...]`),
`#pause`/`#uncover` reveals, code blocks, and tables.

## Logo

`unipd-title-slide` and `unipd-closing-slide` accept `logo-path:`. If omitted (the
default), a decorative rule is shown instead of the crest so the template works
out of the box without any binary assets. To use the real logo, drop
`unipd-logo.png` in `images/` and pass `logo-path: "images/unipd-logo.png"`.

## Notes

- The corner "wave" on the title/closing slides is drawn with layered rotated
  rectangles, standing in for the official `background_wave.svg` used in the
  Beamer/Word templates (not bundled here for the same reason as the logo).
- `unipd-slides.typ` sets `font: "New Computer Modern"` for body text and
  `"Fira Code"` for code blocks; both are optional — Typst falls back silently
  if a font isn't installed, only whichever renderer you use needs it available
  to actually show it.
