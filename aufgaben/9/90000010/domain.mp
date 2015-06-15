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

z0 = ( 50, 50);
z1 = (200, 50);
z2 = (200,200);
z3 = ( 50,200);

pickup pencircle scaled 1pt;

fill (50,50)--(410,50)--(410,410)--(50,410)--cycle withcolor(0.95,0.95,0.95);
fill (100,100)--(150,100)--(150,150)--(100,150)--cycle withcolor (0.9,0.9,1);

pickup pencircle scaled 1pt;
numeric c, v;
for c = 0 step 12.5 until 250:
	draw (0,c)--(250,c) withcolor (0.5,0.8,0.5);
endfor;

numeric kappa;
kappa = 0.3;

for c = 1000 step -25 until 50:
	draw (45, c * (0.367879**(kappa * kappa * 0.9 * 0.9)))
	for v = 47.5 step 5 until 250:
		..(v, c * (0.367879**((kappa * v / 50) * (kappa * v / 50))))
	endfor
	withcolor (1,0.5,0.5);
endfor;

clip currentpicture to (45,45)--(205,45)--(205,205)--(45,205)--cycle;

pickup pencircle scaled 2pt;
draw (50,50)--(210,50);
draw (50,50)--(50,210);

pickup pencircle scaled 1pt;
drawarrow (-10,0)--(210,0);
drawarrow (0,-10)--(0,210);

label.urt(btex $x$ etex, (210,0));
label.ulft(btex $y$ etex, (0,210));

label.llft(btex $0$ etex, (0,0));

label(btex $\Omega$ etex, (175,175));

pickup pencircle scaled 1pt;
draw ( 50,-3)--( 50,3); label.bot(btex $1$ etex, ( 50,-3));
draw (100,-3)--(100,3); label.bot(btex $2$ etex, (100,-3));
draw (150,-3)--(150,3); label.bot(btex $3$ etex, (150,-3));
draw (200,-3)--(200,3); label.bot(btex $4$ etex, (200,-3));
draw (-3, 50)--(3, 50); label.lft(btex $1$ etex, (-3, 50));
draw (-3,100)--(3,100); label.lft(btex $2$ etex, (-3,100));
draw (-3,150)--(3,150); label.lft(btex $3$ etex, (-3,150));
draw (-3,200)--(3,200); label.lft(btex $4$ etex, (-3,200));

pickup pencircle scaled 0.5pt;
draw (100,100)--(150,100)--(150,150)--(100,150)--cycle withcolor(0.5,0.5,1);

endfig;

end
