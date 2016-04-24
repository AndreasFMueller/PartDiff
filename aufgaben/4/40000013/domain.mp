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

z0 = (0,0);
z1 = (1 * u, 0 * u);
z2 = (2 * u, 0 * u);
z3 = (0 * u, 2 * u);
z4 = (0 * u, 1 * u);

path outer;
path inner;
outer := z2;
inner := z1;
for a = 1 step 1 until 60:
	outer := outer..(z2 rotated a);
	inner := inner..(z1 rotated a);
endfor;

fill outer--(reverse inner)--cycle withcolor (0.9,0.9,0.9);
pickup pencircle scaled 1.5pt;
draw outer--(reverse inner)--cycle;

pickup pencircle scaled 0.2pt;
draw z1 rotated 30
for a = 31 step 1 until 90:
	--(z1 rotated a)
endfor;
draw z2 rotated 30
for a = 31 step 1 until 90:
	--(z2 rotated a)
endfor;

label(btex $\Omega$ etex, (0.5[z1,z2]) rotated 30);

path ang;
ang := z0--(z1 scaled 0.3);
for a = 1 step 1 until 60:
	ang := ang--(z1 scaled 0.3 rotated a);
endfor;
ang := ang--cycle;
fill ang withcolor 0.95;

z5 = (z2 rotated 60);
draw z0--(1.1[z0,z5]);

pickup pencircle scaled 1pt;
draw outer--(reverse inner)--cycle;
drawarrow (z0 shifted (-5,0))--(z2 shifted(10,0));
label.top(btex $x$ etex, z2 shifted (10,0));
drawarrow (z0 shifted (0,-5))--(z3 shifted(0,10));
label.lft(btex $y$ etex, z3 shifted (0,10));

label(btex $60^\circ$ etex, z1 scaled 0.2 rotated 30);

label.bot(btex $1$ etex, (u, -3));
label.lft(btex $1$ etex, (-3, u));
label.bot(btex $2$ etex, (2 * u, -3));
label.lft(btex $2$ etex, (-3, 2 * u));

endfig;

end
