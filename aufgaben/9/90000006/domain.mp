verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

beginfig(1)

numeric u;
u = 80;

z0 = (   -u,     0);
z1 = (3 * u,     0);
z2 = (    0,-3 * u);
z3 = (    0,     0);

pickup pencircle scaled 0.5pt;

def curveminus(expr c) =
	path p;
	p = (c,0);
	for y = 5 step 5 until 3*u:
		p := p--(c - u * mexp(mlog(y/u) * 1.5)/1.5, -y);
	endfor;
	draw p withcolor (0.5,0.8,0.5);
enddef;

def curveplus(expr c) =
	path p;
	p = (c,0);
	for y = 5 step 5 until 3*u:
		p := p--(c + u * mexp(mlog(y/u) * 1.5)/1.5, -y);
	endfor;
	draw p withcolor (1,0.5,0.5);
enddef;

numeric c;
for c = -4 * u step u/4 until 7 * u:
	curveminus(c);
endfor;

for c = -5 * u step u/4 until 3*u:
	curveplus(c);
endfor;

pickup pencircle scaled 1.5pt;

curveplus( 1/3 * u);
curveminus(5/3 * u);

pickup pencircle scaled 3pt;

draw (u,-u);

clip currentpicture to (-80,-240)--(240,-240)--z1--z0--cycle;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z2 shifted (0,-10))--(z3 shifted (0,10));

label.urt(btex $x$ etex, z1 shifted (10,0));
label.ulft(btex $y$ etex, z3 shifted (0,10));

draw ( -u,-2)--( -u,2); label.top(btex $-1$ etex, ( -u,2));
draw (  u,-2)--(  u,2); label.top(btex $ 1$ etex, (  u,2));
draw (2*u,-2)--(2*u,2); label.top(btex $ 2$ etex, (2*u,2));
draw (3*u,-2)--(3*u,2); label.top(btex $ 3$ etex, (3*u,2));

draw (-2,   -u)--(2,   -u); label.lft(btex $-1$ etex, (-2, -  u));
draw (-2, -2*u)--(2, -2*u); label.lft(btex $-2$ etex, (-2, -2*u));
draw (-2, -3*u)--(2, -3*u); label.lft(btex $-3$ etex, (-2, -3*u));

label(btex $\Omega$ etex, (80,-120));

draw (1/3 * u, -2)--(1/3 * u, 2);
label.top(btex $C=\frac13$ etex, (1/3*u,2)) withcolor (1,0.5,0.5);
draw (5/3 * u, -2)--(5/3 * u, 2);
label.top(btex $C=-\frac53$ etex, (5/3*u,2)) withcolor (0.5,0.8,0.5);

endfig;

end
