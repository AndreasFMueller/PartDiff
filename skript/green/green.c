/*
 * green.c -- produce a 
 *
 * (c) 2013 Prof Dr Andreas Mueller, Hochschule Rapperswil
 */
#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>
#include <math.h>

int	debug = 0;

typedef struct func_s {
	int	n;	/* number of interior points */
	double	*x;
	double	*f;
	int	highlight;
} func_t;

func_t	*func_new(int n) {
	func_t	*result = (func_t *)calloc(1, sizeof(func_t));
	result->n = n;
	result->x = (double *)calloc(result->n, sizeof(double));
	result->f = (double *)calloc(result->n, sizeof(double));
	return result;
}

void	func_free(func_t *f) {
	if (f->f) {
		free(f->f);
		f->f = NULL;
	}
	if (f->x) {
		free(f->x);
		f->x = NULL;
	}
	free(f);
}

func_t	*func_copy(func_t *r) {
	func_t	*result = func_new(r->n);
	for (int i = 0; i < result->n; i++) {
		result->x[i] = r->x[i];
		result->f[i] = r->f[i];
	}
	result->highlight = r->highlight;
	return result;
}

double	G(double x, double xi) {
	return 0.5 * (x - xi) + 0.5 * fabs(x - xi) - x * (1 - xi);
}

const double	a = 0.2;
const double	b = 0.5;
const double	yscale = 88.82643960980422756822 /* = pow(3 * M_PI, 2) */;
const double	limit = 0.00750527286239539047 /* = 1/(3. * yscale * b) */;

func_t	*rhs(int n) {
	func_t	*result = func_new(n);

	/* create the support of the function */
	double	deltax = 1 / (1. + n);

	/* create the function values */
	for (int i = 0; i < result->n; i++) {
		result->x[i] = (i + 1) * deltax;
		result->f[i] = a * cos(3 * M_PI * result->x[i]) * deltax;
	}
	return result;
}

func_t	*solution(func_t *r, int k) {
	if (k <= 0) {
		k = r->n;
	}
	func_t	*result = func_new(r->n);
	for (int i = 0; i < r->n; i++) {
		result->x[i] = r->x[i];
		result->f[i] = 0;
		for (int j = 0; j < r->n; j++) {
			result->f[i] += G(result->x[i], r->x[j]) * r->f[j];
		}
	}
	// renormalize
	double	m = 0.;
	for (int i = 0; i < r->n; i++) {
		if (fabs(result->f[i]) > m) {
			m = fabs(result->f[i]);
		}
	}
	double	factor = limit / m;
	printf("%% m = %f, factor = %f\n", m, factor);
	if (factor < 1) {
		for (int i = 0; i < result->n; i++) {
			result->f[i] *= factor;
		}
	}
	return result;
}

int	figcounter = 0;

void	preamble(FILE *out) {
	fprintf(out, "verbatimtex\n");
	fprintf(out, "\\documentclass{article}\n");
	fprintf(out, "\\usepackage{times}\n");
	fprintf(out, "\\usepackage{amsmath}\n");
	fprintf(out, "\\usepackage{amssymb}\n");
	fprintf(out, "\\usepackage{amsfonts}\n");
	fprintf(out, "\\usepackage{txfonts}\n");
	fprintf(out, "\\begin{document}\n");
	fprintf(out, "etex;\n");
}

void	postamble(FILE *out) {
	fprintf(out, "end\n");
}

double	sign(double x) {
	if (x > 0) {
		return 1.;
	}
	if (x < 0) {
		return -1.;
	}
	return 0.;
}

void	showfunctiongraph(FILE *out, func_t *r, func_t *s) {
	fprintf(out, "beginfig(%d)\n", ++figcounter);
	fprintf(out, "pickup pencircle scaled 1pt;\n");
	fprintf(out, "drawarrow (-5,0)--(310,0);\n");
	fprintf(out, "drawarrow (0,-105)--(0,105);\n");
	fprintf(out, "label.ulft(btex $0$ etex, (0,0));\n");
	fprintf(out, "label.urt(btex $1$ etex, (300,0));\n");
	//fprintf(out, "draw (-2,%.3f)--(2,%.3f);\n", a * 300., a * 300.);

	/* vertical lines for delta functions */
	fprintf(out, "pickup pencircle scaled 0.5pt;\n");
	for (int i = 0; i < r->n; i++) {
		if (r->f[i] != 0) {
			double	x = 300. * r->x[i];
			double	y = 300. * r->f[i] * (1 + r->n);
			fprintf(out, "draw (%.3f,%.3f)--(%.3f,%.3f) "
				"withcolor(0.9,0.9,1);\n",
				x, y, x, sign(y));
		}
	}

	/* redraw axes */
	fprintf(out, "pickup pencircle scaled 1pt;\n");
	fprintf(out, "drawarrow (-5,0)--(310,0);\n");

	/* draw the peak of the axis */
	fprintf(out, "pickup pencircle scaled 2pt;\n");
	for (int i = 0; i < r->n; i++) {
		if (r->f[i] != 0) {
			double	x = 300. * r->x[i];
			double	y = 300. * r->f[i] * (1 + r->n);
			if (i == r->highlight) {
				fprintf(out, "pickup pencircle scaled 4pt;\n");
			}
			fprintf(out, "draw (%.3f,%.3f) withcolor(0,0,1);\n",
				x, y);
			if (i == r->highlight) {
				fprintf(out, "pickup pencircle scaled 2pt;\n");
			}
		}
	}
	fprintf(out, "pickup pencircle scaled 1pt;\n");
	fprintf(out, "draw (300,-2)--(300,2);\n");

	/* draw the solution */
	fprintf(out, "pickup pencircle scaled 1pt;\n");
	fprintf(out, "draw (%.3f,%.3f)\n", 0., 0.);
	for (int i = 0; i < s->n; i++) {
		double	x = 300. * s->x[i];
		double	y = 300. * s->f[i] * yscale * b;
		fprintf(out, "\t--(%.3f,%.3f)\n", x, y);
	}
	fprintf(out, "\t--(%.3f,%.3f) withcolor (1,0,0);\n", 300. * 1, 0.);

	fprintf(out, "endfig;\n");
}

void	flatten(func_t *f, int k) {
	for (int i = 0; i < f->n; i++) {
		if (i > k) {
			f->f[i] = 0;
		}
	}
}

int	main(int argc, char *argv[]) {
	int	c;
	int	n = 100;
	int	slow = 1;
	while (EOF != (c = getopt(argc, argv, "dn:s:")))
		switch (c) {
		case 'd':
			debug = 0;
			break;
		case 'n':
			n = atoi(optarg);
			break;
		case 's':
			slow = atoi(optarg);
			break;
		}

	preamble(stdout);
	
#if 0
	/* from left to right */
	for (int k = 1; k < n; k++) {
		func_t	*r = rhs(n);
		flatten(r, k);
		func_t	*s = solution(r, 0);
		for (int repeat = 0; repeat < slow; repeat++) {
			showfunctiongraph(stdout, r, s);
		}
		func_free(r);
		func_free(s);
	}
#endif

#if 0
	/* hierarchically */
	int	k = 2;
	while (k < 1024) {
		func_t	*r = rhs(k - 1);
		func_t	*s = solution(r, 0);
		for (int repeat = 0; repeat < slow; repeat++) {
			showfunctiongraph(stdout, r, s);
		}
		func_free(r);
		func_free(s);
		k <<= 1;
	}
#endif

	/* random addition of points */
	int	exponent = log2(n);
	int	repeats = 1;
	n = 1 << (++exponent);	// next larger power of 2
	func_t	*r0 = rhs(n);
	int	*use = (int *)calloc(n, sizeof(int));
	for (int k = 1; k <= n; k++) {
		/* adapt the repeats */
		repeats = 32 * pow(2, -k/16.);
		if (repeats < slow) {
			repeats = slow;
		}

		/* add a new point to the graph */
		int	index;
		while (1) {
			index = random() % n;
			if (0 == use[index]) {
				use[index] = 1;
				r0->highlight = index;
				break;
			}
		}

		/* mask some of the points in a copy of r0 */
		func_t	*r = func_copy(r0);
		double	scale = (1. + r->n) / (1. + k);
		for (int i = 0; i < r->n; i++) {
			r->f[i] *= scale;
			r->f[i] *= use[i];
		}

		/* create the associated solution */
		func_t	*s = solution(r, k);
		scale = 1/scale;
		for (int i = 0; i < r->n; i++) {
			r->f[i] *= scale;
		}

		/* display as many copies as necessary */
		for (int repeat = 0;
			(repeat < (slow * repeats)) && (repeat < 25);
			repeat++) {
			printf("%% n = %d, figure = %4d, iteration = %4d, "
				"repeats = %2d, index = %4d\n",
				n, figcounter, k, repeats, index);
			showfunctiongraph(stdout, r, s);
		}
		func_free(r);
		func_free(s);
	}
	func_free(r0);

	postamble(stdout);

	exit(EXIT_SUCCESS);
}
