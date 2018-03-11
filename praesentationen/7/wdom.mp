%
% wdom.mp -- visualisierung einer welle
%
% (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
%

verbatimtex
\documentclass{beamer}
\mode<beamer>{%
\usetheme[hideothersubsections,hidetitle]{Hannover}
}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\begin{document}
etex;

numeric u;
u := 100;

numeric deltax;
deltax := 0.01;

def f(expr x) =
	if (abs(x-0.5) < 0.15):
		(3 * sqrt(0.15 * 0.15 - (x-0.5) * (x-0.5)))
	else:
		0
	fi;
enddef;

numeric amp;
amp := 6.666;
amp := 10;

def area(expr x) =
	numeric fa, fb;
	fa := 0;
	if (abs(x-0.5) < 0.15):
		fa := (amp * sqrt(0.15 * 0.15 - (x-0.5) * (x-0.5)));
	fi;
	fb := 0;
	if (abs(x+deltax-0.5) < 0.15):
		fa := (amp * sqrt(0.15 * 0.15 - (x+deltax-0.5) * (x+deltax-0.5)));
	fi;
	numeric	v;
	v := 1 - (fa + fb) / 2;
	path p;
	p := (x-1, -1)--(x+deltax*1.1-1, -1)--(x+deltax*1.1+2, 2)--(x+2,2)--cycle;
	fill (p scaled u) withcolor (1, v, v);
enddef;

beginfig(1)

z0 = (0,0);
z1 = (2*u,0);
z2 = (0,2*u);

for x = 0.25 step deltax until 0.75:
	area(x);
endfor;

clip currentpicture to (z0 shifted (-5,-5))--(z1 shifted (5,-5))
	--(z1 shifted z2 shifted (5,5))--(z2 shifted (-5,5))--cycle;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $t$ etex, z2 shifted (0,10));

endfig;

end
