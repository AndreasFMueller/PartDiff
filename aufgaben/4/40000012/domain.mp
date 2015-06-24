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
for a = 1 step 1 until 90:
	outer := outer..(z2 rotated a);
	inner := inner..(z1 rotated a);
endfor;

fill outer--(reverse inner)--cycle withcolor (0.9,0.9,0.9);
pickup pencircle scaled 1.5pt;
draw outer--(reverse inner)--cycle;

label(btex $\Omega$ etex, (0.5[z1,z2]) rotated 45);

pickup pencircle scaled 1pt;
draw outer--(reverse inner)--cycle;
drawarrow (z0 shifted (-5,0))--(z2 shifted(10,0));
label.top(btex $x$ etex, z2 shifted (10,0));
drawarrow (z0 shifted (0,-5))--(z3 shifted(0,10));
label.lft(btex $y$ etex, z3 shifted (0,10));

label.bot(btex $1$ etex, (u, -3));
label.lft(btex $1$ etex, (-3, u));
label.bot(btex $2$ etex, (2 * u, -3));
label.lft(btex $2$ etex, (-3, 2 * u));

endfig;

end
