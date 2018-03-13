verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

%
% Randwerte fuer die Wellengleichung
%
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

%
% Randwerte am linken und rechten Rand des Einheitsquadrates
%
beginfig(2)

z0 = (0,0);
z1 = (150,0);
z2 = (0,150);
z3 = z1 + z2;

fill z0--z1--z3--z2--cycle withcolor (0.9,0.9,0.9);
fill z0--(0.5[z0,z1])--z3--(0.5[z2,z3])--cycle withcolor (0.95,1,0.95);

label(btex $\Omega$ etex, 0.5[z0,z3]);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z1]--1.05[z0,z1];
drawarrow (-0.05)[z0,z2]--1.05[z0,z2];

draw (z1 shifted (0,-3))--(z1 shifted (0,3));
draw (z2 shifted (-3,0))--(z2 shifted (3,0));
label.llft(btex $1$ etex, z1);
label.llft(btex $0$ etex, z0);
label.llft(btex $1$ etex, z2);
label.urt(btex $y$ etex, z2) shifted (1,0);
label.urt(btex $x$ etex, z1) shifted(1,2);

z4 = (-20, -20);
z5 = (170,360);
path p;
p = z4--z5;
for b = -300 step 50 until 150:
	draw p shifted (0,b) withcolor (1,0,0);
endfor

clip currentpicture to (-10,-10)--(160,-10)--(160,160)--(-10,160)--cycle;

pickup pencircle scaled 2pt;
draw z0--z2 withcolor (0,1,0);
draw z1--z3 withcolor (0,1,0);

endfig;

%
% Randwerte am oberen und unteren Rand des Einheitsquadrates
%
beginfig(3)

z0 = (0,0);
z1 = (150,0);
z2 = (0,150);
z3 = z1 + z2;

fill z0--z1--z3--z2--cycle withcolor (0.9,0.9,0.9);
fill z0--(0.5[z0,z1])--z3--(0.5[z2,z3])--cycle withcolor (0.95,1,0.95);

label(btex $\Omega$ etex, 0.5[z0,z3]);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z1]--1.05[z0,z1];
drawarrow (-0.05)[z0,z2]--1.05[z0,z2];

draw (z1 shifted (0,-3))--(z1 shifted (0,3));
draw (z2 shifted (-3,0))--(z2 shifted (3,0));
label.llft(btex $1$ etex, z1);
label.llft(btex $0$ etex, z0);
label.llft(btex $1$ etex, z2);
label.urt(btex $y$ etex, z2) shifted (1,0);
label.urt(btex $x$ etex, z1) shifted(1,2);

z4 = (-20, -20);
z5 = (170,360);
path p;
p = z4--z5;
for b = -300 step 50 until 150:
	draw p shifted (0,b) withcolor (1,0,0);
endfor

clip currentpicture to (-10,-10)--(160,-10)--(160,160)--(-10,160)--cycle;

pickup pencircle scaled 2pt;
draw z0--z1 withcolor (0,1,0);
draw z2--z3 withcolor (0,1,0);

endfig;

%
% Randwerte am linken und unteren Rand des Einheitsquadrates
%
beginfig(4)

z0 = (0,0);
z1 = (150,0);
z2 = (0,150);
z3 = z1 + z2;

fill z0--z1--z3--z2--cycle withcolor (0.9,0.9,0.9);

label(btex $\Omega$ etex, 0.5[z0,z3]);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z1]--1.05[z0,z1];
drawarrow (-0.05)[z0,z2]--1.05[z0,z2];

draw (z1 shifted (0,-3))--(z1 shifted (0,3));
draw (z2 shifted (-3,0))--(z2 shifted (3,0));
label.llft(btex $1$ etex, z1);
label.llft(btex $0$ etex, z0);
label.llft(btex $1$ etex, z2);
label.urt(btex $y$ etex, z2) shifted (1,0);
label.urt(btex $x$ etex, z1) shifted(1,2);

z4 = (-20, -20);
z5 = (170,360);
path p;
p = z4--z5;
for b = -300 step 50 until 150:
	draw p shifted (0,b) withcolor (1,0,0);
endfor

draw z0--(75,150) withcolor (0.95,1,0.95);

clip currentpicture to (-10,-10)--(160,-10)--(160,160)--(-10,160)--cycle;

pickup pencircle scaled 2pt;
draw z0--z1 withcolor (0,1,0);
draw z0--z2 withcolor (0,1,0);

endfig;

end
