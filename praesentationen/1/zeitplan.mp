%
% zeitplan.mp -- Zeitplan
%
% (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{beamer}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\usepackage{color}
\mode<beamer>{%
\usetheme[hideothersubsections,hidetitle]{Hannover}
}
\begin{document}
etex;

beginfig(1)

numeric u;
u := 2.5;

z0 = (0,0);

z1 = (100 * u, 0);
z2 = (0, 45 * u);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $t$ etex, z1 shifted (10,0));
label.rt(btex Aufnahmef\"ahigkeit etex, z2 shifted(0,10));

endfig;

beginfig(2)

numeric u;
u := 2.5;

z0 = (0,0);

z1 = (100 * u, 0);
z2 = (0, 45 * u);

pickup pencircle scaled 1.5pt;

fill (0,0)--(0,45*u)--(45*u,0)--cycle withcolor (0.9,0.9,0.9);
fill (55*u,0)--(55*u,45*u)--(100*u,0)--cycle withcolor (0.9,0.9,0.9);

draw (0,45 * u)--(45 * u, 0);
draw (55 * u, 0)--(55 * u, 45 * u)--(100 * u, 0);

label.bot(btex $45$ etex, (45 * u,0));
label.bot(btex $55$ etex, (55 * u,0));
label.bot(btex $100$ etex, (100 * u,0));

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $t$ etex, z1 shifted (10,0));
label.rt(btex Aufnahmef\"ahigkeit etex, z2 shifted(0,10));

endfig;

beginfig(3)

numeric u;
u := 2.5;

z0 = (0,0);

z1 = (100 * u, 0);
z2 = (0, 45 * u);

pickup pencircle scaled 1.5pt;

fill (0,0)--(0,45*u)--(45*u,0)--cycle withcolor (0.95,0.95,0.95);
fill (55*u,0)--(55*u,45*u)--(100*u,0)--cycle withcolor (0.95,0.95,0.95);

draw (0,45 * u)--(45 * u, 0) withcolor (0.9,0.9,0.9);
draw (55 * u, 0)--(55 * u, 45 * u)--(100 * u, 0) withcolor (0.9,0.9,0.9);

fill (0,0)--(0,45*u)--(30*u,15*u)--(30*u,0)--cycle withcolor (1,0.8,0.8);
fill (35*u,0)--(35*u,45*u)--(65*u,15*u)--(65*u,0)--cycle withcolor (1,0.8,0.8);
fill (70*u,0)--(70*u,45*u)--(100*u,15*u)--(100*u,0)--cycle withcolor (1,0.8,0.8);

draw (0,45*u)--(30*u,15*u)--(30*u,0) withcolor red;
draw (35*u,0)--(35*u,45*u)--(65*u,15*u)--(65*u,0) withcolor red;
draw (70*u,0)--(70*u,45*u)--(100*u,15*u)--(100*u,0) withcolor red;

label.bot(btex $30$ etex, (30 * u,0)) withcolor red;
label.bot(btex $35$ etex, (35 * u,0)) withcolor red;
label.bot(btex $65$ etex, (65 * u,0)) withcolor red;
label.bot(btex $70$ etex, (70 * u,0)) withcolor red;
label.bot(btex $100$ etex, (100 * u,0)) withcolor red;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

label.top(btex $t$ etex, z1 shifted (10,0));
label.rt(btex Aufnahmef\"ahigkeit etex, z2 shifted(0,10));

endfig;

end
