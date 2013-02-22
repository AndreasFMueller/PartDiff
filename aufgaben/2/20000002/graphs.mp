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
z5 = (100,0);
z1 = (0,-100);
z2 = (100,-100);
z3 = (100,100);
z4 = (0, 100);

pickup pencircle scaled 2pt;

fill z1--z2--z3--z4--cycle withcolor (1,0.9,0.9);
draw z1--z4 withcolor (1,0,0);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z5]--(1.1)[z0,z5];
drawarrow (-0.05)[z1,z4]--(1.05)[z1,z4];

label(btex $\Omega$ etex, 0.5[z0,z3]) withcolor (1,0,0);

label.urt(btex $x$ etex, z5);
label.ulft(btex $y$ etex, z4);

endfig;

beginfig(2)

z0 = (0,0);
z1 = (-100,-100);
z2 = ( 100,-100);
z3 = ( 100, 100);
z4 = (-100, 100);

pickup pencircle scaled 1pt;

drawarrow (-110,0)--(110,0);
drawarrow (0,-110)--(0,110);

label.top(btex $x$ etex, (105,0));
label.lft(btex $y$ etex, (0,105));

fill z1--z2--z3--z4--cycle withcolor (1,0.9,0.9);
label(btex $\Omega$ etex, (50,50)) withcolor (1,0,0);

draw (-100,0)--(100,0) withcolor (0.8,0.6,0.6);
draw (0,-100)--(0,100) withcolor (0.8,0.6,0.6);

pickup pencircle scaled 5pt;
draw z0 withcolor (1,1,1);

endfig;


end
