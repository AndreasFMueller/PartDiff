#
# Makefile -- build images for chapter 2
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	disk.pdf oblique.pdf domain.pdf wave.pdf mismatch.pdf \
	cauchy.pdf cauchycurve.pdf

disk.pdf:	disk.tex
	pdflatex disk.tex

oblique.pdf:	oblique.tex
	pdflatex oblique.tex

domain.pdf:	domain.tex
	pdflatex domain.tex

wave.pdf:	wave.tex
	pdflatex wave.tex

mismatch.pdf:	mismatch.tex
	pdflatex mismatch.tex

cauchy.png:	cauchy.pov scene.inc
	povray +A0.1 -W1920 -H1080 -Ocauchy.png cauchy.pov 
cauchy.jpg:	cauchy.png
	convert -extract 1400x1080+260+0 cauchy.png \
		-density 300 -units PixelsPerInch cauchy.jpg
cauchycurve.png:	cauchycurve.pov scene.inc
	povray +A0.1 -W1920 -H1080 -Ocauchycurve.png cauchycurve.pov 
cauchycurve.jpg:	cauchycurve.png
	convert -extract 1400x1080+260+0 cauchycurve.png \
		-density 300 -units PixelsPerInch cauchycurve.jpg

cauchy.pdf:	cauchy.tex cauchy.jpg
	pdflatex cauchy.tex
cauchycurve.pdf:	cauchycurve.tex cauchycurve.jpg
	pdflatex cauchycurve.tex
