#
# build domain image for problem 30000006
#
domain = 30000006-1.pdf
$(domain): domain.mp
	TEX=latex mpost domain.mp
	for f in domain.?; \
	do \
		mptopdf $${f}; \
	done
