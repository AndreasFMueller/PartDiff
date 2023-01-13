#
# Makefile
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
all:	graph.pdf solution.jpg

graph.pdf:	graph.tex
	pdflatex graph.tex

solution.png:	solution.pov common.inc
	povray +A0.1 -W1080 -H1920 -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1080x1920 solution.png \
                -density 300 -units PixelsPerInch solution.jpg

solution.pdf:	solution.tex solution.jpg
	pdflatex solution.tex

