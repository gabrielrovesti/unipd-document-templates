# UniPD Swiss Knife: Notes & Slides Templates
Repository containing templates for documents and presentations compliant with the style of the University of Padua (UniPD), suitable for notes, projects, theses, and academic presentations.

## Repository Structure
```
UniPD-Swiss-Knife-Notes-Slides/
├── Notes/                     # Templates for documents and notes
│   ├── LaTeX/                 # Full LaTeX template structure
│   ├── Typst/                 # Typst template with UniPD style
│   └── Word/                  # Word templates (simple and full)
└── Slides/                    # Templates for presentations
    ├── Beamer/                # Beamer (LaTeX) templates for slides
    ├── Powerpoint/             # PowerPoint templates with UniPD style
    └── Typst/                  # Touying (Typst) template with UniPD style
```

## Document Templates (Notes)

### LaTeX
- Full structure with chapters, appendices, and bibliography
- Main file: `report.tex` (main document)
- Support for indexes, figures, and bibliographic references

### Typst
- Modern template based on the work of Alberto Lazari
- Style compliant with UniPD using official colors
- Main files: `main.typ` and `unipd-doc.typ`

### Word
- Two variants:
  - `Simple (for real) File Template.docx`: minimalist version (the one I used in M. Sc.)
  - `UniPD File Template.docx`: complete version with predefined styles

## Presentation Templates (Slides)

### Beamer (LaTeX)
- Beamer template with UniPD theme
- Support for sections, blocks, and transitions
- Implements the university's official color palette

### PowerPoint
- Based on the Department of Mathematics template
- Master slides with various predefined layouts
- Colors and styles consistent with UniPD branding

### Typst
- Built on [Touying](https://typst.app/universe/package/touying), the actively maintained
  Typst slide framework (heading-based slides, native `#pause`/`#meanwhile` animations,
  PDF/PPTX/HTML export)
- Reuses the same color palette as `Notes/Typst/unipd-doc.typ` (rosso `#B41B21`, blu
  `#292754`, oro `#F8C30F`), so notes and slides stay visually consistent
- Main files: `main.typ` (worked example) and `unipd-slides.typ` (theme: title slide,
  section slide, focus slide, closing slide, styled code/table blocks)
- Corner "wave" decoration approximated with layered shapes in place of the official
  `background_wave.svg` asset, which isn't redistributed in this repo — same reasoning
  as the logo (see below)
- No official UniPD logo/crest bundled; pass `logo-path:` to `unipd-title-slide` if you
  have the asset locally, otherwise a decorative rule is shown in its place

## Prerequisites
- **LaTeX/Beamer**: TeX distribution (TeX Live, MiKTeX)
- **Typst (Notes)**: Typst compiler 0.8.0 or higher
- **Typst (Slides)**: Typst compiler 0.13 or higher, plus the `touying` package (`0.7.4`,
  fetched automatically from `@preview` on first compile with network access)
- **Word/PowerPoint**: Microsoft Office (2016 or later)

## License
This project is distributed under the MIT License. See the `LICENSE` file for details.
