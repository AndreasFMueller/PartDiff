#
# Makefile -- build supporting image for 40000021
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
siren.pdf:	siren.tex siren.jpg
	pdflatex siren.tex

siren.png:	siren.pov
	povray +A0.1 -W1920 -H1080 -Osiren.png siren.pov

siren.jpg:	siren.png Makefile
	convert -extract 228x957+778+62 siren.png \
		-density 300 -units PixelsPerInch siren.jpg
