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
u = 30;

z0 = (    0,  0      );
z1 = (8 * u,  0      );
z2 = (    0, -5.5 * u);
z3 = (    0,  5.5 * u);

pickup pencircle scaled 1pt;

z4 = (0    , -3 * u);
z5 = (1 * u, -3 * u);
z6 = (1 * u,  3 * u);
z7 = (0    ,  3 * u);

path border;
border = z4--z5--z6--z7--cycle;

fill border withcolor (0.9,0.9,1);
draw border withcolor blue;

def exp(expr x) =
	mexp(256 * x)
enddef;

def coth(expr a) =
	((exp(a) + exp(-a)) / (exp(a) - exp(-a)))
enddef;

def mplus(expr x) =
	(coth(a) + sqrt(coth(a) * coth(a) - 1))
enddef;

def mminus(expr x) =
	(coth(a) - sqrt(coth(a) * coth(a) - 1))
enddef;

numeric a;
a := 1.0986;
show coth(a);
show mplus(a);
show mminus(a);

pickup pencircle scaled 0.5pt;
for y = -20 step 1 until 10:
draw (0,y * u)--(8 * u, y * u + 8 * mplus(a) * u) withcolor red;
draw (0,y * u)--(8 * u, y * u + 8 * mminus(a) * u) withcolor green;
endfor;
pickup pencircle scaled 1pt;
draw (0,-5 * u)--(8 * u, -5 * u + 8 * mplus(a) * u) withcolor red;

path boundary;
boundary := (z0 shifted z2)--(z1 shifted z2)--(z1 shifted z3)--(z0 shifted z3)--cycle;

clip currentpicture to boundary;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z2 shifted (0,-10))--(z3 shifted (0,10));
label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z3 shifted (0,10));

label.lft(btex $-5$ etex, (0, -5 * u));
draw (-2, -5 * u)--(2, -5 * u);
label.lft(btex $5$ etex, (0, 5 * u));
draw (-2, 5 * u)--(2, 5 * u);

label.lft(btex $-4$ etex, (0, -4 * u));
draw (-2, -4 * u)--(2, -4 * u);
label.lft(btex $4$ etex, (0, 4 * u));
draw (-2, 4 * u)--(2, 4 * u);

label.lft(btex $-3$ etex, (0, -3 * u));
draw (-2, -3 * u)--(2, -3 * u);
label.lft(btex $3$ etex, (0, 3 * u));
draw (-2, 3 * u)--(2, 3 * u);

label.lft(btex $-2$ etex, (0, -2 * u));
draw (-2, -2 * u)--(2, -2 * u);
label.lft(btex $2$ etex, (0, 2 * u));
draw (-2, 2 * u)--(2, 2 * u);

label.lft(btex $-1$ etex, (0, -1 * u));
draw (-2, -1 * u)--(2, -1 * u);
label.lft(btex $1$ etex, (0, 1 * u));
draw (-2, 1 * u)--(2, 1 * u);

label.lrt(btex $1$ etex, (1 * u, 0));
draw (1 * u, -2)--(1 * u, 2);

label.lrt(btex $2$ etex, (2 * u, 0));
draw (2 * u, -2)--(2 * u, 2);

label.lrt(btex $3$ etex, (3 * u, 0));
draw (3 * u, -2)--(3 * u, 2);

label.lrt(btex $4$ etex, (4 * u, 0));
draw (4 * u, -2)--(4 * u, 2);

label.lrt(btex $5$ etex, (5 * u, 0));
draw (5 * u, -2)--(5 * u, 2);

label.lrt(btex $6$ etex, (6 * u, 0));
draw (6 * u, -2)--(6 * u, 2);

label.lrt(btex $7$ etex, (7 * u, 0));
draw (7 * u, -2)--(7 * u, 2);

label.lrt(btex $8$ etex, (8 * u, 0));
draw (8 * u, -2)--(8 * u, 2);

endfig;

end
