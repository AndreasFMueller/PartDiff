#
# Makefile
#
# (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
#

char.pdf:	char.tex red.tex green.tex
	pdflatex char.tex

red.tex green.tex:	char.m
	octave char.m
