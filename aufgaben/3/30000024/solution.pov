//
// solution.pov
//
// (c) 2020 Prof Dr Andreas Müller, OST Ostschweizer Fachhochschule
//
#version 3.7;
#include "colors.inc"
#include "common.inc"

#declare imagescale = 0.12;
#declare at = 0.03;

camera {
	location <-15, 32, -30>
	look_at <0.0, 0.0, -0.2>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-10, 20, 1.4> color White
	area_light <0.3,0,-0.3> <0.3,0.3,0.3>, 10, 10
	adaptive 1
	jitter
}

arrow( <-0.2,0,0>, <2.2,0,0>, at, White )
arrow( <0,0,-4.2>, <0,0,4.2>, at, White )
arrow( <0,-0.1,0>, <0,1.3,0>, at, White )

#declare N = 100;

union {
	#declare tmin = -4;
	#declare tmax =  4;
	#declare tstep = (tmax - tmin) / N;
	#declare T = tmin;
	#while (T < tmax - tstep/2)
		sphere { <pi/2, sin(T), T>, at }
		cylinder { <pi/2,sin(T),T>, <pi/2,sin(T+tstep),T+tstep>, at }
		#declare T = T + tstep;
	#end
	pigment {
		color Green
	}
	finish {
		metallic
		specular 0.9
	}
}

#macro U(X,Y)
	<X, sin(Y - log(sin(X))) * sin(X), Y>
#end

mesh {
	#declare xmin = 0.001;
	#declare xmax = pi/2;
	#declare xstep = (xmax - xmin)/N;
	#declare ymin = -4;
	#declare ymax = 4;
	#declare ystep = (ymax - ymin)/N;
	#declare X = xmax;
	#while (X > (xmin + xstep/2))
		#declare Y = ymin;
		#while (Y < ymax - ystep/2)
			triangle {
				U(X, Y),
				U(X + xstep, Y),
				U(X + xstep, Y + ystep)
			}
			triangle {
				U(X, Y),
				U(X + xstep, Y + ystep),
				U(X, Y + ystep)
			}
			#declare Y = Y + ystep;
		#end
		#declare X = X - xstep;
	#end

	pigment {
		color rgbt<0.6,0.9,1,0.2>
	}
	finish {
		metallic
		specular 0.9
	}
}

#declare gridat = at / 3;

union {
	#declare ystep = pi/12;
	#declare yi = -15;
	#while (yi <= 15)
		#declare Y = yi * ystep;
		#declare X = xmin;
		#while (X < xmax + xstep/2)
			sphere { U(X, Y), gridat }
			cylinder { U(X, Y), U(X+xstep, Y), gridat }
			#declare X = X + xstep;
		#end
		sphere { U(X, Y), gridat }
		#declare yi = yi + 1;
	#end

	#declare xstep = pi/12;
	#declare ystep = (ymax - ymin) / N;
	#declare xi = 1;
	#while (xi <= 5)
		#declare X = xstep * xi;
		#declare Y = ymin;
		#while (Y < ymax - ystep/2)
			sphere { U(X, Y), gridat }
			cylinder { U(X, Y), U(X, Y+ystep), gridat }
			#declare Y = Y + ystep;
		#end
		sphere { U(X, Y), gridat }
		#declare xi = xi + 1;
	#end
	pigment {
		color rgb<0.6,0.9,1>
	}
	finish {
		metallic
		specular 0.9
	}
}

#macro K(T, Y0)
	// ({3.14159*asin(\x)/180},{-ln(\x)+\ynull})
	U(asin(T), log(T) + Y0)
#end

#declare charat = 0.6 * at;

intersection{
	box { <0,-1.1,-4>, <2,1.1,4> }
	union {
		#declare yimin = -8;
		#declare yimax =  10;
		#declare ystep = pi / 6;
		#declare yi = yimin;
		#while (yi < yimax)
			#declare y0 = yi * ystep;
			#declare tmin = 0.001;
			#declare tmax = 1;
			#declare tstep = (tmax - tmin)/N;
			#declare T = tmin;
			#while (T < tmax - tstep/2)
				sphere { K(T, y0), charat }
				cylinder { K(T, y0), K(T+tstep, y0), charat }
				#declare T = T + tstep;
			#end
			#declare yi = yi + 1;
		#end

		pigment {
			color Red
		}
		finish {
			metallic
			specular 0.9
		}
	}

}
