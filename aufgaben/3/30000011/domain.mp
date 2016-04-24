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
u = 100;
numeric pi;
pi = 3.1415926535;

z0 = (         0,          0);
z1 = (u * pi / 2,          0);
z2 = (u * pi / 2, u * pi / 2);
z3 = (         0, u * pi / 2);

pickup pencircle scaled 1pt;

path boundary;
boundary := z0--z1--z2--z3--cycle;
path visible;
visible := (z0 shifted (0, -10))--(z1 shifted (0,-30))
		--(z2 shifted (0, 10))--(z3 shifted (0,10))--cycle;

fill boundary withcolor(0.9,0.9,0.9);

def charpath(expr x) =
	(x * u, 0)
	for y = 0.05 step 0.05 until 1.8:
		..((-cosd(180 * y / pi) + 1  + x) * u, y * u)
	endfor
enddef;

path undetermined;
undetermined := (0,0)--(0,1.8 * u)--(reverse (charpath(0)))--cycle;
fill undetermined withcolor (0.9,0.9,1);

clip currentpicture to boundary;

pickup pencircle scaled 1pt;
numeric c, v;
for y = -2 step 0.2 until 2:
	draw charpath(y) withcolor (1,0,0);
endfor;

clip currentpicture to visible;

label(btex $\Omega$ etex, 0.5[z0,z2]);

pickup pencircle scaled 1pt;
drawarrow (  0,-10)--(z3 shifted ( 0, 10));

label.urt( btex $x$ etex, (z1 shifted (10,  0)));
label.ulft(btex $y$ etex, (z3 shifted ( 0, 10)));
label.llft(btex $0$ etex, (0,0));

pickup pencircle scaled 1pt;
drawarrow (-10,  0)--(z1 shifted (10,  0));

pickup pencircle scaled 0.1pt yscaled 20pt;
draw z0--z1 withcolor green;

pickup pencircle scaled 1pt;
draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z3 shifted (-2,0))--(z3 shifted (2,0));
label.bot(btex $\frac{\pi}2$ etex, z1 shifted (0,-2));
label.lft(btex $\frac{\pi}2$ etex, z3 shifted (-2,0));

endfig;

end
