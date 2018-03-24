verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

input TEX;

TEXPRE("%&latex" & char(10) &
"\documentclass{book}" &
"\usepackage{times}" &
"\usepackage{amsmath}" &
"\usepackage{amssymb}" &
"\usepackage{amsfonts}" &
"\usepackage{txfonts}" &
"\begin{document}");
TEXPOST("\end{document}");

beginfig(1)
numeric pi;
pi := 3.14159;

numeric u;
u = 120;

numeric a;
a := 1;

def sin(expr x) =
	sind(x * (180 / pi))
enddef;

def cos(expr x) =
	cosd(x * (180 / pi))
enddef;

def	exp(expr x) =
	mexp(256 * x)
enddef;

def cosh(expr x) =
	((exp(x) + exp(-x)) / 2)
enddef;

def sinh(expr x) =
	((exp(x) - exp(-x)) / 2)
enddef;

vardef xypoint(expr mu, nu) =
	((a * cosh(mu) * cos(nu), a * sinh(mu) * sin(nu)) scaled u)
enddef;

pickup pencircle scaled 1pt;

z0 = (0,0);
z1 = xypoint(1, pi);
z2 = xypoint(1, 0);
%z3 = xypoint(1, 3 * pi / 2);
z3 = (0, -0.2 * u);
z4 = xypoint(1, pi / 2);

path border;
border := (z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)--(z1 shifted z4)--cycle;

numeric mumin, mumax;
mumin := 0;
mumax := 1;

numeric numin, numax;
numin := pi / 4;
numax := pi * 3 / 4;

numeric dnu, dmu;
dnu := 0.01;
dmu := 0.1;

def drawellipse(expr mu, nufrom, nuto, c) =
	path p;
	p := xypoint(mu, nufrom);
	for nu = nufrom + dnu step dnu until nuto:
		p := p--xypoint(mu, nu);
	endfor;
	p := p--xypoint(mu, nuto);
	draw p withcolor c;
enddef;

def drawhyperbola(expr nu, mufrom, muto, c) =
	path p;
	p := xypoint(mufrom, nu);
	for mu = mufrom + dmu step dmu until muto:
		p := p--xypoint(mu, nu);
	endfor;
	p := p--xypoint(muto,nu);
	draw p withcolor c;
enddef;

path domainpath;
drawhyperbola(pi / 4, 0.5, 1, white);
domainpath := p;
drawellipse(1, pi/4, 5 * pi/8, white);
domainpath := domainpath--p;
drawhyperbola(5 * pi/8, 0.5, 1, white);
domainpath := domainpath--(reverse p);
drawellipse(0.5, pi/4, 5 * pi/8, white);
domainpath := domainpath--(reverse p)--cycle;
fill domainpath withcolor 0.9;

color hellrot;
hellrot := (1,0.75,0.75);
for mu = 0 step 0.1 until 1.8:
	drawellipse(mu, 0, 2 * pi, hellrot);
endfor;

color hellblau;
hellblau := (0.75,0.75,1);
for angle = 0 step pi / 16 until 2 * pi:
	drawhyperbola(angle, 0, 1.8, hellblau);
endfor;

clip currentpicture to border;

drawhyperbola(pi / 4, 0.5, 1, blue);
drawhyperbola(5 * pi / 8, 0.5, 1, blue);
drawellipse(0.5, pi/4, 5 * pi/8, red);
drawellipse(1, pi/4, 5 * pi/8, red);

label(btex $\Omega$ etex, xypoint(0.75, 7 * pi / 16));

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.lft(btex $\mu = 0.5$ etex, z0) shifted (-5,0) rotated 17
	shifted xypoint(0.5, 5 * pi /8) withcolor red;
%label.lft(btex $\mu = 0.6$ etex, z0) shifted (-5,0) rotated 20
%	shifted xypoint(0.6, 5 * pi /8) withcolor red;
%label.lft(btex $\mu = 0.7$ etex, z0) shifted (-5,0) rotated 20
%	shifted xypoint(0.7, 5 * pi /8) withcolor red;
%label.lft(btex $\mu = 0.8$ etex, z0) shifted (-5,0) rotated 20
%	shifted xypoint(0.8, 5 * pi /8) withcolor red;
%label.lft(btex $\mu = 0.9$ etex, z0) shifted (-5,0) rotated 20
%	shifted xypoint(0.9, 5 * pi /8) withcolor red;
label.lft(btex $\mu = 1.0$ etex, z0) shifted (-5,0) rotated 24
	shifted xypoint(1.0, 5 * pi /8) withcolor red;

label.lft(btex $\nu = \frac{5\pi}{8}$ etex, z0) shifted (-5, 0) rotated 96
	shifted xypoint(0.5, 10 * pi / 16) withcolor blue;
%label.rt(btex $\nu = \frac{9\pi}{16}$ etex, z0) shifted (5, 0) rotated -90
%	shifted xypoint(0.5, 9 * pi / 16) withcolor blue;
%label.rt(btex $\nu = \frac{8\pi}{16}$ etex, z0) shifted (5, 0) rotated -90
%	shifted xypoint(0.5, 8 * pi / 16) withcolor blue;
%label.rt(btex $\nu = \frac{7\pi}{16}$ etex, z0) shifted (5, 0) rotated -90
%	shifted xypoint(0.5, 7 * pi / 16) withcolor blue;
%label.rt(btex $\nu = \frac{6\pi}{16}$ etex, z0) shifted (5, 0) rotated -90
%	shifted xypoint(0.5, 6 * pi / 16) withcolor blue;
%label.rt(btex $\nu = \frac{5\pi}{16}$ etex, z0) shifted (5, 0) rotated -90
%	shifted xypoint(0.5, 5 * pi / 16) withcolor blue;
label.lft(btex $\nu = \frac{2\pi}{8}$ etex, z0) shifted (-5, 0) rotated 73
	shifted xypoint(0.5, 4 * pi / 16) withcolor blue;

label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$  etex, z4 shifted (0, 10));

endfig;

end
