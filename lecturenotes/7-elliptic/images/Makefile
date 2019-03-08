#
# Makefile -- build images for chapter 7
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	green.pdf meanvalue.pdf

green.pdf:	green.tex
	pdflatex green.tex

meanvalue.png:	meanvalue.pov	
	povray +A0.1 +W1920 -H1080 -Omeanvalue.png meanvalue.pov

meanvalue.jpg:	meanvalue.png
	convert -extract 1720x1080+50+0 meanvalue.png \
		-density 300 -units PixelsPerInch meanvalue.jpg

meanvalue.pdf:	meanvalue.tex meanvalue.jpg
	pdflatex meanvalue.tex
