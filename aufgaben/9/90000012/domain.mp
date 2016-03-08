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

z0 = (0 * u, 0 * u);
z1 = (4 * u, 0 * u);
z2 = (4 * u, 4 * u);
z3 = (0 * u, 4 * u);

path p;

def characteristic(expr c, orientation) =
	p := (0, c * u);
	for t = 0.01 step 0.01 until 4:
		p := p--(u * t, u * (orientation * 0.5 * t * t + c));
	endfor;
enddef;

path linkerrand, rechterrand;
characteristic(-4.5,  1); rechterrand := p;
characteristic( 2, -1); linkerrand := p;

path boundary;
boundary = (linkerrand)
--(rechterrand)
--(4.0*u,4.1*u)
--(0,4.1*u)--cycle;
fill boundary withcolor (0.9,0.9,1);

for yzero = -16 step 0.5 until 16:
	characteristic(yzero,  1);
	draw p withcolor red;
	characteristic(yzero, -1);
	draw p withcolor green;
endfor;
%characteristic( 5, 4,  1); draw p withcolor red;
%characteristic(-1, 4, -1); draw p withcolor green;
%characteristic( 5, 5,  1); draw p withcolor red;
%characteristic( 6, 5,  1); draw p withcolor red;
%characteristic( 7, 5,  1); draw p withcolor red;
%characteristic(-1, 5, -1); draw p withcolor green;
%characteristic(-2, 5, -1); draw p withcolor green;
%characteristic(-3, 5, -1); draw p withcolor green;

pickup pencircle scaled 1.5pt;
draw rechterrand withcolor red;
draw linkerrand withcolor green;

path omega;
omega = z0--(z1 shifted (5,0))--(z2 shifted (5,5))--(z3 shifted (0,5))--cycle;

clip currentpicture to omega;

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z3 shifted (0,10));

label.urt(btex $x$ etex, z1 shifted (10,0));
label.ulft(btex $y$ etex, z3 shifted (0,10));

label.llft(btex $0$ etex, (0,0));

label(btex $\Omega$ etex, (2 * u, 2 * u));


pickup pencircle scaled 1pt;
draw ( 50,-3)--( 50,3); label.bot(btex $1$ etex, ( 50,-3));
draw (100,-3)--(100,3); label.bot(btex $2$ etex, (100,-3));
draw (150,-3)--(150,3); label.bot(btex $3$ etex, (150,-3));
draw (200,-3)--(200,3); label.bot(btex $4$ etex, (200,-3));
draw (-3, 50)--(3, 50); label.lft(btex $1$ etex, (-3, 50));
draw (-3,100)--(3,100); label.lft(btex $2$ etex, (-3,100));
draw (-3,150)--(3,150); label.lft(btex $3$ etex, (-3,150));
draw (-3,200)--(3,200); label.lft(btex $4$ etex, (-3,200));

pickup pencircle scaled 3pt;

path square;
square := (2,-5)--(14,-5)--(14,5)--(2,5)--cycle;

z11 = (u, u);
z12 = (3.5 * u, 1.5 * u);
z13 = (3.85 * u, 3.0 * u);

draw z11 withcolor blue;
fill square shifted z11 withcolor white;
label.rt(btex $P_1$ etex, z11);

draw z12 withcolor blue;
fill square shifted z12 withcolor white;
label.rt(btex $P_2$ etex, z12);

draw z13 withcolor blue;
fill square shifted z13 withcolor white;
label.rt(btex $P_3$ etex, z13);

endfig;

end
