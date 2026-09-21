.SUFFIXES:

LC = latexmk
CFLAGS = -pdf -interaction=nonstopmode -output-directory=$(BUILDDIR)
BUILDDIR = build
FIGDIR = img
LANGS = en pl
STY = cv.sty
MEDIA = $(wildcard $(FIGDIR)/*.png $(FIGDIR)/*/*.png $(FIGDIR)/*/*.jpg $(FIGDIR)/*/*.jpeg $(FIGDIR)/*/*.pdf)
CVS = $(LANGS:%=CV_%.pdf)

all: $(CVS)

CV_%.pdf: %.tex $(STY) $(MEDIA)
	$(LC) $< $(CFLAGS) > /dev/null
	mv $(BUILDDIR)/$*.pdf $@

clean:
	rm -rf $(BUILDDIR)

force:
	for l in $(LANGS); do \
		$(LC) $$l.tex $(CFLAGS) -f > /dev/null && mv $(BUILDDIR)/$$l.pdf CV_$$l.pdf || exit 1; \
	done

.PHONY: all clean force
