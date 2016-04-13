#
# Makefile -- Separation
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	partdiff-7.pdf

images = welle.jpg wellegrid.jpg

wellen_FILES = wellen-1.pdf wellen-2.pdf wellen-3.pdf wellen-4.pdf      \
	wellen-5.pdf wellen-6.pdf wellen-7.pdf wellen-8.pdf             \
	wellen-9.pdf wellen-10.pdf wellen-11.pdf wellen-12.pdf          \
	wellen-13.pdf wellen-14.pdf wellen-15.pdf wellen-16.pdf         \
	wellen-17.pdf wellen-18.pdf wellen-19.pdf wellen-20.pdf         \
	wellen-21.pdf wellen-22.pdf wellen-23.pdf
$(wellen_FILES):        wellen.mp
	TEX=latex mpost wellen.mp
	for f in wellen.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

wdom_FILES = wdom-1.pdf
$(wdom_FILES):  wdom.mp
	TEX=latex mpost wdom.mp
	for f in wdom.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

lichtkegel.jpg: lichtkegel.png
	convert -extract 2750x2160+610+0 lichtkegel.png \
		-units PixelsPerInch -density 300 \
		-scale 50% lichtkegel.jpg
lichtkegel.png: lichtkegel.pov lichtkegel.ini
	povray lichtkegel.ini


partdiff-7.pdf:	partdiff-7.tex $(wellen_FILES) $(wdom_FILES) lichtkegel.jpg $(images)
	pdflatex partdiff-7.tex
