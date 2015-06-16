#
# Makefile -- build images
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
w = 3960
h = 2160
#w = 1280
#h = 960
povrayoptions = -A0.1 -W$(w) -H$(h)

welle.png:	welle.pov Makefile
	povray $(povrayoptions) -Owelle.png welle.pov
