beginfig(1)
verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;
pickup pencircle scaled 0.5pt;
draw (-5,0)--(215,0);
draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (0,-5)--(0,65);
draw (-3,50)--(3,50);

pickup pencircle scaled 1pt;
draw (0,0)--(50,0)--(100,50)--(150,0)--(200,0);

label.ulft(btex $u(0,x)$ etex, (-0,60));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));
label.bot(btex $x$ etex, (210,-3));
label.lft(btex $0$ etex, (-5,0));
label.lft(btex $\frac14$ etex, (-5,50));
label.bot(btex $t=0$ etex, (200,50));

endfig;

beginfig(2)

pickup pencircle scaled 0.5pt;
draw (-5,0)--(205,0);
draw (-5,200)--(205,200);
draw (0,-5)--(0,205);
draw (200,-5)--(200,205);

draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (-3,50)--(3,50);
draw (-3,100)--(3,100);
draw (-3,150)--(3,150);
draw (-3,200)--(3,200);

label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));

label.lft(btex $0$ etex, (-3,0));
label.lft(btex $\frac14$ etex, (-3,50));
label.lft(btex $\frac12$ etex, (-3,100));
label.lft(btex $\frac34$ etex, (-3,150));
label.lft(btex $1$ etex, (-3,200));

pickup pencircle scaled 1pt;
draw (0,0)--(0,200);
draw (10,0)--(10,200);
draw (20,0)--(20,200);
draw (30,0)--(30,200);
draw (40,0)--(40,200);
draw (50,0)--(50,200);
draw (60,0)--(70,200);
draw (70,0)--(90,200);
draw (80,0)--(110,200);
draw (90,0)--(130,200);
draw (100,0)--(150,200);
draw (110,0)--(150,200);
draw (120,0)--(150,200);
draw (130,0)--(150,200);
draw (140,0)--(150,200);
draw (150,0)--(150,200);
draw (160,0)--(160,200);
draw (170,0)--(170,200);
draw (180,0)--(180,200);
draw (190,0)--(190,200);
draw (200,0)--(200,200);

endfig;

beginfig(3)

pickup pencircle scaled 0.5pt;
draw (-5,0)--(215,0);
draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (0,-5)--(0,55);
draw (-3,50)--(3,50);

pickup pencircle scaled 1pt;
draw (0,0)--(50,0)--(112.5,50)--(150,0)--(200,0);

label.ulft(btex \phantom{$u(0,x)$} etex, (-0,50));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));
label.lft(btex $0$ etex, (-5,0));
label.lft(btex $\frac14$ etex, (-5,50));
label.bot(btex $t=\frac14$ etex, (200,50));

endfig;

beginfig(4)

pickup pencircle scaled 0.5pt;
draw (-5,0)--(215,0);
draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (0,-5)--(0,55);
draw (-3,50)--(3,50);

pickup pencircle scaled 1pt;
draw (0,0)--(50,0)--(125,50)--(150,0)--(200,0);

label.ulft(btex \phantom{$u(0,x)$} etex, (-0,50));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));
label.lft(btex $0$ etex, (-5,0));
label.lft(btex $\frac14$ etex, (-5,50));
label.bot(btex $t=\frac12$ etex, (200,50));

endfig;

beginfig(5)

pickup pencircle scaled 0.5pt;
draw (-5,0)--(215,0);
draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (0,-5)--(0,55);
draw (-3,50)--(3,50);

pickup pencircle scaled 1pt;
draw (0,0)--(50,0)--(137.5,50)--(150,0)--(200,0);

label.ulft(btex \phantom{$u(0,x)$} etex, (-0,50));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));
label.lft(btex $0$ etex, (-5,0));
label.lft(btex $\frac14$ etex, (-5,50));
label.bot(btex $t=\frac34$ etex, (200,50));

endfig;

beginfig(6)

pickup pencircle scaled 0.5pt;
draw (-5,0)--(215,0);
draw (50,-3)--(50,3);
draw (100,-3)--(100,3);
draw (150,-3)--(150,3);
draw (200,-3)--(200,3);
draw (0,-5)--(0,55);
draw (-3,50)--(3,50);

pickup pencircle scaled 1pt;
draw (0,0)--(50,0)--(150,50)--(150,0)--(200,0);

label.ulft(btex \phantom{$u(0,x)$} etex, (-0,50));
label.bot(btex $0$ etex, (0,-3));
label.bot(btex $\frac14$ etex, (50,-3));
label.bot(btex $\frac12$ etex, (100,-3));
label.bot(btex $\frac34$ etex, (150,-3));
label.bot(btex $1$ etex, (200,-3));
label.lft(btex $0$ etex, (-5,0));
label.lft(btex $\frac14$ etex, (-5,50));

label.bot(btex $t=1$ etex, (200,50));

endfig;

end
