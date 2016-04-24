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
u = 50;

z0 = (0,0);
z1 = (1 * u, 0 * u);
z2 = (4 * u, 0 * u);
z3 = (4 * u, 4 * u);
z4 = (1 * u, 4 * u);

fill (z1--(5 * u,0)--(5*u,5*u)--(1*u,5*u)--cycle) withcolor (0.9,0.9,0.9);

path charboundary;
charboundary = (0.2 * u, -0.1 * u)--(4.1 * u, -0.1 * u)
		--(4.1 * u, 4.1 * u)--(0.2 * u, 4.1 * u)--cycle;

pickup pencircle scaled 0.7pt;

def curvepoint(expr t) =
	(u * mexp(256 * t), u * t)
enddef;

path	p;
p := curvepoint(-2);
for t = -1.95 step 0.05 until 2:
	p := p--curvepoint(t);
endfor;

for tzero = -2 step 0.25 until 6:
	draw p shifted (0, u * tzero) withcolor red;
endfor;

pickup pencircle scaled 1.5pt;
draw p withcolor red;

clip currentpicture to charboundary;

drawarrow (z0 shifted (-5,0))--(z2 shifted (10,0));
label.top(btex $x$ etex, z2 shifted (10,0));
drawarrow (z0 shifted (0,-5))--(0,4*u + 10);
label.lft(btex $t$ etex, z4 shifted(-u,10));

label(btex $\Omega$ etex, (2.5 * u,2 *u));

pickup pencircle scaled 2pt yscaled 0.1pt;
draw z1--(z4 shifted (0,0.1 * u)) withcolor green;
pickup pencircle scaled 0.1pt yscaled 20;
draw z1--(z2 shifted (0.1 * u,0)) withcolor green;
pickup pencircle scaled 2pt;
draw z1 withcolor green;

pickup pencircle scaled 1pt;
draw (1 * u,-3)--(1 * u,3); label.bot(btex $1$ etex, (1 * u,-3));
draw (2 * u,-3)--(2 * u,3); label.bot(btex $2$ etex, (2 * u,-3));
draw (3 * u,-3)--(3 * u,3); label.bot(btex $3$ etex, (3 * u,-3));
draw (4 * u,-3)--(4 * u,3); label.bot(btex $4$ etex, (4 * u,-3));

draw (-3,1 * u)--(3,1 * u); label.lft(btex $1$ etex, (-3,1 * u));
draw (-3,2 * u)--(3,2 * u); label.lft(btex $2$ etex, (-3,2 * u));
draw (-3,3 * u)--(3,3 * u); label.lft(btex $3$ etex, (-3,3 * u));
draw (-3,4 * u)--(3,4 * u); label.lft(btex $4$ etex, (-3,4 * u));

endfig;

end
