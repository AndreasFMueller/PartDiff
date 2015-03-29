#
# Makefile -- build images from metapost sources
#
# (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
timestamp:	saite burgers randwerte ode green char hypexp hf kausal
	touch timestamp

RANDWERTEFILES = randwerte-1.pdf randwerte-2.pdf randwerte-3.pdf randwerte-4.pdf
SAITEFILES = saite-1.pdf saite-2.pdf
BURGERSFILES = burgers-1.pdf burgers-2.pdf burgers-3.pdf burgers-4.pdf \
	burgers-5.pdf burgers-6.pdf
ODEFILES = ode-1.pdf
GREENFILES = green-1.pdf
CHARFILES = char-1.pdf char-2.pdf char-3.pdf
HYPEXPFILES = hypexp-1.pdf
HFFILES = hf-1.pdf
KAUSALFILES = kausal-1.pdf kausal-2.pdf kausal-3.pdf kausal-4.pdf

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
	for i in 1 2 3; \
	do \
		mptopdf saite.$${i}; \
	done

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

green: $(GREENFILES)
$(GREENFILES):	green.mp
	TEX=latex mpost green.mp
	mptopdf green.1

char:	$(CHARFILES)
$(CHARFILES):	char.mp
	TEX=latex mpost char.mp
	mptopdf char.1
	mptopdf char.2
	mptopdf char.3
	
hypexp: $(HYPEXPFILES)
$(HYPEXPFILES):	hypexp.mp
	TEX=latex mpost hypexp.mp
	mptopdf hypexp.1

hf: $(HFFILES)
$(HFFILES):	hf.mp
	TEX=latex mpost hf.mp
	mptopdf hf.1

kausal:	$(KAUSALFILES)
$(KAUSALFILES):	kausal.mp
	TEX=latex mpost kausal.mp
	for f in kausal.*; \
	do \
		mptopdf $${f}; \
	done
