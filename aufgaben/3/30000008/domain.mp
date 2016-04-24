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
z3 = (-150,0);
z4 = (0,-150);

pickup pencircle scaled 1pt;

fill z1..z2..z3..z4..cycle withcolor(0.9,0.9,0.9);

label(btex $\Omega$ etex, (12.5,-12.5));

pickup pencircle scaled 1pt;
draw z1..z2..z3..z4..cycle;

pickup pencircle scaled 2pt;

numeric c, v;
for c = -225 step 25 until 150:
	draw (-175, c + 75 * (175/150) * (175/150))
		for x = -150 step 25 until 175:
			..(x, c + 75 * ((x/150) * (x/150)))
		endfor
		withcolor (1,0,0);
endfor;

clip currentpicture to (-160,-160)--(160,-160)--(160,160)--(-160,160)--cycle;

pickup pencircle scaled 1pt;
drawarrow (-0.05)[z3,z1]--(1.05)[z3,z1];
drawarrow (-0.05)[z4,z2]--(1.05)[z4,z2];

label.ulft(btex $x$ etex, (1.05)[z3,z1]) shifted (-1,2);
label.llft(btex $y$ etex, (1.05)[z4,z2]) shifted (-3,0);

endfig;

end
