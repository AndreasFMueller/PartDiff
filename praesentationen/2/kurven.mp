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
z1 = (200,0);
z2 = (0,200);
z3 = (200,200);

pickup pencircle scaled 0.5pt;

numeric S;
S = 1/100;

for t = 0 step 5 until 40:
	draw (1,mexp(-20*t))--(200,200*mexp(-20*t)) withcolor(1,0,0);
	draw (mexp(-20*t),1)--(200*mexp(-20*t),200) withcolor(1,0,0);
endfor;

for s = 0 step 10 until 140:
	path p;
	numeric tzero;
endfor

clip currentpicture to z0--z1--z3--z2--cycle;

pickup pencircle scaled 1pt;
drawarrow (-0.04)[z0,z1]--(1.04)[z0,z1];
drawarrow (-0.04)[z0,z2]--(1.04)[z0,z2];
draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (-2,0))--(z2 shifted (2,0));

endfig;

end
