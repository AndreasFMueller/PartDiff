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
xnull = 0.1;
numeric u;
u = 100;

def log(expr x) =
	(mlog(x / xnull) / 256)
enddef;

vardef function(expr x, ynull) =
	sqrt(log(x) + ynull * ynull)
enddef;

z0 = (        0,                    0);
z1 = (xnull * u,                    0);
z2 = (  1   * u,                    0);
z3 = (  1.5 * u,                    0);
z4 = (        0,                    u);
z5 = (        0, function(1.5, 1) * u);

pickup pencircle scaled 1pt;

path omega;
omega = z1--z2--(z2 shifted z4)--(z1 shifted z4)--cycle;
fill omega withcolor 0.9;

pickup pencircle scaled 0.4pt;

draw z4--(z4 shifted z3);
draw z1--(z1 shifted z5);
draw z2--(z2 shifted z5);

numeric dx;

dx = 0.01;

pickup pencircle scaled 1pt;

def drawcurve(expr ynull) =
	path p;
	p := (xnull * u, ynull * u);
	for x = xnull + dx step dx until 1.5:
		p := p--(x * u, function(x, ynull) * u);
	endfor;
	p := p--(1.5 * u, function(1.5, ynull) * u);
	draw p withcolor red;
enddef;

for y = 0 step 0.2 until 1:
	drawcurve(y);
endfor;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (0,-2))--(z2 shifted (0,2));
draw (z4 shifted (-2,0))--(z4 shifted (2,0));

label.bot(btex $x_0$ etex, z1 shifted (0,-2));
label.bot(btex $1$ etex, z2 shifted (0,-2));
label.lft(btex $1$ etex, z4 shifted (-2,0));

label(btex $\Omega$ etex, 0.5[z1,z2 shifted z4]);

drawarrow (z0 shifted (-10,0))--(z3 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z5 shifted (0,10));

label.top(btex $x$ etex, z3 shifted (10,0));
label.rt(btex $y$ etex, z5 shifted (0,10));

endfig;

end
