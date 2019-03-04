#
# build domain image for problem 90000009
#
all:	loes.jpg

loes.png:	loes.pov 
	povray -D +A0.1 -R20 -W3840 -H2160 loes.pov

loes.jpg:	loes.png
	convert -extract 2082x1986+1002+129 loes.png -resize 50% \
		-density 300 -units PixelsPerInch loes.jpg
#3690
#1563
