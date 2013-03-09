#
# auxiliary programs to produce the graphs of green
# 
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
CFLAGS = -std=c99 -Wall -g -O2
LDFLAGS = -lm

all:	green

green:	green.c
	gcc -o green $(CFLAGS) green.c $(LDFLAGS)

green.mp:	green
	./green -n 500 -s 1 > green.mp

images/green00001.jpg:	green.mp
	cd images; rm -f green.[0-9]* green-*.pdf *.png *.jpg; \
	TEX=latex mpost ../green.mp; \
	for f in green.[0-9]*; \
	do \
		n=`echo $${f} | sed -e 's/.*\.//'`; \
		png=`printf "green%05d.png" $${n}`; \
		jpg=`printf "green%05d.jpg" $${n}`; \
		mptopdf $${f}; \
		gs -sDEVICE=png256 -dNOPAUSE -g2646x1758 \
			-r600 -sOutputFile=$${png} - \
			< green-$${n}.pdf; \
		pngtopnm $${png} | pamscale -width=880 -height=592 | \
			pnmtojpeg > $${jpg}; \
	done

green.mpg:	images/green00001.jpg
	jpeg2yuv -v 1 -I p -b 1 -f 25 -j images/green%05d.jpg | \
		mpeg2enc --no-constraints -q 1 -b 12000 -l m -f 8 -o green.mpg

clean:
	rm -f images/*
	rm -f green.mpg
	rm -f *.o green
