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
z1 = (300,0);
z2 = (0, 120);

pickup pencircle scaled 1pt;

drawarrow (-0.05)[z0,z1]--(1.05)[z0,z1];
drawarrow (-0.05)[z0,z2]--(1.05)[z0,z2];

label.top(btex $x$ etex, 1.05[z0,z1]);
label.lft(btex $y$ etex, 1.05[z0,z2]);

pickup pencircle scaled 0.5pt;

numeric d;
d = 4;

def rescale(expr x) = 6.2831853 * (x / 300) enddef;
def unscale(expr x) = 300 * (x / 6.2831853) enddef;
def degrees(expr x) = 90 * rescale(x) / 0.7854 enddef;

for x = 0 step 10 until 300:
	for y = 0 step 10 until 120:
		xx := rescale(x);
		yy := rescale(y);
		yprime := -yy/6 + mexp(-256*xx/6) * cosd(degrees(x));
		pickup pencircle scaled 0.5pt;
		draw
(x - d / sqrt(1 + yprime * yprime), y - d * yprime / sqrt(1 + yprime * yprime))--
(x + d / sqrt(1 + yprime * yprime), y + d * yprime / sqrt(1 + yprime * yprime));
		% sqrt(1 + yprime * yprime);
		pickup pencircle scaled 2pt;
		draw (x,y);
	endfor;
endfor;

c := 3.14;
def f(expr x) =
	unscale(
		mexp(-256 * (rescale(x) / 6)) * (c + sind(degrees(x)))
	)/2
enddef;

z3 = (-5, f(-5));

pickup pencircle scaled 1pt;
draw z3
	for x = -4 step 1 until 305:
		..(x,f(x))
	endfor withcolor (1,0,0);

endfig;

end
