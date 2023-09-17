#
# Makefile
#
# (c) 2022 Prof Dr Andreas Müller
#
all:	solution.pdf

solution.png:	solution.pov
	povray +A0.1 -W3840 -H2160 -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1710x2020+510+20 solution.png \
		-density 300 -units PixelsPerInch solution.jpg

solution.pdf:	solution.tex solution.jpg
	pdflatex solution.tex
