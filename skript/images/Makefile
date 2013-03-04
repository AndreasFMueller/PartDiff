#
# Makefile -- build images from metapost sources
#
# (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
timestamp:	saite burgers randwerte ode
	touch timestamp

RANDWERTEFILES = randwerte-1.pdf randwerte-2.pdf randwerte-3.pdf randwerte-4.pdf
SAITEFILES = saite-1.pdf
BURGERSFILES = burgers-1.pdf burgers-2.pdf burgers-3.pdf burgers-4.pdf \
	burgers-5.pdf burgers-6.pdf
ODEFILES = ode-1.pdf

randwerte:	$(RANDWERTEFILES)
$(RANDWERTEFILES):	randwerte.mp
	TEX=latex mpost randwerte.mp
	for f in randwerte.*; \
	do \
		mptopdf $${f}; \
	done

saite:	$(SAITEFILES)
$(SAITEFILES):  saite.mp
	TEX=latex mpost saite.mp
	mptopdf saite.1

burgers: $(BURGERSFILES)
$(BURGERSFILES):	burgers.mp
	TEX=latex mpost burgers.mp
	for i in 1 2 3 4 5 6; \
	do \
		mptopdf burgers.$${i}; \
	done

ode: $(ODEFILES)
$(ODEFILES):	ode.mp
	TEX=latex mpost ode.mp
	mptopdf ode.1
