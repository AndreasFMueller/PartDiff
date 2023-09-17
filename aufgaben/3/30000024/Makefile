#
# Makefile
#
# (c) 2021 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
#
all:	domain.pdf solution.jpg

domain.pdf:	domain.tex
	pdflatex domain.tex

solution.png:	solution.pov common.inc
	povray +A0.1 -W1920 -H1080 -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1020x1040+590+30 solution.png \
                -density 300 -units PixelsPerInch solution.jpg

solution.pdf:	solution.tex solution.jpg
	pdflatex solution.tex

