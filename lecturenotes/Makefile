#
# build script for partial differential equations in engineering
# technology
#
# (c) 2018 Prof Dr Andreas Mueller, Hochschule Rapperswil
# 
all:	lecturenotes

TEXFILES = lecturenotes.tex a-intro.tex 				\
	1-examples/examples.tex						\
	1-examples/waveequation.tex					\
	1-examples/poissonproblem.tex					\
	1-examples/heatequation.tex					\
	1-examples/supersonic.tex					\
	1-examples/beamequation.tex					\
	1-examples/plateequation.tex					\
	2-classification/classification.tex				\
	2-classification/domains.tex					\
	2-classification/equations.tex					\
	2-classification/types.tex					\
	2-classification/solutions.tex					\
	2-classification/notation.tex					\
	2-classification/conditions.tex

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
