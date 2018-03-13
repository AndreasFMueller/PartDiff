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
pickup pencircle scaled 0.5pt;
draw (-140,0)--(140,0);
draw (-140,5)--(-140,-5);
draw (140,5)--(140,-5);
label.llft(btex $0$ etex, (-140,0));
label.lrt(btex $l$ etex, (140,0));

draw (-20,-2)--(-20,10);
draw (20,-2)--(20,7);
label.bot(btex $x\mathstrut$ etex, (-20,0));
label.bot(btex $x\mathstrut+\Delta x$ etex, (20,0));

pickup pencircle scaled 1pt;
draw (-140,0)..(-40,-2)..(-20,10){dir20}..{dir340}(20,7)..(60,-4)..(140,0);

pickup pencircle scaled 2pt;
draw (-20,10){dir20}..{dir340}(20,7);

pickup pencircle scaled 0.5pt;
draw (20,7)--(40,7);
drawarrow (20,7){dir340}--(40,-0.28);
draw (40,7)--(40,-0.28);
label.ulft(btex $-F\frac{\partial u}{\partial x}(x)$ etex, (-47,5));

draw (-40,10)--(-20,10);
draw (-40,2.72)--(-40,10);
drawarrow (-20,10)--(-40,2.72);
label.urt(btex $F\frac{\partial u}{\partial x}(x+\Delta x)$ etex, (47,5));

pickup pencircle scaled 0.3pt;
draw (40,3)--(49,13);
draw (-40,6)--(-49,13);

label.top(btex $\mu\Delta x$ etex, (0,12));

endfig;

beginfig(2)
pickup pencircle scaled 0.5pt;
draw (-140,0)--(140,0);
draw (-140,5)--(-140,-5);
draw (140,5)--(140,-5);
label.llft(btex $0$ etex, (-140,0));
label.lrt(btex $l$ etex, (140,0));

pickup pencircle scaled 1pt;
draw (-140,0)..(-40,-2)..(-20,10){dir20}..{dir340}(20,7)..(60,-4)..(140,0);

label.top(btex $u(x, t)$ etex, (0,12));

endfig;

beginfig(3)
pickup pencircle scaled 0.5pt;
draw (-140,0)--(140,0);
draw (-140,5)--(-140,-5);
draw (140,5)--(140,-5);
label.llft(btex $0$ etex, (-140,0));
label.lrt(btex $l$ etex, (140,0));

pickup pencircle scaled 1pt;
draw (-140,0)..(-40,-2)..(-20,10){dir20}..{dir340}(20,7)..(60,-4)..(140,0);

endfig;

end
