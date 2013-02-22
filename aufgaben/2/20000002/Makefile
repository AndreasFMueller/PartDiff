#
# build graphs for problem 20000002
#
graphs = 20000002-1.pdf 20000002-2.pdf
$(graphs): graphs.mp
	TEX=latex mpost graphs.mp
	for f in graphs.?; \
	do \
		mptopdf $${f}; \
	done
