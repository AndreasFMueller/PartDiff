#
# Makefile
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	jpg

png:	sol chr chrpl cauchy planes surface kugel streifen

timestamp:	jpg
	touch timestamp

jpg:	sol.jpg chr.jpg chrpl.jpg cauchy.jpg planes.jpg knick.jpg \
	streifen0.jpg streifen1.jpg streifen2.jpg \
	surface.jpg kugel.jpg

povrayoptions = -D +A0.1
w = 3960
h = 2160
#w = 320
#h = 180
#w = 640
#h = 360
dimensions = -W$(w) -H$(h)

planes:	planes-$(w)x$(h).png
planes-$(w)x$(h).png:	planes.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Oplanes-$(w)x$(h).png \
		planes.pov

planes.jpg: planes-3960x2160.png
	convert planes-3960x2160.png -scale 50% \
		-density 300 -units PixelsPerInch \
		planes.jpg

sol:	sol-$(w)x$(h).png
sol-$(w)x$(h).png:	sol.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Osol-$(w)x$(h).png \
		sol.pov

sol.jpg:	sol-3960x2160.png
	convert -extract 3960x1864+0+296 sol-3960x2160.png -scale 50% \
		-density 300 -units PixelsPerInch sol.jpg

chr:	chr-$(w)x$(h).png
chr-$(w)x$(h).png:	chr.pov cauchy.inc characteristics.inc
	povray $(povrayoptions) $(dimensions) -Ochr-$(w)x$(h).png \
		chr.pov

chr.jpg: chr-3960x2160.png
	convert chr-3960x2160.png -scale 50% \
		-density 300 -units PixelsPerInch \
		chr.jpg

chrpl:	chrpl-$(w)x$(h).png
chrpl-$(w)x$(h).png:	chrpl.pov cauchy.inc characteristics.inc
	povray $(povrayoptions) $(dimensions) -Ochrpl-$(w)x$(h).png \
		chrpl.pov

chrpl.jpg:	chrpl-3960x2160.png
	convert chrpl-3960x2160.png -scale 50% \
		-density 300 -units PixelsPerInch \
		chrpl.jpg

cauchy:	cauchy-$(w)x$(h).png
cauchy-$(w)x$(h).png:	cauchy.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Ocauchy-$(w)x$(h).png \
		cauchy.pov

cauchy.jpg:	cauchy-3960x2160.png
	convert -extract 3960x1864+0+296 cauchy-3960x2160.png \
		-scale 50% \
		-density 300 -units PixelsPerInch \
		cauchy.jpg

knick:	knick.jpg
knick.png:	knick.pov
	povray $(povrayoptions) $(dimensions) -Oknick.png knick.pov
knick.jpg:	knick.png
	convert -extract 2943x2028+480+60 knick.png -scale 50% \
		-density 300 -units PixelsPerInch \
		knick.jpg

streifen:	streifen0 streifen1 streifen2
	
streifen0:	streifen0.jpg
streifen0.jpg:	streifen0.png
	convert -extract 930x734+54+8 streifen0.png -density 300 -units PixelsPerInch streifen0.jpg
streifen0.png:	streifen0.pov
	povray $(povrayoptions) -W1024 -H768 -Ostreifen0.png \
		streifen0.pov

streifen1:	streifen1.jpg
streifen1.jpg:	streifen1.png 
	convert -extract 904x750+20+18 streifen1.png -density 300 -units PixelsPerInch streifen1.jpg
streifen1.png:	streifen1.pov
	povray $(povrayoptions) -W1024 -H768 -Ostreifen1.png \
		streifen1.pov

streifen2:	streifen2.jpg
streifen2.jpg:	streifen2.png
	convert -extract 1024x720+0+48 streifen2.png -density 300 -units PixelsPerInch streifen2.jpg
streifen2.png:	streifen2.pov
	povray $(povrayoptions) -W1024 -H768 -Ostreifen2.png \
		streifen2.pov

# Surface presentation
surface:	surface.jpg

surface.png:	surface.pov
	povray $(povrayoptions) -W3960 -H2160 -Osurface.png surface.pov

surface.jpg:	surface.png Makefile
	convert -extract 3350x1960+108+189 surface.png -scale 50% \
		-density 300 -units PixelsPerInch surface.jpg

# Kugel presentation
kugel:	kugel.jpg

kugel.png:	kugel.pov
	povray $(povrayoptions) -W3960 -H2160 -Okugel.png kugel.pov

kugel.jpg:	kugel.png Makefile
	convert -extract 2860x2180+392+0 kugel.png -scale 50% \
			-density 300 -units PixelsPerInch kugel.jpg


