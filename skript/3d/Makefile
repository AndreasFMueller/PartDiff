#
# Makefile
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	sol chr chrpl cauchy planes

jpg:	sol.jpg chr.jpg chrpl.jpg cauchy.jpg planes.jpg

povrayoptions = -A0.1
w = 3960
h = 2160
#w = 320
#h = 180
#w = 640
#h = 360
dimensions = -W$(w) -H$(h)

planes:	planes-$(w)x$(h).png
planes-$(w)x$(h).png:	planes.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Oplanes-$(w)x$(h).png planes.pov

planes.jpg: planes-3960x2160.png
	convert planes-3960x2160.png -scale 50% planes.jpg

sol:	sol-$(w)x$(h).png
sol-$(w)x$(h).png:	sol.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Osol-$(w)x$(h).png sol.pov

sol.jpg:	sol-3960x2160.png
	convert -extract 3960x1864+0+296 sol-3960x2160.png -scale 50% sol.jpg

chr:	chr-$(w)x$(h).png
chr-$(w)x$(h).png:	chr.pov cauchy.inc characteristics.inc
	povray $(povrayoptions) $(dimensions) -Ochr-$(w)x$(h).png chr.pov

chr.jpg: chr-3960x2160.png
	convert chr-3960x2160.png -scale 50% chr.jpg

chrpl:	chrpl-$(w)x$(h).png
chrpl-$(w)x$(h).png:	chrpl.pov cauchy.inc characteristics.inc
	povray $(povrayoptions) $(dimensions) -Ochrpl-$(w)x$(h).png chrpl.pov

chrpl.jpg:	chrpl-3960x2160.png
	convert chrpl-3960x2160.png -scale 50% chrpl.jpg

cauchy:	cauchy-$(w)x$(h).png
cauchy-$(w)x$(h).png:	cauchy.pov cauchy.inc
	povray $(povrayoptions) $(dimensions) -Ocauchy-$(w)x$(h).png cauchy.pov

cauchy.jpg:	cauchy-3960x2160.png
	convert -extract 3960x1864+0+296 cauchy-3960x2160.png \
		-scale 50% cauchy.jpg

knick:	knick.jpg
knick.png:	knick.pov
	povray $(povrayoptions) $(dimensions) -Oknick.png knick.pov
knick.jpg:	knick.png
	convert -extract 2943x2028+480+60 knick.png -scale 50% knick.jpg
	
