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

z4 = (0    , -2 * u);
z5 = (3 * u, -2 * u);
z6 = (3 * u,  2 * u);
z7 = (0    ,  2 * u);

path border;
border = z4--z5--z6--z7--cycle;

fill border withcolor (0.9,0.9,1);
draw border withcolor blue;

numeric alpha;
alpha := -0.1;

numeric mplus;
mplus := 1;

numeric mminus;

pickup pencircle scaled 0.5pt;
for y = -20 step 1 until 10:
	draw (0,y * u)--(8 * u, y * u + 8 * mplus  * u) withcolor red;
endfor;
pickup pencircle scaled 1pt;
draw (0,-5 * u)--(8 * u, -5 * u + 8 * mplus  * u) withcolor red;

for alpha = -0.1 step 0.01 until 0.1:
	mminus := (alpha - 1) / (alpha + 1);
	pickup pencircle scaled 0.1pt;
	for y = -5 step 1 until 40:
		draw (0,y * u)--(8 * u, y * u + 8 * mminus * u) withcolor (0.9,1,0.9);
	endfor;
endfor;
mminus := -1;
pickup pencircle scaled 0.4pt;
for y = -5 step 1 until 40:
	draw (0,y * u)--(8 * u, y * u + 8 * mminus * u) withcolor green;
endfor;
pickup pencircle scaled 1pt;
draw (0, 5 * u)--(8 * u,  5 * u + 8 * mminus * u) withcolor green;

path boundary;
boundary := (z0 shifted z2)--(z1 shifted z2)--(z1 shifted z3)--(z0 shifted z3)--cycle;

clip currentpicture to boundary;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z2 shifted (0,-10))--(z3 shifted (0,10));
label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z3 shifted (0,10));
label.top(btex $R$ etex, (1.5 * u, 0 * u)) withcolor blue;

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

pickup pencircle scaled 3pt;

draw z5 withcolor red;
fill (z5--(z5 shifted (u - 2, 0))--(z5 shifted (u - 2, -13))--(z5 shifted (0, -13))--cycle) shifted (2,-1) withcolor white;
label.lrt(btex $y'=1$ etex, z5 shifted (2,-2)) withcolor red;

draw z6 withcolor green;
fill (z6--(z6 shifted (2.15*u, 0))--(z6 shifted(2.15*u,13))--(z6 shifted(0,13))--cycle) shifted (2,3) withcolor white;
label.urt(btex $y'=-1,\; \alpha=0$ etex, z6 shifted (2,2)) withcolor (0,0.9,0);

endfig;

end
