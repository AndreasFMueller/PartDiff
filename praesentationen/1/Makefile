#
# Praesentation für Lektion 1
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
partdiff-1.pdf:	partdiff-1.tex zeitplan-1.pdf
	pdflatex partdiff-1.tex

zeitplan_FILES = zeitplan-1.pdf zeitplan-2.pdf zeitplan-3.pdf
$(zeitplan_FILES):	zeitplan.mp
	TEX=latex mpost zeitplan.mp
	for f in zeitplan.[0-9]*; \
	do \
		mptopdf $${f}; \
	done
