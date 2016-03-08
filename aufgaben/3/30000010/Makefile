#
# build domain image for problem 30000007
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

loes.png:	loes.pov Makefile
	../../../povray -A0.1 -R20 -W3840 -H2160 loes.pov

loes.jpg:	loes.png
	convert -extract 2226x2073+753+87 loes.png -resize 50% \
		-density 300 -units PixelsPerInch loes.jpg

