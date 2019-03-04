#
# Makefile -- build image for 30000001
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	solution.jpg

solution.jpg:	solution.png
	convert -extract 1080x1510+0+178 solution.png \
		-density 300 -units PixelsPerInch solution.jpg
solution.png:	solution.pov
	povray -D +A0.1 -H1920 -W1080 -Osolution.png solution.pov
