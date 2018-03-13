verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

%
% Charakteristiken von Beispiel 3
%
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

%
% Charakteristiken, d'Alembert Lösung
%
beginfig(2)

z0 = (0,0);
z1 = (140,0);
z2 = (-140,0);
z3 = (0,-20);
z4 = (0,180);

pickup pencircle scaled 0.5pt;

for xzero = -200 step 20 until 140:
	draw (xzero, -30)--(xzero + 80, 180) withcolor(1,0,0);
endfor
for xzero = -140 step 20 until 200:
	draw (xzero, -30)--(xzero - 80, 180) withcolor(0,1,0);
endfor

clip currentpicture to (-135,-20)--(135,-20)--(135,175)--(-135,175)--cycle;

pickup pencircle scaled 1pt;

drawarrow z2--z1;
drawarrow z3--z4;

label.top(btex $x$ etex, z1);
label.rt(btex $t$ etex, z4);

endfig;

%
% Charakteristiken, d_x d_y u = 0
%
beginfig(3)

z0 = (0,0);
z1 = (140,0);
z2 = (-140,0);
z3 = (0,-20);
z4 = (0,180);

pickup pencircle scaled 0.5pt;

for xzero = -140 step 20 until 140:
	draw (xzero, -30)--(xzero, 180) withcolor(1,0,0);
endfor
for yzero = -40 step 20 until 180:
	draw (-140,yzero)--(140, yzero) withcolor(0,1,0);
endfor

clip currentpicture to (-135,-15)--(135,-15)--(135,175)--(-135,175)--cycle;

pickup pencircle scaled 1pt;

drawarrow z2--z1;
drawarrow z3--z4;

label.top(btex $x$ etex, z1);
label.rt(btex $y$ etex, z4);

endfig;

end
