#
# build script for partial differential equations in engineering
# technology
#
# (c) 2018 Prof Dr Andreas Mueller, Hochschule Rapperswil
# 
all:	lecturenotes

TEXFILES = lecturenotes.tex a-intro.tex 
#	beispiele.tex klassifikation.tex geometrie.tex \
#	separation.tex tsunami.tex transformation.tex \
#	pdgl2ord.tex \
#	elliptisch.tex parabolisch.tex hyperbolisch.tex \
#	nichtlinear.tex jacobi.tex anhangsinh.tex

lecturenotes: lecturenotes.pdf

lecturenotes.ind:	$(TEXFILES) 
	touch lecturenotes.ind
	pdflatex lecturenotes.tex
	makeindex lecturenotes.idx

lecturenotes.pdf:	$(TEXFILES) lecturenotes.ind 
	pdflatex lecturenotes.tex

clean:
	rm -f lecturenotes.aux lecturenotes.ind lecturenotes.log lecturenotes.toc
