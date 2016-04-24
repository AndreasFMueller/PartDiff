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
v = 60;

numeric pi;
pi := 3.1415926;

z0 = (0,0);
z1 = (-pi * u, 0);
z2 = ( pi * u, 0);
z3 = (0,-v);
z4 = (0, v);
z5 = (-0.5 * pi * u,-v);
z6 = ( 0.5 * pi * u, v);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

pickup pencircle scaled 1.5pt;

draw ((-0.05)[z1,z5])--z5--z6--(1.05[z6,z2]) withcolor red;

pickup pencircle scaled 1pt;

draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (0,-2))--(z2 shifted (0,2));
draw (0.5[z1,z0] shifted (0,-2))--(0.5[z1,z0] shifted (0,2));
draw (0.5[z0,z2] shifted (0,-2))--(0.5[z0,z2] shifted (0,2));
label.bot(btex $-\pi\mathstrut$ etex, z1 shifted (0,-2));
label.bot(btex $-\frac{\pi}2\mathstrut$ etex, 0.5[z1,z0] shifted (0,-2));
label.bot(btex $ \pi\mathstrut$ etex, z2 shifted (0,-2));
label.bot(btex $\frac{\pi}2\mathstrut$ etex, 0.5[z0,z2] shifted (0,-2));

label.top(btex $x\mathstrut$ etex, z2 shifted (10,0));
label.rt(btex $d(x)\mathstrut$ etex, z4 shifted (0,10));

z7 = (0,v);
z8 = (0,-v);
draw (z7 shifted (-2,0))--(z7 shifted (2,0));
draw (z8 shifted (-2,0))--(z8 shifted (2,0));
label.lft(btex $1$ etex, z7 shifted (-2,0));
label.lft(btex $-1$ etex, z8 shifted (-2,0));

endfig;

end
