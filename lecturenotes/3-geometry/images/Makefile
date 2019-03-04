#
# Makefile -- build images for chapter 3
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
all:	circular.pdf rays.pdf directionfield.pdf \
	cone.jpg \
	normal.jpg surface.jpg slopes.jpg normalcomp.jpg \
	plane30.jpg plane110.jpg planes.jpg \
	coneplanes.jpg \
	planefield.jpg \
	nondifferentiable.pdf underdetermined.pdf overdetermined.pdf

directionfield.pdf:	directionfield.tex
	pdflatex directionfield.tex

circular.pdf:	circular.tex
	pdflatex circular.tex

rays.pdf:	rays.tex
	pdflatex rays.tex

POVRAYOPTIONS = -D +A0.1 -W1920 -H1080
#POVRAYOPTIONS = -W480 -H270

normal.png:	normal.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Onormal.png normal.pov
normal.jpg:	normal.png
	convert normal.png -density 300 -units PixelsPerInch normal.jpg

surface.png:	surface.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Osurface.png surface.pov
surface.jpg:	surface.png
	convert surface.png -density 300 -units PixelsPerInch surface.jpg

slopes.png:	slopes.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Oslopes.png slopes.pov
slopes.jpg:	slopes.png
	convert slopes.png -density 300 -units PixelsPerInch slopes.jpg

normalcomp.png:	normalcomp.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Onormalcomp.png normalcomp.pov
normalcomp.jpg:	normalcomp.png
	convert normalcomp.png -density 300 -units PixelsPerInch normalcomp.jpg

cone.png:	cone.pov cone.inc	
	povray $(POVRAYOPTIONS) -Ocone.png cone.pov
cone.jpg:	cone.png
	convert cone.png -density 300 -units PixelsPerInch cone.jpg

plane30.png:	plane30.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Oplane30.png plane30.pov
plane30.jpg:	plane30.png
	convert plane30.png -density 300 -units PixelsPerInch plane30.jpg

plane110.png:	plane110.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Oplane110.png plane110.pov
plane110.jpg:	plane110.png
	convert plane110.png -density 300 -units PixelsPerInch plane110.jpg

planes.png:	planes.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Oplanes.png planes.pov
planes.jpg:	planes.png
	convert planes.png -density 300 -units PixelsPerInch planes.jpg

coneplanes.png:	coneplanes.pov common.inc parameters.inc
	povray $(POVRAYOPTIONS) -Oconeplanes.png coneplanes.pov
coneplanes.jpg:	coneplanes.png
	convert coneplanes.png -density 300 -units PixelsPerInch coneplanes.jpg

planefield.png:	planefield.pov
	povray $(POVRAYOPTIONS) -Oplanefield.png planefield.pov
planefield.jpg:	planefield.png
	convert planefield.png -density 300 -units PixelsPerInch planefield.jpg

conemovie.timestamp:	conemovie.pov cone.inc
	rm -rf conemovie
	mkdir conemovie
	povray $(POVRAYOPTIONS) -Oconemovie/p conemovie.ini
	touch conemovie.timestamp

underdetermined.pdf:	underdetermined.tex
	pdflatex underdetermined.tex

overdetermined.pdf:	overdetermined.tex
	pdflatex overdetermined.tex

nondifferentiable.pdf:	nondifferentiable.tex
	pdflatex nondifferentiable.tex






