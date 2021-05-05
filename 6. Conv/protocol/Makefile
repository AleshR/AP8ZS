# Author: Emiliano Carlos de Moraes Firmino @ 10/2012
SHELL=/bin/sh
THESIS=main

.SUFFIXES:
.SUFFIXES: .pdf .tex
.PHONY: clean

run: $(THESIS).pdf

$(THESIS).pdf: $(THESIS).tex
	pdflatex $(THESIS).tex -draftmode
	pdflatex $(THESIS).tex 

clean:
	rm -rf *.aux *.lof *.log *.lot *.toc *.bbl *.blg
