#
# build script for partial differential equations in engineering
# technology
#
# (c) 2018 Prof Dr Andreas Mueller, Hochschule Rapperswil
# 
all:	lecturenotes

TEXFILES = lecturenotes.tex						\
	0-intro.tex 							\
	1-examples/beamequation.tex					\
	1-examples/examples.tex						\
	1-examples/heatequation.tex					\
	1-examples/plateequation.tex					\
	1-examples/poissonproblem.tex					\
	1-examples/supersonic.tex					\
	1-examples/waveequation.tex					\
	2-classification/classification.tex				\
	2-classification/conditions.tex					\
	2-classification/domains.tex					\
	2-classification/equations.tex					\
	2-classification/notation.tex					\
	2-classification/solutions.tex					\
	2-classification/types.tex					\
	3-geometry/boundary.tex						\
	3-geometry/curves.tex						\
	3-geometry/singularities.tex					\
	4-separation/disk.tex						\
	4-separation/idea.tex						\
	4-separation/initial.tex					\
	4-separation/jacobi.tex						\
	4-separation/lpde.tex						\
	4-separation/membrane.tex					\
	4-separation/ode.tex						\
	4-separation/separation.tex					\
	4-separation/summary.tex					\
	4-separation/tsunami.tex					\
	5-transformation/diffusion.tex					\
	5-transformation/domains.tex					\
	5-transformation/heat.tex					\
	5-transformation/intro.tex					\
	5-transformation/laplace.tex					\
	5-transformation/transformation.tex				\
	6-2ord/canonical.tex						\
	6-2ord/pdgl2ord.tex						\
	6-2ord/splitting.tex						\
	6-2ord/standard.tex						\
	6-2ord/types.tex						\
	7-elliptic/1dim.tex						\
	7-elliptic/elliptic.tex						\
	7-elliptic/general.tex						\
	7-elliptic/generalizations.tex					\
	7-elliptic/intro.tex						\
	7-elliptic/inverse.tex						\
	7-elliptic/mean.tex						\
	7-elliptic/unique.tex						\
	8-parabolic/causality.tex					\
	8-parabolic/eigenfunctions.tex					\
	8-parabolic/green.tex						\
	8-parabolic/minmax.tex						\
	8-parabolic/parabolic.tex					\
	8-parabolic/particular.tex					\
	8-parabolic/problem.tex						\
	9-hyperbolic/boundary.tex					\
	9-hyperbolic/cauchy.tex						\
	9-hyperbolic/characteristics.tex				\
	9-hyperbolic/discontinuities.tex				\
	9-hyperbolic/higherdim.tex					\
	9-hyperbolic/chapter.tex					\
	9-hyperbolic/separation.tex					\
	9-hyperbolic/waves.tex						\
	a-nonlinear/burgers.tex						\
	a-nonlinear/characteristics.tex					\
	a-nonlinear/examples.tex					\
	a-nonlinear/fail.tex						\
	a-nonlinear/linearization.tex					\
	a-nonlinear/nonlinear.tex					\
	a-nonlinear/singularities.tex					\
	b-sinh/hyp.tex							\
	b-sinh/ode.tex							\
	b-sinh/sinh.tex	

#	beispiele.tex klassifikation.tex geometrie.tex \
#	separation.tex tsunami.tex transformation.tex \
#	pdgl2ord.tex \
#	elliptisch.tex parabolisch.tex hyperbolisch.tex \
#	nichtlinear.tex jacobi.tex anhangsinh.tex

lecturenotes: lecturenotes.pdf

lecturenotes.ind:	$(TEXFILES) 
	touch lecturenotes.ind
	pdflatex lecturenotes.tex
	makeindex lecturenotes.idx

lecturenotes.pdf:	$(TEXFILES) lecturenotes.ind 
	pdflatex lecturenotes.tex

clean:
	rm -f lecturenotes.aux lecturenotes.ind lecturenotes.log lecturenotes.toc
