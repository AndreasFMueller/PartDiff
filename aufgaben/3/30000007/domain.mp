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
z1 = (320,0);
z2 = (320,320);
z3 = (0,320);

pickup pencircle scaled 1pt;

fill z0--z1--z2--z3--cycle withcolor(0.9,0.9,0.9);

label(btex $\Omega$ etex, 0.5[z0,z2]);

pickup pencircle scaled 2pt;
draw z0--z1;
draw z0--z3;

numeric c, v;
for c = 0 step 25 until 300:
	draw (c, 0)
		for x = c step 5 until 325:
			..(x,  150 * 0.25 * ((x/150) * (x/150) - (c/150) * (c/150)) * ((x/150) * (x/150) + (c/150) * (c/150)))
		endfor
		withcolor (1,0,0);
endfor;

clip currentpicture to (-20,-20)--(320,-20)--(320,320)--(-20,320)--cycle;

pickup pencircle scaled 1pt;
drawarrow (-0.05)[z0,z1]--(1.05)[z0,z1];
drawarrow (-0.05)[z0,z3]--(1.05)[z0,z3];

label.ulft(btex $x$ etex, (1.05)[z0,z1]) shifted (-1,2);
label.llft(btex $y$ etex, (1.05)[z0,z3]) shifted (-3,0);

label.llft(btex $0$ etex, z0);

pickup pencircle scaled 1pt;
draw (150,-3)--(150,3); label.bot(btex $1$ etex, (150,-3));
draw (300,-3)--(300,3); label.bot(btex $2$ etex, (300,-3));
draw (-3,150)--(3,150); label.lft(btex $1$ etex, (-3,150));
draw (-3,300)--(3,300); label.lft(btex $2$ etex, (-3,300));

endfig;

end
