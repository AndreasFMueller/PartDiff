#
# Makefile -- build domain graph for problem 90000011
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	domain
domain_FILES = domain-1.pdf
domain: $(domain_FILES)
$(domain_FILES):	domain.mp
	TEX=latex mpost domain.mp
	for f in domain.[0-9]*; \
	do \
		mptopdf $${f}; \
	done
