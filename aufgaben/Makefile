#
# Makefile to build the problem collection
#
# (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
# $Id$
#
all:	aufgabensammlung.pdf

topdir := ${PWD}
workdir := work

pdflatex = pdflatex --output-directory=$(workdir)

TEXFILES = aufgabensammlung.tex						\
	macros/uebungen.tex						\
	$(workdir)/1.tex						\
	$(workdir)/2.tex						\
	$(workdir)/3.tex						\
	$(workdir)/4.tex						\
	$(workdir)/5.tex						\
	$(workdir)/6.tex						\
	$(workdir)/7.tex						\
	$(workdir)/8.tex						\
	$(workdir)/9.tex						\
	$(workdir)/a.tex						\
	$(workdir)/b.tex

aufgabensammlung.pdf:	$(workdir)/aufgabensammlung.pdf
	cp $(workdir)/aufgabensammlung.pdf .

$(workdir)/aufgabensammlung.pdf:	$(TEXFILES) \
	$(workdir)/aufgabensammlung.ind
	$(pdflatex) aufgabensammlung.tex 

$(workdir)/aufgabensammlung.ind:	$(workdir) $(TEXFILES) subdirs
	touch $(workdir)/aufgabensammlung.ind
	$(pdflatex) aufgabensammlung.tex
	cd $(workdir); makeindex aufgabensammlung.idx


clean:
	rm -f $(workdir)/*.dvi $(workdir)/*.log aufgabensammlung.pdf

$(workdir)/1.tex:	dirs buildchapter.sh 1/*.tex
	./buildchapter.sh 1 > $(workdir)/1.tex

$(workdir)/2.tex:	dirs buildchapter.sh 2/*.tex
	./buildchapter.sh 2 > $(workdir)/2.tex

$(workdir)/3.tex:	dirs buildchapter.sh 3/*.tex
	./buildchapter.sh 3 > $(workdir)/3.tex

$(workdir)/4.tex:	dirs buildchapter.sh 4/*.tex
	./buildchapter.sh 4 > $(workdir)/4.tex

$(workdir)/5.tex:	dirs buildchapter.sh 5/*.tex
	./buildchapter.sh 5 > $(workdir)/5.tex

$(workdir)/6.tex:	dirs buildchapter.sh 6/*.tex
	./buildchapter.sh 6 > $(workdir)/6.tex

$(workdir)/7.tex:	dirs buildchapter.sh 7/*.tex
	./buildchapter.sh 7 > $(workdir)/7.tex

$(workdir)/8.tex:	dirs buildchapter.sh 8/*.tex
	./buildchapter.sh 8 > $(workdir)/8.tex

$(workdir)/9.tex:	dirs buildchapter.sh 9/*.tex
	./buildchapter.sh 9 > $(workdir)/9.tex

$(workdir)/a.tex:	dirs buildchapter.sh a/*.tex
	./buildchapter.sh a > $(workdir)/a.tex

$(workdir)/b.tex:	dirs buildchapter.sh b/*.tex
	./buildchapter.sh b > $(workdir)/b.tex

wochen: woche01 woche02 woche03 woche04 woche05 woche06 woche07

woche01:	woche01.pdf
woche01.pdf:	$(workdir) $(TEXFILES) woche01.tex
	$(pdflatex) woche01.tex
	cp $(workdir)/woche01.pdf .

woche02:	woche02.pdf
woche02.pdf:	$(workdir) $(TEXFILES) woche02.tex
	$(pdflatex) woche02.tex
	cp $(workdir)/woche02.pdf .

woche03:	woche03.pdf
woche03.pdf:	$(workdir) $(TEXFILES) woche03.tex
	$(pdflatex) woche03.tex
	cp $(workdir)/woche03.pdf .

woche04:	woche04.pdf
woche04.pdf:	$(workdir) $(TEXFILES) woche04.tex
	$(pdflatex) woche04.tex
	cp $(workdir)/woche04.pdf .

woche05:	woche05.pdf
woche05.pdf:	$(workdir) $(TEXFILES) woche05.tex
	$(pdflatex) woche05.tex
	cp $(workdir)/woche05.pdf .

woche06:	woche06.pdf
woche06.pdf:	$(workdir) $(TEXFILES) woche06.tex
	$(pdflatex) woche06.tex
	cp $(workdir)/woche06.pdf .

woche07:	woche07.pdf
woche07.pdf:	$(workdir) $(TEXFILES) woche07.tex
	$(pdflatex) woche07.tex
	cp $(workdir)/woche07.pdf .


dirs:
	for dir in 1 2 3 4 5 6 7 8 9 a b; \
	do \
		if [ ! -d $${dir} ]; then mkdir $${dir}; fi; \
	done
	if [ ! -d $(workdir) ]; then mkdir $(workdir); fi

subdirs:
	for dir in 1 2 3 4 5 6 7 8 9 a b; \
	do \
		if [ -d $${dir} ]; \
		then \
			( cd $${dir}; make ); \
		fi; \
	done

