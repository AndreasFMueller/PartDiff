#
# Makefile -- build images
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
w = 3960
h = 2160
#w = 1280
#h = 960
povrayoptions = -D +A0.1 -W$(w) -H$(h)

all:	welle.jpg

welle.png:	welle.pov
	povray $(povrayoptions) -Owelle.png welle.pov

welle.jpg:	welle.png
	convert -extract 3765x1557+156+306 welle.png -scale 50% \
		-density 300 -units PixelsPerInch welle.jpg

