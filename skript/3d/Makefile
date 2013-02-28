#
# Makefile
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	sol chr chrpl cauchy planes

#WIDTH = 320
#HEIGHT = 180
WIDTH = 3960
HEIGHT = 2160
DIMENSIONS = -W$(WIDTH) -H$(HEIGHT)

planes:	planes-$(WIDTH)x$(HEIGHT).png
planes-$(WIDTH)x$(HEIGHT).png:	planes.pov cauchy.inc
	povray $(DIMENSIONS) -Oplanes-$(WIDTH)x$(HEIGHT).png planes.pov

sol:	sol-$(WIDTH)x$(HEIGHT).png
sol-$(WIDTH)x$(HEIGHT).png:	sol.pov cauchy.inc
	povray $(DIMENSIONS) -Osol-$(WIDTH)x$(HEIGHT).png sol.pov

chr:	chr-$(WIDTH)x$(HEIGHT).png
chr-$(WIDTH)x$(HEIGHT).png:	chr.pov cauchy.inc characteristics.inc
	povray $(DIMENSIONS) -Ochr-$(WIDTH)x$(HEIGHT).png chr.pov

chrpl:	chrpl-$(WIDTH)x$(HEIGHT).png
chrpl-$(WIDTH)x$(HEIGHT).png:	chrpl.pov cauchy.inc characteristics.inc
	povray $(DIMENSIONS) -Ochrpl-$(WIDTH)x$(HEIGHT).png chrpl.pov

cauchy:	cauchy-$(WIDTH)x$(HEIGHT).png
cauchy-$(WIDTH)x$(HEIGHT).png:	cauchy.pov cauchy.inc
	povray $(DIMENSIONS) -Ocauchy-$(WIDTH)x$(HEIGHT).png cauchy.pov
