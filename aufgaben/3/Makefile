#
# Makefile -- Komponenten für die Aufgaben bauen
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:
	for d in *; \
	do \
		if [ -d $${d} ]; \
		then \
			if [ -r $${d}/Makefile ]; \
			then \
				( cd $${d}; make ); \
			fi; \
		fi; \
	done
