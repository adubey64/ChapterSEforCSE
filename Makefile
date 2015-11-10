#FIGURES = Figures/*
TEXFILES = SEforCSE.tex
BIBFILES = *.bib
PDFLATEX ?= pdflatex

all: SEforCSE.pdf

SEforCSE.pdf: $(TEXFILES) SEforCSE.bbl $(FIGURES) 
	$(PDFLATEX) SEforCSE ; $(PDFLATEX) SEforCSE

SEforCSE.bbl: $(BIBFILES) $(TEXFILES)
	$(PDFLATEX) SEforCSE; \
	bibtex SEforCSE; \
	$(PDFLATEX) SEforCSE; \
	rm SEforCSE.pdf

clean:
	rm -f *.{aux,log,bbl,blg,log} 
spotless: clean
	rm -f SEforCSE.pdf

crappy:
	PDFLATEX="pdflatex --interaction nonstopmode" $(MAKE)
