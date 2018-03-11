//
// streifen.pov -- visualisierung eines Streifens
//
// (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
global_settings {
	assumed_gamma 1
}

#declare imagescale = 1.3;

#declare ymax = 1;
#declare xmin = -2;
#declare xmax = 2;

camera {
        location <1.5, 1.0, 1.8>
        look_at <0.3, -0.35, -0.5>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source { <10, 10, 10> color White }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}

#declare achsenkopflaenge = 0.1;
#declare achsendurchmesser = 0.02;
#declare a = 2;

#macro achse(from, to)
#declare dirvector = to - from;
#declare dirvector = achsenkopflaenge * vnormalize(dirvector);
        cylinder {
                from - dirvector,
                to   + dirvector,
                achsendurchmesser
        }
        cone {
                to +     dirvector, 2 * achsendurchmesser,
                to + 2 * dirvector, 0
        }
#end

union {
	achse(<xmin,0,0>, <xmax,0,0>)
	achse(< 0,0,0>, <0,0,ymax>)
	achse(< 0,-1,0>, <0,1,0>)
	pigment {
                color White
        }
}

#declare sb = 0.23;

#declare xstep = 0.01;
#declare ystep = 0.01;
#declare links = 0.6;
#declare rechts = 0.4;

#macro f(yy)
	(1/a) * sin(a * yy)
#end

#macro fprime(yy)
	cos(a * yy)
#end

#macro uu(xx, yy)
	links * f(xx - yy) + rechts * f(xx + yy)
#end

#macro upoint(xx, yy)
	<xx, uu(xx, yy), yy>
#end

#macro p(xx, yy)
	(links * fprime(xx - yy) + rechts * fprime(xx + yy))
#end

#macro q(xx, yy)
	(-links * fprime(xx - yy) + rechts * fprime(xx + yy))
#end

#macro normale(xx, yy)
	<-p(xx, yy), 1, -q(xx, yy)>
#end

#declare epsilon = 0.005;

#macro thicktriangle(p1, p2, p3)
	mesh {
		triangle { p3 - voffset, p2 - voffset, p1 - voffset }

		triangle { p3 - voffset, p2 - voffset, p2 + voffset }
		triangle { p3 - voffset, p2 + voffset, p3 + voffset }

		triangle { p1 - voffset, p3 - voffset, p3 + voffset }
		triangle { p1 - voffset, p3 + voffset, p1 + voffset }

		triangle { p2 - voffset, p1 - voffset, p1 + voffset }
		triangle { p2 - voffset, p1 + voffset, p2 + voffset }

		triangle { p1 + voffset, p2 + voffset, p3 + voffset }
		inside_vector <0,1,0>
	}
#end

#macro tang(xx, yy)
	#declare voffset = normale(xx, yy) * epsilon;
	#declare pp = p(xx, yy);
	#declare qq = q(xx, yy);
	thicktriangle(
		upoint(xx, yy) + <-sb, -sb * pp - sb * qq, -sb>,
		upoint(xx, yy) + < sb,  sb * pp - sb * qq, -sb>,
		upoint(xx, yy) + < sb,  sb * pp + sb * qq,  sb>
	)
	thicktriangle(
		upoint(xx, yy) + <-sb, -sb * pp - sb * qq, -sb>,
		upoint(xx, yy) + < sb,  sb * pp + sb * qq,  sb>,
		upoint(xx, yy) + <-sb, -sb * pp + sb * qq,  sb>
	)
#end

union {
	mesh {
#declare xx = xmin;
#while (xx < xmax - xstep / 2)
	#declare yy = 0;
	#while (yy < ymax - ystep/2)
		triangle {
			upoint(xx, yy),
			upoint(xx + xstep, yy),
			upoint(xx + xstep, yy + ystep)
		}
		triangle {
			upoint(xx, yy),
			upoint(xx + xstep, yy + ystep),
			upoint(xx, yy + ystep)
		}
		#declare yy = yy + ystep;
	#end
	#declare xx = xx + xstep;
#end
	}
	pigment {
		color rgbf<1,1.2,1,0.2>
	}
}

#declare kurvendurchmesser = 1.5 * achsendurchmesser;

union {
#declare xx = xmin;
#while (xx < xmax - xstep / 2)
	sphere { upoint(xx, 0), kurvendurchmesser }
	cylinder { upoint(xx, 0), upoint(xx + xstep, 0), kurvendurchmesser }
	#declare xx = xx + xstep;
#end
	sphere { upoint(xmax, 0), kurvendurchmesser }
	pigment {
                color rgbf<0.9,0,0,0.0>
        }
}

#declare xstep = 0.3;

union {
#declare xx = xmin;
#while (xx < xmax + xstep / 2)
	tang(xx, 0)
	sphere { upoint(xx, 0), 1.5 * kurvendurchmesser }
	#declare xx = xx + xstep;
#end
	pigment {
                color rgbf<0.8,0.9,0.3,0.>
        }
	finish {
                specular 1.1
                metallic
        }
}




