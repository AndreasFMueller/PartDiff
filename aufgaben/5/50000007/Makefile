#
# build domain image for problem 90000009
#
all:	domain loes.jpg

domain_FILES = domain-1.pdf
domain:	$(domain_FILES)	
$(domain_FILES): domain.mp
	TEX=latex mpost domain.mp
	for f in domain.?; \
	do \
		mptopdf $${f}; \
	done

w = 3840
h = 2160

loes.png:	loes.pov
	povray -A0.1 -R20 -W$(w) -H$(h) loes.pov

loes.jpg:	loes.png
	convert -extract 1626x1740+987+318 loes.png -resize 50% \
		-density 300 -units PixelsPerInch loes.jpg
