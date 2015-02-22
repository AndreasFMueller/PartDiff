#
# Makefile -- Kurvenschar
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	partdiff-2.pdf

kurven-1.pdf:	kurven.mp
	TEX=latex mpost kurven.mp
	mptopdf kurven.1

partdiff-2.pdf:	partdiff-2.tex kurven-1.pdf
	pdflatex partdiff-2.tex
