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

numeric ynull;
ynull = 0.1;
numeric u;
u = 120;

vardef drei(expr y) =
	((y * y * y - ynull * ynull * ynull) / 3)
enddef;

vardef function(expr xnull, y) =
	(xnull + drei(y))
enddef;

z0  = (0 * u, 0 * u);
z1  = (0 * u, 1 * u);
z2  = (1 * u, 0 * u);
z3  = z1 shifted z2;

z5  = z4 shifted z2;
z4  = (0, ynull * u);

pickup pencircle scaled 1pt;

path omega;
omega = z4--z1--z3--z5--cycle;
fill omega withcolor 0.9;

pickup pencircle scaled 0.4pt;

draw omega;

pickup pencircle scaled 1pt;

numeric dx;
dy := 0.05;

def getcurve(expr xnull) =
	path p;
	p := (xnull * u, ynull * u);
	for y = ynull+dy step dy until 1.01:
		p := p--(function(xnull, y) * u, y * u);
	endfor;
enddef;

z6 = (function(1,1) * u, 0 * u);
z7 = (function(1,1) * u, 1 * u);

getcurve(0);
fill p--z1--z4--cycle withcolor (0.8,0.8,1);

numeric dx;
dx := 0.1;
for xnull = 1 step -dx until -0.01:
	getcurve(xnull);
	draw p withcolor red;
endfor;

label(btex $\Omega$ etex, 0.5[z4,z3]);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (0,-10))--(z1 shifted (0,10));
drawarrow (z0 shifted (-10,0))--(z6 shifted (10,0));

label.lft(btex $y$ etex, z1 shifted (-1,5));
label.top(btex $x$ etex, z6 shifted (5,1));

draw (z4 shifted (2,0))--(z4 shifted (-2,0));
label.lft(btex $y_0$ etex, z4 shifted (-2, 0));

endfig;

end
