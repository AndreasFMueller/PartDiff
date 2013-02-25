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
z2 = (150,150);
z3 = (0,150);

pickup pencircle scaled 1pt;

fill z0--z1--z2--z3--cycle withcolor(0.9,0.9,0.9);
label(btex $\Omega$ etex, 0.5[z0,z2]);

pickup pencircle scaled 2pt;
draw z0--z1--z2--z3--cycle;

numeric c;
for c = -75 step 25 until 150:
	draw (-25, 2.08333 + c)
		for x = 0 step 25 until 175:
			..(x, x * (x/300) + c)
		endfor
		withcolor (1,0,0);
endfor;

clip currentpicture to (-10,-10)--(160,-10)--(160,160)--(-10,160)--cycle;

pickup pencircle scaled 1pt;
drawarrow (-0.05)[z0,z1]--(1.15)[z0,z1];
drawarrow (-0.05)[z0,z3]--(1.15)[z0,z3];

label.ulft(btex $x$ etex, (1.15)[z0,z1]) shifted (-1,2);
label.llft(btex $y$ etex, (1.15)[z0,z3]) shifted (-3,0);

endfig;

end
