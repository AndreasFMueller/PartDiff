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
% elliptische PDGL
%
beginfig(1)

numeric r;
r = 80;
path p;
p = (r, 0);
for a = 1 step 1 until 359:
	p := p..(r * cosd(a), r * sind(a));
endfor;
p := p..cycle;

fill p withcolor (1,0.95,0.95);

pickup pencircle scaled 1.5pt;
draw p withcolor red;

pickup pencircle scaled 3pt;

z10 = 0.6 * r * (cosd(240), sind(240));

draw z10 withcolor red;

pickup pencircle scaled 0.5pt;

label.urt(btex $x$ etex, z10);

label(btex $\Omega$ etex, (0,0));
label.urt(btex $\partial \Omega$ etex, r * (cosd(45), sind(45)));

endfig;

%
% Quasilineare PDGL erster Ordnung
%
beginfig(2)

pickup pencircle scaled 0.3pt;

z1 = 300 * (cosd(120), sind(120));

path q;

def charpoint(expr a) =
	((300 * cosd(a), 300 * sind(a)) shifted z1)
enddef;

q := charpoint(-90);
for a = -89 step 1 until -30:
	q := q..charpoint(a);
endfor;

p := (r, 0);
for a = 1 step 1 until 359:
	p := p..(r * (cosd(a),sind(a)));
endfor;
p := p..cycle;
fill p withcolor (0.95,0.95,0.95);

for s = -110 step 20 until 110:
	draw q shifted (s * cosd(120), s * sind(120)) withcolor blue;
endfor

clip currentpicture to (-1.1 * r,-1.1 * r)--(1.1 * r,-1.1 * r)--(1.1 * r,1.1 * r)--(-1.1 * r,1.1 * r)--cycle;

p := r * (cosd(120), sind(120));
for a = 121 step 1 until 300:
	p := p..(r * cosd(a), r * sind(a));
endfor;

pickup pencircle scaled 1.5pt;
draw p;

z2 = q intersectionpoint p;

p := r * (cosd(-60), sind(-60));
for a = -59 step 1 until 120:
	p := p..(r * cosd(a), r * sind(a));
endfor;

pickup pencircle scaled 0.5pt;
draw p;

label.urt(btex $x$ etex, (0,0));

pickup pencircle scaled 1.5pt;
draw subpath (15,30) of q withcolor red;

label.llft(btex $x_0$ etex, z2);

pickup pencircle scaled 3pt;
draw z2 withcolor red;


pickup pencircle scaled 3pt;
draw (0,0) withcolor red;

label(btex $\Omega$ etex, 0.7 * r * (cosd(50),sind(50)));

endfig;

%
% parabolisch
%
beginfig(3)

numeric u;
u = 17;

z0 = (-4 * u,9 * u);
z1 = (-4 * u,0 * u);
z2 = ( 4 * u,0 * u);
z3 = ( 4 * u,9 * u);

fill z0--z1--z2--z3--cycle withcolor (0.95,0.95,0.95);

label(btex $\Omega$ etex, (3 * u, 7 * u));

pickup pencircle scaled 1pt;

drawarrow ((-0.1)[z1,z2])--(1.1[z1,z2]);
label.top(btex $x$ etex, 1.1[z1,z2]);

draw z0--z1--z2--z3;

z4 = (-1 * u,3 * u);

fill (-4 * u,3 * u)--z1--z2--(4 * u,3 * u)--cycle withcolor (1,0.9,0.9);

pickup pencircle scaled 0.5pt;
drawarrow (0,-5)--(0,9.5 * u);
label.rt(btex $t$ etex, (0,9.5 * u));

pickup pencircle scaled 1.5pt;
draw (-4 * u,3 * u)--z1--z2--(4 * u,3 * u) withcolor red;

pickup pencircle scaled 3pt;
draw z4 withcolor red;
label.top(btex $x$ etex, z4);

endfig;

%
% hyperbolische PDGL
%
beginfig(4)

numeric u;
u = 17;

z0 = (-4 * u,9 * u);
z1 = (-4 * u,0 * u);
z2 = ( 4 * u,0 * u);
z3 = ( 4 * u,9 * u);

fill z0--z1--z2--z3--cycle withcolor (0.95,0.95,0.95);

label(btex $\Omega$ etex, (3 * u, 6.25 * u));

pickup pencircle scaled 0.5pt;

for h = -4*u step 2 * u until 13 * u:
	draw (-4*u,h-4*u+0.25*u)--(4*u,h+4*u+0.25*u) withcolor blue;
	draw (-4*u,h+4*u+0.25*u)--(4*u,h-4*u+0.25*u) withcolor blue;
endfor;
clip currentpicture to z0--z1--z2--z3--cycle;

pickup pencircle scaled 1pt;

drawarrow ((-0.1)[z1,z2])--(1.1[z1,z2]);
label.top(btex $x$ etex, 1.1[z1,z2]);

draw z0--z1--z2--z3;

z4 = (-2.5 * u,4 * u);

pickup pencircle scaled 0.5pt;
drawarrow (0,-5)--(0,9.5 * u);
label.rt(btex $t$ etex, (0,9.5 * u));

fill (-4 * u, 2.5 * u)--z1--(1.5 * u,0)--z4--cycle withcolor (1.0,0.95,0.95);

pickup pencircle scaled 1.5pt;
draw (-4 * u, 2.5 * u)--z1--(1.5 * u,0) withcolor red;
pickup pencircle scaled 0.5pt;
draw (-4 * u, 2.5 * u)--z4 withcolor red;
draw (1.5 * u,0)--z4 withcolor red;

pickup pencircle scaled 3pt;
draw z4 withcolor red;
label.top(btex $x$ etex, z4);

endfig;

end
