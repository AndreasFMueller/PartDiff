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
u = 120;

vardef drei(expr x) =
	((x * x * x - xnull * xnull * xnull) / 3)
enddef;

vardef function(expr x, ynull) =
	(ynull + drei(x))
enddef;

z0  = (0 * u, 0);
z1  = (1 * u, 0);
z2  = (0 * u, 1 * u);
z3  = z1 shifted z2;

z4  = (xnull * u, 0);
z5  = z4 shifted z2;

pickup pencircle scaled 1pt;

path omega;
omega = z4--z1--z3--z5--cycle;
fill omega withcolor 0.9;

pickup pencircle scaled 0.4pt;

draw omega;

pickup pencircle scaled 1pt;

numeric dx;
dx := 0.05;

def getcurve(expr ynull) =
	path p;
	p := (xnull * u, ynull * u);
	for x = xnull+dx step dx until 1.01:
		p := p--(x * u, function(x, ynull) * u);
	endfor;
enddef;

z6 = (0 * u, function(1,1) * u);
z7 = (1 * u, function(1,1) * u);

getcurve(0);
fill p--z1--z4--cycle withcolor (0.8,0.8,1);

numeric dy;
dy := 0.1;
for ynull = 1 step -dy until -0.01:
	getcurve(ynull);
	draw p withcolor red;
endfor;

label(btex $\Omega$ etex, 0.5[z4,z3]);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z6 shifted (0,10));

label.top(btex $x$ etex, z1 shifted (10,0));
label.lft(btex $y$ etex, z6 shifted (0,10));

draw (z4 shifted (0,2))--(z4 shifted (0,-2));
label.bot(btex $x_0$ etex, z4 shifted (0,-2));

endfig;

end
