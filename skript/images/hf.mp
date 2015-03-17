%
% hf.mp -- graph der hyperbolischen Funktionen
%
% (c) 2015 Prof Dr Andreas Mueller
%
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
u = 60;

z0 = (0,0);
z1 = (-2 * u, 0);
z2 = ( 2 * u, 0);
z3 = ( 0, -3.5 * u);
z4 = ( 0,  3.5 * u);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z1,z2]--(1.05)[z1,z2];
drawarrow (-0.05)[z3,z4]--(1.05)[z3,z4];

label.top(btex $x$ etex, 1.05[z1,z2]);
label.lft(btex $y$ etex, 1.05[z3,z4]);

draw (     u,-2)--(     u,2); label.bot(btex $ 1$ etex, ( 1 * u, -2));
draw ( 2 * u,-2)--( 2 * u,2); label.bot(btex $ 2$ etex, ( 2 * u, -2));
draw (-    u,-2)--(-    u,2); label.bot(btex $-1$ etex, (-1 * u, -2));
draw (-2 * u,-2)--(-2 * u,2); label.bot(btex $-2$ etex, (-2 * u, -2));

draw (-2,-3 * u)--(2,-3 * u); label.lft(btex $-3$ etex, (-2, -1 * u));
draw (-2,-2 * u)--(2,-2 * u); label.lft(btex $-2$ etex, (-2, -2 * u));
draw (-2,-1 * u)--(2,-1 * u); label.lft(btex $-1$ etex, (-2, -3 * u));
draw (-2, 1 * u)--(2, 1 * u); label.llft(btex $ 1$ etex, (-2,  1 * u));
draw (-2, 2 * u)--(2, 2 * u); label.lft(btex $ 2$ etex, (-2,  2 * u));
draw (-2, 3 * u)--(2, 3 * u); label.lft(btex $ 3$ etex, (-2,  3 * u));

def cosh(expr x) =
	u * (mexp(256 * x / u) + mexp(-256 * x / u))/2
enddef;

def sinh(expr x) =
	u * (mexp(256 * x / u) - mexp(-256 * x / u))/2
enddef;

pickup pencircle scaled 1.5pt;

path p;
p := (-2 * u, sinh(-2 * u));
for x = -1.95 step 0.05 until 2.02:
	p := p..(x * u, sinh(x*u));
endfor;
draw p withcolor(1,0,0);

z5 = (1 * u, sinh(1 * u));
z6 = z5 shifted(10,-10);

label.lrt(btex $\sinh x$ etex, z6) withcolor(1,0,0);
pickup pencircle scaled 0.5pt;
draw z5--z6 withcolor(1,0,0);

pickup pencircle scaled 1.5pt;

p := (-2 * u, cosh(-2 * u));
for x = -1.95 step 0.05 until 2.02:
	p := p..(x * u, cosh(x*u));
endfor;
draw p withcolor(0,0,1);

z7 = (-1 * u, cosh(-1 * u));
z8 = z7 shifted(-10,-10);

label.llft(btex $\cosh x$ etex, z8) withcolor(0,0,1);
pickup pencircle scaled 0.5pt;
draw z7--z8 withcolor(0,0,1);

pickup pencircle scaled 1pt;

endfig;

end
