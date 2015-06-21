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



path p;
p = (0,0){right}
for v = 5 step 5 until 220:
	..(v, 0.5 * v * (v/100))
endfor;

%fill (0,0)--(210,0)--(210,210)--(0,210)--cycle withcolor(0.9,0.9,0.9);
fill p--(0,210)--cycle withcolor (0.95,1,0.95);
fill (210,0)--(reverse p)--cycle withcolor (0.95, 0.95, 1);


pickup pencircle scaled 2pt;
draw p withcolor (1,0,0);


pickup pencircle scaled 1pt;
for c = 0 step 25 until 210:
	draw (c, 0){right}
	for v = 5 step 5 until 220 - c:
		..(c + v, 0.5 * v * (v/100))
	endfor
	withcolor (1,0,0);
endfor;

for c = 0 step 25 until 200:
	draw (0, c){right}
	for v = 5 step 5 until 210:
		..(v, 0.5 * v * (v/100) + c)
	endfor
	withcolor (1,0,0);
endfor

clip currentpicture to (-10,-10)--(210,-10)--(210,210)--(-10,210)--cycle;

pickup pencircle scaled 2pt;
draw (0,0)--(210,0);
draw (0,0)--(0,210);

pickup pencircle scaled 1pt;
drawarrow (-10,0)--(210,0);
drawarrow (0,-10)--(0,210);

label.urt(btex $x$ etex, (210,0));
label.ulft(btex $y$ etex, (0,210));

label.llft(btex $0$ etex, (0,0));

label(btex $\Omega$ etex, (100,100));

pickup pencircle scaled 1pt;
draw (100,-3)--(100,3); label.bot(btex $1$ etex, (100,-3));
draw (200,-3)--(200,3); label.bot(btex $2$ etex, (200,-3));
draw (-3,100)--(3,100); label.lft(btex $1$ etex, (-3,100));
draw (-3,200)--(3,200); label.lft(btex $2$ etex, (-3,200));

endfig;

end
