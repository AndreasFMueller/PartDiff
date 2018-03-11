#
# Praesentation für Lektion 1
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
FILES = zeitplan-1.pdf admin.tex slides.tex

all:	partdiff-presentation-1.pdf partdiff-handout-1.pdf

partdiff-presentation-1.pdf:	partdiff-presentation-1.tex $(FILES)
	pdflatex partdiff-presentation-1.tex

partdiff-handout-1.pdf:	partdiff-handout-1.tex $(FILES)
	pdflatex partdiff-handout-1.tex

zeitplan_FILES = zeitplan-1.pdf zeitplan-2.pdf zeitplan-3.pdf
$(zeitplan_FILES):	zeitplan.mp
	TEX=latex mpost zeitplan.mp
	for f in zeitplan.[0-9]*; \
	do \
		mptopdf $${f}; \
	done
