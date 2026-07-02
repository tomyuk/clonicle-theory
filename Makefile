PAPER_DIR := papers/001-hidden-metaphysics
FIG_DIR := $(PAPER_DIR)/figures
FIG_SVGS := $(wildcard $(FIG_DIR)/*.svg)
FIG_PDFS := $(FIG_SVGS:.svg=.pdf)

LATEXMK := latexmk
LATEX_ENGINE := lualatex

.PHONY: all en ja figures clean distclean check-tools

all: figures en ja

en: figures
	cd $(PAPER_DIR)/en && $(LATEXMK) -$(LATEX_ENGINE) -interaction=nonstopmode -file-line-error main.tex

ja: figures
	cd $(PAPER_DIR)/ja && $(LATEXMK) -$(LATEX_ENGINE) -interaction=nonstopmode -file-line-error main.tex

figures: $(FIG_PDFS)

$(FIG_DIR)/%.pdf: $(FIG_DIR)/%.svg
	@if command -v inkscape >/dev/null 2>&1; then \
		inkscape "$<" --export-type=pdf --export-filename="$@"; \
	elif command -v rsvg-convert >/dev/null 2>&1; then \
		rsvg-convert -f pdf -o "$@" "$<"; \
	elif command -v cairosvg >/dev/null 2>&1; then \
		cairosvg "$<" -o "$@"; \
	else \
		echo "No SVG converter found. Install inkscape, rsvg-convert, or cairosvg."; \
		exit 1; \
	fi

check-tools:
	@command -v $(LATEXMK) >/dev/null 2>&1 || { echo "latexmk not found"; exit 1; }
	@command -v $(LATEX_ENGINE) >/dev/null 2>&1 || { echo "$(LATEX_ENGINE) not found"; exit 1; }
	@command -v biber >/dev/null 2>&1 || { echo "biber not found"; exit 1; }
	@if command -v inkscape >/dev/null 2>&1 || command -v rsvg-convert >/dev/null 2>&1 || command -v cairosvg >/dev/null 2>&1; then \
		echo "SVG converter found"; \
	else \
		echo "No SVG converter found. Install inkscape, rsvg-convert, or cairosvg."; \
		exit 1; \
	fi

clean:
	cd $(PAPER_DIR)/en && $(LATEXMK) -C main.tex || true
	cd $(PAPER_DIR)/ja && $(LATEXMK) -C main.tex || true
	rm -f $(FIG_PDFS)

distclean: clean
	rm -f $(PAPER_DIR)/en/main.pdf $(PAPER_DIR)/ja/main.pdf
