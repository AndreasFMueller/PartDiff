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

numeric u;
u = 50;

z0 = (0,0);

path border;
border = (-2.5 * u, -2.5 * u)--
	( 2.5 * u, -2.5 * u)--
	( 2.5 * u,  2.5 * u)--
	(-2.5 * u,  2.5 * u)--cycle;

fill border withcolor (0.9,0.9,0.9);

path p;

def kreis(expr a, r) =
	(r * cosd(a), r * sind(a))
enddef;

p := kreis(0, u);
for a = 1 step 1 until 359:
	p := p--kreis(a, u);
endfor;
p := p--cycle;

fill p withcolor white;

def rad(expr w) =
	(w * 3.14159 / 180)
enddef;

def sp(expr a, s, delta) =
	((1 + rad(a + delta)) * u * cosd(s * a), (1 + rad(a + delta)) * u * sind(s * a))
enddef;

def spirale(expr s, delta) =
	p := sp(0, s, delta);
	for a = 1 step 1 until 200:
		p := p -- sp(a, s, delta);
	endfor;
enddef;

def spiralen(expr s, c) =
	pickup pencircle scaled 0.1;
	spirale(s, 0);
	for delta = 0 step 5 until 355:
		draw (p rotated delta) withcolor c;
	endfor;
enddef;

color	blau;
blau := (0,0,1);
color	gruen;
gruen := (0,1,0);

spiralen(1, blau);
spiralen(-1, gruen);

pickup pencircle scaled 1.5;

p := kreis(-90, 2*u);
for a = -89 step 1 until 90:
	p := p--kreis(a,2*u);
endfor;

draw p withcolor red;

numeric alphamin;
numeric alphamax;
alphamax = 180 * (3.14159/2 + 1)/3.14159;
alphamin = -alphamax;

pickup pencircle scaled 1pt;
spirale(1, 0);
draw p rotated alphamin withcolor blau;
spirale(-1, 0);
draw p rotated alphamax withcolor gruen;

p := kreis(alphamin, u);
for a = alphamin step 1 until alphamax:
	p := p -- kreis(a, u);
endfor;
p := p -- kreis(alphamax, u);
pickup pencircle scaled 1.5pt;
draw p withcolor red;

clip currentpicture to border;

endfig;

end
