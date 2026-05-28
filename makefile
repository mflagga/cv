.SUFFIXES:

LC = latexmk
CFLAGS = -pdf -interaction=nonstopmode -output-directory=$(BUILDDIR)
BUILDDIR = build
FIGDIR = img
TEXNAME = en
TEX = $(TEXNAME).tex
MEDIA = $(FIGDIR)/agh.png $(FIGDIR)/white.png $(FIGDIR)/zdj.png $(FIGDIR)/flag/de.png $(FIGDIR)/flag/gb.png $(FIGDIR)/flag/pl.png $(FIGDIR)/soft/acert.png $(FIGDIR)/soft/cpp.png $(FIGDIR)/soft/cuda.png $(FIGDIR)/soft/latex2.png $(FIGDIR)/soft/linux.png $(FIGDIR)/soft/matlab.png $(FIGDIR)/soft/py.png
CV = CV.pdf

all: $(CV)

$(CV): $(TEX) $(MEDIA)
	$(LC) $< $(CFLAGS) > /dev/null
	mv $(BUILDDIR)/$(TEXNAME).pdf $@

clean:
	rm -rf $(BUILDDIR)

.PHONY: all clean
