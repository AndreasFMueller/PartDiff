#
# Makefile -- build images from metapost sources
#
# (c) 2012 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
timestamp:	saite burgers
	touch timestamp


SAITEFILES = saite-1.pdf
BURGERSFILES = burgers-1.pdf burgers-2.pdf burgers-3.pdf burgers-4.pdf \
	burgers-5.pdf burgers-6.pdf

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

