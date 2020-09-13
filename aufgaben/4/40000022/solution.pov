//
// solution.pov -- solution to problem 40000022
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
//
#version 3.7;
#include "colors.inc"
#include "common.inc"

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

#declare N = 30;
#declare M = 90;

#macro point(X, Y) 
	<X, exp(2.5*log(X)) *sin(2*Y), Y>
#end

union {
	sphere { <0,0,0>, bd }
	sphere { <1,0,0>, bd }
	sphere { <0,0,pi>, bd }
	sphere { <1,0,pi>, bd }
	cylinder { <0,0,0>, <0,0,pi>, bd }
	cylinder { <0,0,0>, <1,0,0>, bd }
	cylinder { <0,0,pi>, <1,0,pi>, bd }
	#declare Y = 0;
	#declare Ystep = pi / M;
	#while (Y < pi - Ystep/2)
		sphere { point(1, Y), bd }
		cylinder { point(1, Y), point(1, Y+Ystep), bd }
		#declare Y = Y + Ystep;
	#end
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
