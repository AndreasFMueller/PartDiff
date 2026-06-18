#
# Makefile
#
# (c) 2026 Prof Dr Andreas Müller
#
all:	solution.pdf

solution.png:	solution.pov
	povray +A0.1 -W1920 -H1080 -Osolution.png solution.pov
solution.jpg:	solution.png Makefile
	magick -extract 1860x1080+15+0 solution.png solution.jpg

solution.pdf:	solution.tex solution.jpg
	pdflatex solution.tex
