#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#
timestamps = 3d.timestamp graphics.timestamp images.timestamp

all: $(timestamps)

3d.timestamp:
	cd 3d; make
	touch 3d.timestamp

graphics.timestamp:
	cd graphics; make
	touch graphics.timestamp

images.timestamp:
	cd images; make
	touch images.timestamp


