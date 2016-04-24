#
# Makefile -- build drawing of initial curve
#
# (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
#
dreieck_FILES = dreieck-1.pdf
dreieck: $(dreieck_FILES)
$(dreieck_FILES):	dreieck.mp
	TEX=latex mpost dreieck.mp
	for f in dreieck.[1-9]*; \
	do \
		mptopdf $${f}; \
	done

