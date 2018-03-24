verbatimtex
\documentclass[12pt]{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric xnull;
ynull = 0.1;
numeric u;
u = 100;

def log(expr x) =
	(mlog(x / xnull) / 256)
enddef;

def exp(expr x) =
	mexp(x * 256)
enddef;

vardef function(expr x, xnull) =
	ynull * exp(0.5 * (x * x - xnull * xnull))
enddef;

z0  = (0 * u,         0);
z1  = (1 * u,         0);
z2  = (2 * u,         0);
z3  = (0    , ynull * u);
z4  = z1 shifted z3;
z5  = z2 shifted z3;
z6  = (0 * u, 1     * u);
z7  = z1 shifted z6;
z8  = z2 shifted z6;
z9  = (0 * u, 1.1   * u);
z10 = z1 shifted z9;
z11 = z2 shifted z9;

pickup pencircle scaled 1pt;

path omega;
omega = z3--z4--z7--z6--cycle;
fill omega withcolor 0.9;

pickup pencircle scaled 0.4pt;

draw z1--z10;
%draw z2--z11;
draw z3--z5;
draw z6--z8;

numeric dx;

dx = 0.01;

pickup pencircle scaled 1pt;

def drawcurve(expr xnull) =
	path p;
	p := (xnull * u, ynull * u);
	for x = xnull + dx step dx until 2:
		p := p--(x * u, function(x, xnull) * u);
	endfor;
	p := p--(2 * u, function(2, xnull) * u);
	draw p withcolor red;
enddef;

for x = 0 step 0.2 until 1:
	drawcurve(x);
endfor;

draw (z3 shifted (-2,0))--(z3 shifted (2,0));
draw (z6 shifted (-2,0))--(z6 shifted (2,0));
draw (z1 shifted (0,-2))--(z1 shifted (0,2));

label.lft(btex $y_0$ etex, z3 shifted (-2,0));
label.lft(btex $1$ etex, z6 shifted (-2,0));
label.bot(btex $1$ etex, z1 shifted (0,-2));

label(btex $\Omega$ etex, 0.5[z3,z7]);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z9 shifted (0,10));

label.top(btex $x$ etex, z2 shifted (10,0));
label.lft(btex $y$ etex, z9 shifted (0,10));

endfig;

end
