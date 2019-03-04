#
# Makefile -- Kurvenschar
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

all:	partdiff-handout-2.pdf partdiff-presentation-2.pdf

CONTENT = common.tex slides.tex surface.jpg kurven-1.pdf

partdiff-handout-2.pdf:	partdiff-handout-2.tex $(CONTENT)
	pdflatex partdiff-handout-2.tex

partdiff-presentation-2.pdf:	partdiff-presentation-2.tex $(CONTENT)
	pdflatex partdiff-presentation-2.tex

kurven-1.pdf:	kurven.mp
	TEX=latex mpost kurven.mp
	mptopdf kurven.1

w = 3960
h = 2160
#w = 1280
#h = 960

povrayoptions = -D +A0.1 -W$(w) -H$(h)

surface.png:	surface.pov
	povray $(povrayoptions) -Osurface.png surface.pov

surface.jpg:	surface.png Makefile
	convert -extract 3350x1960+108+189 surface.png -scale 50% \
		-density 300 -units PixelsPerInch surface.jpg


