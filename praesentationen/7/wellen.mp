%
% wellen.mp -- visualisierung einer welle
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

input TEX;

TEXPRE("%&latex" & char(10) & "\documentclass{beamer}\begin{document}");
TEXPOST("\end{document}");

numeric u;
u := 100;

def f(expr c, x) =
	if abs(x - c) < 0.15:
		(u * x, u * 3 * sqrt((0.15 - (x - c)) * (0.15 + (x - c))))
	else:
		(u * x, 0)
	fi;
enddef;

path	p;

def welle(expr c) =
	p := f(c, 0);
	for t = 0.005 step 0.005 until 2:
		p := p--f(c, t);
	endfor;
	fill p--(2 * u,0)--(0,0)--cycle withcolor (1,0.9,0.9);
enddef;

numeric N;
N := 1;

def waveimage(expr n) =
beginfig(N)
	z0 = (0,0);
	z1 = (2 * u, 0);
	z2 = (0, 0.55 * u);
	numeric	c;
	c := n / 10.;
	welle(c);
	pickup pencircle scaled 1pt;
	drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
	drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));
	pickup pencircle scaled 1.5pt;
	draw p withcolor red;
	label.top(btex $x$ etex, z1 shifted (10,0));
	if (c > 0.05) and (c < 1.95):
		label.top(TEX("$t="&decimal(c)&"\mathstrut$"), 
			(c * u, 0.45 * u));
	fi;
endfig;
N := N + 1;
enddef;

for n = -1 step 1 until 21:
	waveimage(n);
endfor;

end
