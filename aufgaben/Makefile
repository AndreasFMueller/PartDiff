#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:	aufgabensammlung.pdf

TEXFILES = aufgabensammlung.tex uebungen.tex \
	1.tex 2.tex 3.tex 4.tex 5.tex 6.tex 7.tex 8.tex 9.tex a.tex b.tex

aufgabensammlung.pdf:	$(TEXFILES) aufgabensammlung.ind
	pdflatex aufgabensammlung.tex uebungen.tex

aufgabensammlung.ind:	$(TEXFILES) subdirs
	touch aufgabensammlung.ind
	pdflatex aufgabensammlung.tex
	makeindex aufgabensammlung.idx

clean:
	rm -f *.dvi *.log aufgabensammlung.pdf

1.tex:	dirs buildchapter.sh 1/*.tex
	./buildchapter.sh 1 > 1.tex

2.tex:	dirs buildchapter.sh 2/*.tex
	./buildchapter.sh 2 > 2.tex

3.tex:	dirs buildchapter.sh 3/*.tex
	./buildchapter.sh 3 > 3.tex

4.tex:	dirs buildchapter.sh 4/*.tex
	./buildchapter.sh 4 > 4.tex

5.tex:	dirs buildchapter.sh 5/*.tex
	./buildchapter.sh 5 > 5.tex

6.tex:	dirs buildchapter.sh 6/*.tex
	./buildchapter.sh 6 > 6.tex

7.tex:	dirs buildchapter.sh 7/*.tex
	./buildchapter.sh 7 > 7.tex

8.tex:	dirs buildchapter.sh 8/*.tex
	./buildchapter.sh 8 > 8.tex

9.tex:	dirs buildchapter.sh 9/*.tex
	./buildchapter.sh 9 > 9.tex

a.tex:	dirs buildchapter.sh a/*.tex
	./buildchapter.sh a > a.tex

b.tex:	dirs buildchapter.sh b/*.tex
	./buildchapter.sh b > b.tex

dirs:
	for dir in 1 2 3 4 5 6 7 8 9 a b; \
	do \
		if [ ! -d $${dir} ]; then mkdir $${dir}; fi; \
	done

subdirs:
	for dir in 1 2 3 4 5 6 7 8 9 a b; \
	do \
		if [ -d $${dir} ]; \
		then \
			( cd $${dir}; make ); \
		fi; \
	done

