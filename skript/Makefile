#
# build script for partial differential equations in engineering
# technology
#
# (c) 2010 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
# 
all:	skript checklist

formeln.pdf:	formeln.tex
	pdflatex formeln.tex

burgers:	burgers.c
	gcc -g -Wall -O -o burgers burgers.c

TEXFILES = skript.tex a-einleitung.tex \
	beispiele.tex klassifikation.tex geometrie.tex \
	separation.tex tsunami.tex transformation.tex \
	elliptisch.tex parabolisch.tex hyperbolisch.tex \
	nichtlinear.tex jacobi.tex anhangsinh.tex

skript: skript.pdf

skript.ind:	$(TEXFILES) images/timestamp 3d/timestamp
	cd images && make
	touch skript.ind
	pdflatex skript.tex
	makeindex skript.idx

skript.pdf:	$(TEXFILES) skript.ind 
	pdflatex skript.tex

images/timestamp:
	cd images; make timestamp

3d/timestamp:
	cd 3d; make timestamp

clean:
	rm -f skript.aux skript.ind skript.log skript.toc

checklist:	checklist.pdf

checklist.pdf:	checklist.tex
	pdflatex checklist.tex
