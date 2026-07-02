PAPER_DIR := papers/001-hidden-metaphysics
PAPER_ID := 001-hidden-metaphysics
FIG_DIR := $(PAPER_DIR)/figures
FIG_SVGS := $(wildcard $(FIG_DIR)/*.svg)
FIG_PDFS := $(FIG_SVGS:.svg=.pdf)

OUT_DIR := dist
EN_PDF := $(OUT_DIR)/$(PAPER_ID)_en.pdf
JA_PDF := $(OUT_DIR)/$(PAPER_ID)_ja.pdf

LATEXMK := latexmk
LATEX_ENGINE := lualatex

.PHONY: all en ja figures clean distclean check-tools svg-converter-help

all: $(EN_PDF) $(JA_PDF)

en: $(EN_PDF)

ja: $(JA_PDF)

$(EN_PDF): figures $(PAPER_DIR)/en/main.tex $(PAPER_DIR)/shared/references.bib $(PAPER_DIR)/tables/table1_alignment_vs_chronicle.tex $(PAPER_DIR)/tables/table2_rde_uib_dimensions.tex
	cd $(PAPER_DIR)/en && $(LATEXMK) -$(LATEX_ENGINE) -interaction=nonstopmode -file-line-error main.tex
	mkdir -p $(OUT_DIR)
	cp $(PAPER_DIR)/en/main.pdf $@

$(JA_PDF): figures $(PAPER_DIR)/ja/main.tex $(PAPER_DIR)/shared/references.bib $(PAPER_DIR)/tables/table1_alignment_vs_chronicle.tex $(PAPER_DIR)/tables/table2_rde_uib_dimensions.tex
	cd $(PAPER_DIR)/ja && $(LATEXMK) -$(LATEX_ENGINE) -interaction=nonstopmode -file-line-error main.tex
	mkdir -p $(OUT_DIR)
	cp $(PAPER_DIR)/ja/main.pdf $@

figures: $(FIG_PDFS)

$(FIG_DIR)/%.pdf: $(FIG_DIR)/%.svg
	@if command -v inkscape >/dev/null 2>&1 && inkscape --version >/dev/null 2>&1; then \
		inkscape "$<" --export-type=pdf --export-filename="$@"; \
	elif command -v rsvg-convert >/dev/null 2>&1 && rsvg-convert --version >/dev/null 2>&1; then \
		rsvg-convert -f pdf -o "$@" "$<"; \
	elif command -v cairosvg >/dev/null 2>&1 && cairosvg --version >/dev/null 2>&1; then \
		cairosvg "$<" -o "$@"; \
	else \
		$(MAKE) svg-converter-help; \
		exit 1; \
	fi

check-tools:
	@command -v $(LATEXMK) >/dev/null 2>&1 || { echo "latexmk not found"; exit 1; }
	@command -v $(LATEX_ENGINE) >/dev/null 2>&1 || { echo "$(LATEX_ENGINE) not found"; exit 1; }
	@command -v biber >/dev/null 2>&1 || { echo "biber not found"; exit 1; }
	@if command -v inkscape >/dev/null 2>&1 && inkscape --version >/dev/null 2>&1; then \
		echo "SVG converter found: inkscape"; \
	elif command -v rsvg-convert >/dev/null 2>&1 && rsvg-convert --version >/dev/null 2>&1; then \
		echo "SVG converter found: rsvg-convert"; \
	elif command -v cairosvg >/dev/null 2>&1 && cairosvg --version >/dev/null 2>&1; then \
		echo "SVG converter found: cairosvg"; \
	else \
		$(MAKE) svg-converter-help; \
		exit 1; \
	fi

svg-converter-help:
	@echo "No working SVG-to-PDF converter found."
	@echo "Recommended on macOS:"
	@echo "  brew install librsvg"
	@echo "or:"
	@echo "  brew install --cask inkscape"
	@echo "If you want to keep using cairosvg in conda/miniforge, install cairo too:"
	@echo "  conda install -c conda-forge cairo cairosvg"
	@echo "Then rerun: make check-tools && make all"

clean:
	cd $(PAPER_DIR)/en && $(LATEXMK) -C main.tex || true
	cd $(PAPER_DIR)/ja && $(LATEXMK) -C main.tex || true
	rm -f $(FIG_PDFS)
	rm -f $(EN_PDF) $(JA_PDF)

distclean: clean
	rm -rf $(OUT_DIR)
	rm -f $(PAPER_DIR)/en/main.pdf $(PAPER_DIR)/ja/main.pdf
