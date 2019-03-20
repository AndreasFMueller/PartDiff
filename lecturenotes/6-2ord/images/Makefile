#
# Makefile
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
POVRAYOPTIONS = -D +A0.1 -W1080 -H1920
EXTRACT = -extract 1080x1290+0+246
DENSITY = -density 300 -units PixelsPerInch

all:	problem.jpg							\
	particular.jpg							\
	rproblem.jpg							\
	rsolution.jpg							\
	combine.jpg							\
	solution.jpg 

problem.png:	problem.pov common.inc
	povray $(POVRAYOPTIONS) -Oproblem.png problem.pov
problem.jpg:	problem.png
	convert $(EXTRACT) problem.png $(DENSITY) problem.jpg

particular.png:	particular.pov common.inc
	povray $(POVRAYOPTIONS) -Oparticular.png particular.pov
particular.jpg:	particular.png
	convert $(EXTRACT) particular.png $(DENSITY) particular.jpg

rproblem.png:	rproblem.pov common.inc
	povray $(POVRAYOPTIONS) -Orproblem.png rproblem.pov
rproblem.jpg:	rproblem.png
	convert $(EXTRACT) rproblem.png $(DENSITY) rproblem.jpg

rsolution.png:	rsolution.pov common.inc
	povray $(POVRAYOPTIONS) -Orsolution.png rsolution.pov
rsolution.jpg:	rsolution.png
	convert $(EXTRACT) rsolution.png $(DENSITY) rsolution.jpg

combine.png:	combine.pov common.inc
	povray $(POVRAYOPTIONS) -Ocombine.png combine.pov
combine.jpg:	combine.png
	convert $(EXTRACT) combine.png $(DENSITY) combine.jpg

solution.png:	solution.pov common.inc
	povray $(POVRAYOPTIONS) -Osolution.png solution.pov
solution.jpg:	solution.png
	convert $(EXTRACT) solution.png $(DENSITY) solution.jpg

