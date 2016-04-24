#
# Makefile -- build images of fata morgana curves...
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
fatamorgana_FILES = fatamorgana-1.pdf
fatamorgana:	$(fatamorgana_FILES)
$(fatamorgana_FILES):	fatamorgana.mp
	TEX=latex mpost fatamorgana.mp
	for f in fatamorgana.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

