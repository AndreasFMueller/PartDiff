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

z0 = (  0,100);
z1 = (100,100);
z2 = (100,200);
z3 = (  0,200);

pickup pencircle scaled 1pt;

fill z0--z1--z2--z3--cycle withcolor(0.9,0.9,0.9);

pickup pencircle scaled 1pt;
numeric c, v;
for c = -250 step 25 until 150:
	draw (c-33.3333, 0){up}
		for x = c-33 step 5 until 110:
			..(x, 100 * ((1 + (x - c)/33.33)**0.333333))
		endfor
		withcolor (1,0,0);
endfor;

clip currentpicture to (-5,-5)--(105,-5)--(105,205)--(-5,205)--cycle;

pickup pencircle scaled 2pt;
draw z0--z1;

label(btex $\Omega$ etex, 0.5[z0,z2]);

pickup pencircle scaled 2pt;
pickup pencircle scaled 1pt;
drawarrow (-10,  0)--(110,  0);
drawarrow (  0,-10)--(  0,210);

label.urt(btex $x$ etex, (110,0));
label.ulft(btex $y$ etex, (0,210));

label.llft(btex $0$ etex, (0,0));

pickup pencircle scaled 1pt;
draw (100,-3)--(100,3); label.bot(btex $1$ etex, (100,-3));
draw (-3,100)--(3,100); label.lft(btex $1$ etex, (-3,100));
draw (-3,200)--(3,200); label.lft(btex $2$ etex, (-3,200));

endfig;

end
