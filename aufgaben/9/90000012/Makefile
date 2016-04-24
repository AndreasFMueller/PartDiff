#
# build domain image for problem 90000009
#
domain = domain-1.pdf
	
$(domain): domain.mp
	TEX=latex mpost domain.mp
	for f in domain.?; \
	do \
		mptopdf $${f}; \
	done
