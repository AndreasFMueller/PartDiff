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
z2 = (320,400);
z3 = (0,400);

pickup pencircle scaled 1pt;

fill z0--z1--z2--z3--cycle withcolor(0.9,0.9,0.9);

label(btex $\Omega$ etex, 0.5[z0,z2]);

pickup pencircle scaled 1pt;
numeric c, v;
for c = -600 step 25 until 300:
	draw (-150, 150 * (0.5 + c/150))
		for x = -125 step 25 until 325:
			..(x, 150 * (0.5 * x/150 + c/150) * (0.5 * x/150 + c/150))
		endfor
		withcolor (1,0.8,0.8);
endfor;

pickup pencircle scaled 2pt;
draw (-150, 150 * (0.5 + 225/150))
	for x = -125 step 25 until 325:
		..(x, 150 * (0.5 * x/150 - 225/150) * (0.5 * x/150 - 225/150))
	endfor
	withcolor (1,0,0);

pickup pencircle scaled 1.5pt;
draw (-150, 150 * (0.5 - 75/150))
	for x = -125 step 25 until 325:
		..(x, 150 * (0.5 * x/150 + 75/150) * (0.5 * x/150 + 75/150))
	endfor
	withcolor (1,0.6,0.6);

clip currentpicture to (-20,-20)--(320,-20)--(320,400)--(-20,400)--cycle;

pickup pencircle scaled 2pt;
draw z0--z1;
draw z0--z3;

pickup pencircle scaled 4pt;
draw (150,150);
label.rt(btex $(1,1)$ etex, (150,150)) shifted(5,0);

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

pickup pencircle scaled 4pt;
draw (0, 150 * (9/4)) withcolor(1,0,0);
label.urt(btex $a=\frac94$ etex, (0, 150 * (9/4)))
shifted(4,0)
withcolor(1,0,0);

pickup pencircle scaled 4pt;
draw (0, 150 * (1/4)); % withcolor(1,0,0);
label.lrt(btex $a=\frac14$ etex, (0, 150 * (1/4))) shifted(4,0);


endfig;

end
