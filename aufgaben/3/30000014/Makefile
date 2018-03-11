#
# build domain image for problem 30000012
#
all:	domain

domain_FILES = domain-1.pdf
domain:	$(domain_FILES)	
$(domain_FILES): domain.mp
	TEX=latex mpost domain.mp
	for f in domain.?; \
	do \
		mptopdf $${f}; \
	done
