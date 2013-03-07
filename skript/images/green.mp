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
z1 = (300,0);
z2 = (0,-75);

for xi = 0.025 step 0.05 until 1:
	pickup pencircle scaled 0.5pt;
	draw z0--(300*(xi,xi * (xi - 1)))--z1 withcolor (1,0.9,0.9);
	pickup pencircle scaled 2pt;
	draw 300*(xi,xi * (xi - 1)) withcolor (1,0.9,0.9);
endfor;

pickup pencircle scaled 1pt;

drawarrow (-0.03[z0,z1])--(1.03[z0,z1]);
drawarrow ((-0.1)[z2,z0])--(1.1[z2,z0]);

draw (z0 shifted (0,2))--(z0 shifted (0,-2));
draw (z1 shifted (0,2))--(z1 shifted (0,-2));

label.llft(btex $0$ etex, z0);
label.top(btex $G(x,\xi)$ etex, 1.1[z2,z0]);
label.lrt(btex $1$ etex, z1);
label.urt(btex $x$ etex, 1.03[z0,z1]);

pickup pencircle scaled 1pt;
draw z0--(300*(0.325,0.325*(0.325-1)))--z1 withcolor (1,0,0);

pickup pencircle scaled 0.2pt;
draw (300*(0.325,0))--(300*(0.325,-0.325*(1-0.325)));
label.top(btex $\xi$ etex, 300*(0.325,0));
pickup pencircle scaled 2pt;
draw 300*(0.325,0);
draw 300*(0.325,0.325*(0.325-1)) withcolor (1,0,0);

endfig;

end
