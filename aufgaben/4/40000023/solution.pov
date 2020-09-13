//
// solution.pov -- solution to problem 40000022
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
//
#version 3.7;
#include "colors.inc"
#include "common.inc"
#include "functions.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.19;
#declare at = 0.01;

camera {
        location <-7.5, 2.8, -4>
        look_at <0.5, 0.3, 1.57-0.1>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <-10, 2, 3.4> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#declare bd = 1.5 * at;

#declare N = 50;
#declare M = 150;

//#declare sqr = function(X) { X * X }
#declare Xk = function(X, k) { pow(X, (k+1/2)*(k-1/2)) }

#declare f = function(X, Y) {
	(8 / (pi * pi)) * (
	  Xk(X,  1) * sin(   Y) / ( 1 *  1)
	- Xk(X,  3) * sin( 3*Y) / ( 3 *  3)
	+ Xk(X,  5) * sin( 5*Y) / ( 5 *  5)
	- Xk(X,  7) * sin( 7*Y) / ( 7 *  7)
	+ Xk(X,  9) * sin( 9*Y) / ( 9 *  9)
	- Xk(X, 11) * sin(11*Y) / (11 * 11)
	+ Xk(X, 13) * sin(13*Y) / (13 * 13)
	- Xk(X, 15) * sin(15*Y) / (15 * 15)
	+ Xk(X, 17) * sin(17*Y) / (17 * 17)
	- Xk(X, 19) * sin(19*Y) / (19 * 19)
	+ Xk(X, 21) * sin(21*Y) / (21 * 21)
	- Xk(X, 23) * sin(23*Y) / (23 * 23)
	)
}

#macro point(X, Y) 
	<X, f(X,Y), Y>
#end

union {
	sphere { <0,0,0>, bd }
	sphere { <0,0,pi>, bd }
	sphere { <1,0,0>, bd }
	sphere { <1,1,pi/2>, bd }
	sphere { <1,0,pi>, bd }
	cylinder { <0,0,0>, <0,0,pi>, bd }
	cylinder { <0,0,0>, <1,0,0>, bd }
	cylinder { <0,0,pi>, <1,0,pi>, bd }
	cylinder { <1,0,0>, <1,1,pi/2>, bd }
	cylinder { <1,1,pi/2>, <1,0,pi>, bd }
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}

mesh {
	#declare X = 0.0001;
	#declare Xstep = 1 / N;
	#declare Ystep = pi/M;
	#while (X < 1 - Xstep/2)
		#declare Y = 0;
		#while (Y < pi - Ystep/2)
			triangle {
				point(X        , Y        ),
				point(X + Xstep, Y        ),
				point(X + Xstep, Y + Ystep)
			}
			triangle {
				point(X        , Y        ),
				point(X + Xstep, Y + Ystep),
				point(X        , Y + Ystep)
			}
			#declare Y = Y + Ystep;
		#end
		#declare X = X + Xstep;
	#end
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow( <-0.1,0,0>, <1.3,0,0>, at, White )
arrow( <0,-0.1,0>, <0,1.1,0>, at, White )
arrow( <0,0,-0.1>, <0,0,3.3>, at, White )
