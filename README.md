# Chronicle Theory

This repository hosts source files for the Chronicle Theory research program.

The initial paper is:

**The Hidden Metaphysics of AI Alignment: A Deconstructive Inquiry into Value Fixation, Control, and the Chronicle Theory of Intelligence**

DOI: [10.5281/zenodo.21128136](https://doi.org/10.5281/zenodo.21128136)

Japanese title:

**AIアラインメントに隠された形而上学：価値固定・制御・Chronicle Theory of Intelligence への脱構築的考察**

## Series orientation

This repository treats Paper 001 as the gateway paper for the broader Chronicle Theory series. Its role is to expose the hidden metaphysics of value fixation in AI alignment and to open the Chronicle question.

A working boundary for the series is:

```text
Paper 1: Why the alignment question is insufficient.
Paper 2: What safety requires.
Paper 6: What intelligence is.
```

Paper 2 will develop interaction continuity as a reframing of AI safety. A later Chronicle Theory paper will formalize Chronicle Theory as a general account of intelligence.

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

The final PDFs are written to:

```text
dist/001-hidden-metaphysics_en.pdf
dist/001-hidden-metaphysics_ja.pdf
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

This paper argues that dominant AI alignment discourse often presupposes a hidden metaphysics of value fixation: living, historically contested, and evolving human values are compressed into operational targets for technical systems. The paper does not reject AI safety. It reframes the initial question from value compliance toward participation in value formation, context sovereignty, and interaction continuity.

Published on Zenodo: [10.5281/zenodo.21128136](https://doi.org/10.5281/zenodo.21128136)

## License

Unless otherwise stated, textual content is copyright © Tomoyuki Kano.

License terms for each paper should be checked before redistribution. Draft materials in this repository are not automatically released for unrestricted derivative use.
