//
// solution.pov -- solution to problem 30000021
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
//
#version 3.7;
#include "colors.inc"
#include "common.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.074;
#declare at = 0.03;

camera {
        location <10, 16, 100>
        look_at <-0.3, 0, 0>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <10,  10, 1.4> color White
        area_light <0.3,0,-0.3> <0.3,0.3,0.3>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#declare bd = 1.5 * at;

#declare L = 6;

#declare N = 50;
#declare M = 50;

#declare pow3 = function(Z) { Z * Z * Z }
#declare quadrat = function(Z) { Z * Z }
#declare cbrt = function(Z) { pow(abs(Z), 1/3) * select(Z, -1, 0, 1) }

#macro point(X, Y) 
	<X, pow((X+Y)/2 + pow3(sin((X-Y)/2)), 1/3), Y>
#end

#macro other(X0, T)
	<X0-T, cbrt(T + pow3(sin(X0))) , -X0-T>
#end

union {
	cylinder { <-L,0,L>, <L,0,-L>, 0.52*bd }
	sphere { <-L,0,L>, 0.52*bd }
	sphere { <L,0,-L>, 0.52*bd }
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}

union {
	#declare r = bd;
	#declare T = 0;
	#declare Tstep = 1/2;
	#while (T < L - Tstep/2)
		#declare X0 = -L + T;
		#declare X0step = 1 / N;
		#while (X0 < L - T - X0step/2)
			sphere { other(X0,T), r }
			cylinder { other(X0, T), other(X0+X0step, T), r }
			#declare X0 = X0 + X0step;
		#end
		sphere { other(X0,T), r }
		cylinder { <-L, 0, L-T>, <L-T, 0, -L>, 0.5 * bd }
		#declare T = T + Tstep;
		#declare r = 0.5 * bd;
	#end
	pigment {
		color rgb<0,0.6,0>
	}
	finish {
		specular 0.9
		metallic
	}
}


#declare X0step = pi / 8;
#declare Tstep = 1 / N;
intersection {
	box { <-L,-1,-L>, <L, 4, L> }
	union {
		#declare X0 = -1.875 * pi;
		#while (X0 < 1.875 * pi + X0step/2)
			#declare T = 0;
			#declare Tlimit = L - abs(X0) - Tstep/2;
			#while (T < Tlimit)
				sphere { other(X0, T), 0.5 * bd }
				cylinder { other(X0, T),
					other(X0, T+Tstep),
					0.5 * bd }
				#declare T = T + Tstep;
			#end
			sphere { other(X0, T), 0.5 * bd }
			#declare X0 = X0 + X0step;
			cylinder { <X0,0,-X0>, <X0-(L-abs(X0)), 0, -X0-(L-abs(X0))>, 0.5 * bd }
		#end
	}
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}

intersection {
	mesh {
		#declare X0 = -L;
		#declare X0step = 1 / N;
		#declare Tstep = 1 / M;
		#while (X0 < 2*L - X0step/2)
			#declare Tlimit = 2*L-Tstep/2;
			#declare Y0 = -X0;
			#declare T = 0;
			#while (T < Tlimit)
				triangle {
					other(X0         , T        ),
					other(X0 + X0step, T        ),
					other(X0 + X0step, T + Tstep)
				}
				triangle {
					other(X0         , T        ),
					other(X0 + X0step, T + Tstep),
					other(X0         , T + Tstep)
				}
				#declare T = T + Tstep;
			#end
			#declare X0 = X0 + X0step;
		#end
	}
	plane { <1,0,1>, 0 }
	box { <-L,-1,-L>, <L, 4, L> }
	pigment {
		color rgbt<0.6,0.9,1,0.2>
	}
	finish {
		specular 0.9
		metallic
	}
}

arrow( <-8.1,0,0>, <L+0.3,0,0>, at, White )
arrow( <0,-0.1,0>, <0,3.1,0>, at, White )
arrow( <0,0,-8.1>, <0,0,L+0.3>, at, White )
