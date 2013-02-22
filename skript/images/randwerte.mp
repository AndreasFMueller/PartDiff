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
z1 = (150,0);
z2 = (0,150);
z3 = (150, 150);

fill z0--z1--z3--z2--cycle withcolor (1,0.9,0.9);

label(btex $\Omega$ etex, 0.5[z0,z3]);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z1]--1.05[z0,z1];
drawarrow (-0.05)[z0,z2]--1.05[z0,z2];

draw (z1 shifted (0,-3))--(z1 shifted (0,3));
label.bot(btex $l$ etex, z1) shifted (0,-3);
label.llft(btex $0$ etex, z0);
label.ulft(btex $t$ etex, z2) shifted (-1,0);
label.urt(btex $x$ etex, z1) shifted(1,2);

pickup pencircle scaled 2pt;

draw z0--z1 withcolor (1,0,0);
draw z0--z2 withcolor (1,0,0);
draw z1--z3 withcolor (1,0,0);

z4 = 0.5[z0,z1] shifted (0,20);

draw (z4 shifted (-20,0))--z4 withcolor (1,0,0);
label.rt(btex $=\partial\Omega$ etex, z4);

label.bot(btex $\begin{aligned}
u(x,0)&=f(x)\\
\frac{\partial u}{\partial t}(x,0)&=g(x)
\end{aligned}$ etex, 0.5[z0,z1]);

label.top(btex $u(0,t)=0$ etex, z0) rotated 90 shifted 0.5[z0,z2];
label.bot(btex $u(l,t)=0$ etex, z0) rotated 90 shifted 0.5[z1,z3];


endfig;

end
