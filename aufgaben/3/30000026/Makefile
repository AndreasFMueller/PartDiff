#
# Makefile
#
# (c) 2022 Prof Dr Andreas Müller
#
all:	solution.pdf

solution.png:	solution.pov
	povray +A0.1 -W1920 -H1080 -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1920x1080+0+0 solution.png \
		-density 300 -units PixelsPerInch solution.jpg

solution.pdf:	solution.tex solution.jpg
	pdflatex solution.tex
