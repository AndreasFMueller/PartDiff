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

numeric u;
u = 140;

z0 = (   0    ,    0    );
z1 = (-0.1 * u,    0    );
z2 = ( 1.8 * u,    0    );
z3 = (   0    , -0.3 * u);
z4 = (   0    ,  1.2 * u);

z5 = (-0.1 * u, -0.3 * u);
z6 = ( 1.8 * u, -0.3 * u);
z7 = ( 1.8 * u,  1.2 * u);
z8 = (-0.1 * u,  1.2 * u);

vardef xypoint(expr s, t) =
	(s * t * u, 0.5 * (t * t - s * s) * u)
enddef;

vardef tcurve(expr x, t) =
	(0.5 * (-(x / t) * (x / t) + t * t))
enddef;
vardef tpoint(expr x, t) =
	(x * u, tcurve(x, t) * u)
enddef;

vardef scurve(expr x, s) =
	(0.5 * (-s * s + (x / s) * (x / s)))
enddef;
vardef spoint(expr x, s) =
	(x * u, scurve(x, s) * u)
enddef;

path tupper, tlower, supper, slower;

path p;
def drawtcurve(expr t, smin, smax) =
	numeric ds;
	ds := 1 / 100;
	p := xypoint(smin, t);
	for s = smin + ds step ds until smax:
		p := p--xypoint(s, t);
	endfor
	p := p--xypoint(smax, t);
enddef;
def drawscurve(expr s, tmin, tmax) =
	numeric dt;
	dt := 1 / 100;
	p := xypoint(s, tmin);
	for t = tmin + dt step dt until tmax:
		p := p--xypoint(s, t);
	endfor
	p := p--xypoint(s, tmax);
enddef;


drawtcurve(1, 0, 1.5);
tlower := p;
drawtcurve(sqrt(2), 0, 1.5);
tupper := p;
drawscurve(0.5, 0, 1.5);
supper := p;
drawscurve(1, 0, 1.5);
slower := p;

z10 = tlower intersectionpoint slower;
z11 = tupper intersectionpoint slower;
z12 = tupper intersectionpoint supper;
z13 = tlower intersectionpoint supper;

path	boundary;
boundary :=
	((tlower cutafter z10) cutbefore z13)
	--((slower cutbefore z10) cutafter z11)
	--(reverse ((tupper cutafter z11) cutbefore z12))
	--(reverse ((supper cutbefore z13) cutafter z12))--cycle;
fill boundary withcolor 0.9;

pickup pencircle scaled 0.5pt;
for t = 0.1 step 0.1 until 2.05:
	drawtcurve(t, -2, 2);
	draw p withcolor (1,0.8,0.8);
endfor;
for s = 0.1 step 0.1 until 1.55:
	drawscurve(s, -2, 2);
	draw p withcolor (0.8,1,0.8);
endfor;

pickup pencircle scaled 1.5pt;
draw boundary;
pickup pencircle scaled 3pt;
draw z10;
draw z11;
draw z12;
draw z13;

clip currentpicture to z5--z6--z7--z8--cycle;

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));
label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

label(btex $\Omega$ etex, xypoint(0.75, 1.2));

def tlabel(expr s, t, l, c) =
	label(TEX("$t=" & l & "$"), (0,0)) rotated (angle (t,-s))
		shifted xypoint(s, t) withcolor c;
enddef;
def slabel(expr s, t, l, c) =
	label(TEX("$s=" & l & "$"), (0,0)) rotated (angle (s,t))
		shifted xypoint(s, t) withcolor c;
enddef;

tlabel(0.2, 0.9, "0.9", red);
tlabel(0.2, 1.0, "1.0", red);
tlabel(0.2, 1.1, "1.1", red);
tlabel(0.2, 1.2, "1.2", red);
tlabel(0.2, 1.3, "1.3", red);
tlabel(0.2, 1.4, "1.4", red);
tlabel(0.2, 1.5, "1.5", red);

slabel(0.4, 1.55, "0.4", green);
slabel(0.5, 1.55, "0.5", green);
slabel(0.6, 1.55, "0.6", green);
slabel(0.7, 1.55, "0.7", green);
slabel(0.8, 1.55, "0.8", green);
slabel(0.9, 1.55, "0.9", green);
slabel(1.0, 1.55, "1.0", green);
slabel(1.1, 1.55, "1.1", green);

label.top(btex $t=\sqrt{2}$ etex, (0,0)) rotated (angle (sqrt(2),-0.75))
		shifted xypoint(0.75, sqrt(2));
label.bot(btex $t=1$ etex, (0,0)) rotated (angle (1,-0.75))
		shifted xypoint(0.75, 1);
label.top(btex $s=\frac12$ etex, (0,0)) rotated (angle (0.5,1.2))
                shifted xypoint(0.5, 1.2);
label.bot(btex $s=1$ etex, (0,0)) rotated (angle (1,1.2))
                shifted xypoint(1, 1.2);

endfig;

end
