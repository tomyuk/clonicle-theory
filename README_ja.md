# Chronicle Theory

このリポジトリは、Chronicle Theory 研究プログラムの論文ソースを管理するためのものです。

第1論文は以下です。

**The Hidden Metaphysics of AI Alignment: A Deconstructive Inquiry into Value Fixation, Control, and the Chronicle Theory of Intelligence**

日本語題：

**AIアラインメントに隠された形而上学：価値固定・制御・Chronicle Theory of Intelligence への脱構築的考察**

## ディレクトリ構成

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

## ビルド方法

必要なもの：

- GNU Make
- TeX Live などの LaTeX 環境
- `latexmk`
- `lualatex`
- `biber`
- SVG変換ツールのいずれか：`inkscape`, `rsvg-convert`, `cairosvg`

英日両方をビルド：

```bash
make all
```

英語版のみ：

```bash
make en
```

日本語版のみ：

```bash
make ja
```

生成物の削除：

```bash
make clean
```

## 第1論文について

本論文は、支配的なAIアラインメント言説が、人間の価値を固定可能な対象として扱う隠れた形而上学を含んでいることを論じます。人間の価値は、歴史的に形成され、社会的に争われ、相互作用を通じて更新されるものです。本論文はAI安全性を否定せず、むしろ安全性を、固定された価値への適合ではなく、相互作用の継続性、文脈主権、RDE、UIBの観点から再定位します。

## ライセンス

特に明記がない限り、本文の著作権は Tomoyuki Kano に帰属します。

各論文の再配布・翻案条件は、個別のライセンス表示を確認してください。このリポジトリ内の草稿は、自動的に無制限の二次利用を許可するものではありません。