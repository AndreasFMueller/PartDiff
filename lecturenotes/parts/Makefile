#
# Makefile -- cut script into parts
#
# (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
#
parts = PartDiff-00-front.pdf			\
	PartDiff-01-intro.pdf			\
	PartDiff-02-chapter1.pdf		\
	PartDiff-03-chapter2.pdf		\
	PartDiff-04-chapter3.pdf		\
	PartDiff-05-chapter4.pdf		\
	PartDiff-06-chapter5.pdf		\
	PartDiff-07-chapter6.pdf		\
	PartDiff-08-chapter7.pdf		\
	PartDiff-09-chapter8.pdf		\
	PartDiff-10-chapter9.pdf		\
	PartDiff-11-chapter10.pdf		\
	PartDiff-12-appendix.pdf		\
	PartDiff-13-back.pdf

all:	$(parts)

PartDiff-00-front.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-00-front.pdf ../lecturenotes.pdf 1-8

PartDiff-01-intro.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-01-intro.pdf ../lecturenotes.pdf 9-10

PartDiff-02-chapter1.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-02-chapter1.pdf ../lecturenotes.pdf 11-18

PartDiff-03-chapter2.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-03-chapter2.pdf ../lecturenotes.pdf 19-38

PartDiff-04-chapter3.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-04-chapter3.pdf ../lecturenotes.pdf 39-56

PartDiff-05-chapter4.pdf:	../lecturenotes.pdf ../lecturenotes.pdf 
	pdfjam --outfile PartDiff-05-chapter4.pdf ../lecturenotes.pdf 57-86

PartDiff-06-chapter5.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-06-chapter5.pdf ../lecturenotes.pdf 87-96

PartDiff-07-chapter6.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-07-chapter6.pdf ../lecturenotes.pdf 97-104

PartDiff-08-chapter7.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-08-chapter7.pdf ../lecturenotes.pdf 105-124

PartDiff-09-chapter8.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-09-chapter8.pdf ../lecturenotes.pdf 125-132

PartDiff-10-chapter9.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-10-chapter9.pdf ../lecturenotes.pdf 133-152

PartDiff-11-chapter10.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-11-chapter10.pdf ../lecturenotes.pdf 153-168

PartDiff-12-appendix.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-12-appendix.pdf ../lecturenotes.pdf 169-175

PartDiff-13-back.pdf:	../lecturenotes.pdf
	pdfjam --outfile PartDiff-13-back.pdf ../lecturenotes.pdf 176-177

