#
# Makefile -- build the illustration for problem 30000020
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	solution.jpg

POVRAYOPTIONS = +A0.1 -W1920 -H1080
#POVRAYOPTIONS = +A0.1 -W480 -H270

solution.png:	solution.pov
	povray $(POVRAYOPTIONS) -Osolution.png solution.pov

solution.jpg:	solution.png Makefile
	convert -extract 1920x630+0+98 solution.png \
		-density 300 -units PixelsPerInch solution.jpg
