# Chronicle Theory

This repository hosts source files for the Chronicle Theory research program.

The initial paper is:

**The Hidden Metaphysics of AI Alignment: A Deconstructive Inquiry into Value Fixation, Control, and the Chronicle Theory of Intelligence**

Japanese title:

**AIアラインメントに隠された形而上学：価値固定・制御・Chronicle Theory of Intelligence への脱構築的考察**

## Repository structure

```text
papers/
  001-hidden-metaphysics/
    en/
      main.tex
    ja/
      main.tex
    figures/
      fig1_hidden_metaphysical_transformation.svg
      fig2_state_alignment_limit_case.svg
      fig3_chronicle_theory_intelligence.svg
    tables/
      table1_alignment_vs_chronicle.tex
      table2_rde_uib_dimensions.tex
    shared/
      references.bib
```

## Build

Requirements:

- GNU Make
- TeX Live or a comparable LaTeX distribution
- `latexmk`
- `lualatex`
- `biber`
- One SVG converter: `inkscape`, `rsvg-convert`, or `cairosvg`

Build both English and Japanese PDFs:

```bash
make all
```

Build only the English paper:

```bash
make en
```

Build only the Japanese paper:

```bash
make ja
```

Clean generated files:

```bash
make clean
```

## Paper 001: Hidden Metaphysics of AI Alignment

This paper argues that dominant AI alignment discourse often presupposes a hidden metaphysics of value fixation: living, historically contested, and evolving human values are compressed into operational targets for technical systems. The paper does not reject AI safety. It reframes safety from compliance with fixed values toward interaction continuity, context sovereignty, resonant deviation evaluation, and uncertainty-oriented intelligence.

## License

Unless otherwise stated, textual content is copyright © Tomoyuki Kano.

License terms for each paper should be checked before redistribution. Draft materials in this repository are not automatically released for unrestricted derivative use.