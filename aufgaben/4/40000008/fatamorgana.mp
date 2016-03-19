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

numeric u;
u = 100;

z0 = (0,0);
z1 = (2.6 * u, 0);
z2 = (0, 2 * u);

numeric xo, yo;
xo = 1.2;
yo = 1;

vardef sqr(expr u) =
	(u*u)
enddef;

vardef curve(expr s, a, sigma) =
	(a * s + xo, a*a + 0.25 * sqr(s + 2 * sigma * sqrt(yo - a*a)))
enddef;

numeric delta;
delta := 0.1;
numeric span;
span := 3.5;

def drawcurve(expr a, sigma) =
	numeric s;
	s := -span;
	path p;
	p := curve(s, a, sigma);
	for s = -span + delta step delta until span - delta/2:
		p := p--curve(s, a, sigma);
	endfor;
	pickup pencircle scaled 1pt;
	draw p scaled u withcolor red;
enddef;

for a = 0.0001 step 0.1 until sqr(yo):
	drawcurve(a, 1);
	drawcurve(a, -1);
endfor;
drawcurve(sqrt(yo), 1);

clip currentpicture to (z0 shifted (-10,0))--z1--(z1 shifted z2 shifted (0,5))--(z2 shifted (-10,5))--cycle;
	
pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

z3 = (xo,yo) scaled u;
pickup pencircle scaled 4pt;
draw z3;
pickup pencircle scaled 3pt;
draw z3 withcolor white;

z4 = z3 shifted (5,0);
label.rt(btex $(x_0,y_0)$ etex, z4);

endfig;

end
