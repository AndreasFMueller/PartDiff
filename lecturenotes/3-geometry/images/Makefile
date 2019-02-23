#
# Makefile -- build images for chapter 3
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	circular.pdf rays.pdf directionfield.pdf \
	normal.png surface.png

directionfield.pdf:	directionfield.tex
	pdflatex directionfield.tex

circular.pdf:	circular.tex
	pdflatex circular.tex

rays.pdf:	rays.tex
	pdflatex rays.tex

POVRAYOPTIONS = -W1920 -H1080
#POVRAYOPTIONS = -W480 -H270

normal.png:	normal.pov common.inc parameters.inc
	povray +A0.1 $(POVRAYOPTIONS) -Onormal.png normal.pov

surface.png:	surface.pov common.inc parameters.inc
	povray +A0.1 $(POVRAYOPTIONS) -Osurface.png surface.pov
