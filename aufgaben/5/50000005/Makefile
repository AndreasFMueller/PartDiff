#
# Makefile -- build the surface representing the solution of the heat equation
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	waerme.jpg

waerme.jpg:	waerme.png
	convert -extract 3516x1728+111+330 waerme.png -resize 50% \
		-density 300 -units PixelsPerInch waerme.jpg

waerme.png:	waerme.pov
	povray -D +A0.1 -R20 -W3840 -H2160 waerme.pov
