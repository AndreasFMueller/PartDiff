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
z1 = (140,0);
z2 = (-140,0);
z3 = (0,-20);
z4 = (0,180);

pickup pencircle scaled 0.5pt;

for xzero = -180 step 5 until 180:
	path p;
	p := (xzero * mexp(-2.56 * 30), -30);
	for t = -20 step 10 until 180:
		p := p..(xzero * mexp(2.56 * t),t);
	endfor;
	draw p withcolor (1,0,0);
endfor
for xzero = -840 step 20 until 840:
	path p;
	p := (xzero * mexp(2.56 * 30), -30);
	for t = -20 step 10 until 180:
		p := p..(xzero * mexp(-2.56 * t),t);
	endfor;
	draw p withcolor (0,1,0);
endfor

clip currentpicture to (-135,-20)--(135,-20)--(135,175)--(-135,175)--cycle;

pickup pencircle scaled 1pt;

drawarrow z2--z1;
drawarrow z3--z4;

label.top(btex $x$ etex, z1);
label.rt(btex $t$ etex, z4);

endfig;

end
