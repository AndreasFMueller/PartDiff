#
# Makefile -- build the surface representing the solution of the heat equation
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	dreieck waerme.jpg

dreieck_FILES = dreieck-1.pdf
dreieck:	$(dreieck_FILES)
$(dreieck_FILES):	dreieck.mp
	TEX=latex mpost dreieck.mp
	for f in dreieck.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

waerme.jpg:	waerme.png
	convert -extract 3516x1728+111+330 waerme.png -resize 50% \
		-density 300 -units PixelsPerInch waerme.jpg

waerme.png:	waerme.pov
	../../../povray -A0.1 -R20 -W3840 -H2160 waerme.pov
	#../../../povray -A0.1 -R20 -W384 -H216 waerme.pov
