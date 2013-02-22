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

z0 = (0,0);

pickup pencircle scaled 102;
draw z0 withcolor (1,0,0);
pickup pencircle scaled 98;
draw z0 withcolor (1,0.9,0.9);

pickup pencircle scaled 1pt;

drawarrow (-65,0)--(65,0);
drawarrow (0,-65)--(0,65);

label.urt(btex $\partial \Omega$ etex, 50 * (cosd(45), sind(45))) withcolor (1,0,0);

label(btex $\Omega$ etex, -25 * (cosd(45), sind(45))) withcolor (1,0,0);

draw (50,-2)--(50,2);
label.lrt(btex $5$ etex, (50,-2));
label.top(btex $x$ etex, (60,0));
label.lft(btex $y$ etex, (0,60));

endfig;

beginfig(2)

z0 = (0,0);

z1 = (50,0);
z2 = (0,50);
z3 = (-50,0);
z4 = (0,-50);

fill z1--z2--z3--z4--cycle withcolor (1,0.9,0.9);
label(btex $\Omega$ etex, (-15,-15)) withcolor (1,0,0);

label.urt(btex $\partial\Omega$ etex, 0.5[z1,z2]) withcolor (1,0,0);

pickup pencircle scaled 2;

draw z1--z2--z3--z4--cycle withcolor (1,0,0);

pickup pencircle scaled 1pt;

drawarrow (-65,0)--(65,0);
drawarrow (0,-65)--(0,65);

draw (50,-2)--(50,2);
label.lrt(btex $1$ etex, (50,-2));
label.top(btex $x$ etex, (60,0));
label.lft(btex $y$ etex, (0,60));

endfig;


end
