#
# Makefile -- build the illustration for problem 40000022
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	solution.jpg

POVRAYOPTIONS = +A0.1 -W1920 -H1080

solution.png:	solution.pov
	povray $(POVRAYOPTIONS) -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1920x920+0+80 solution.png \
		-density 300 -units PixelsPerInch solution.jpg
