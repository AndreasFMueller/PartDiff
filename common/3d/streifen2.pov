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

#declare imagescale = 1;

#declare ymax = pi;
#declare xmin = -2;
#declare xmax = 2;

camera {
        location <0.7, 1.5, 4.8>
        look_at <(xmin + xmax) / 2, -0.2, ymax / 2>
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

#declare streifenbreite = 0.5;

#declare xstep = 0.01;
#declare ystep = 0.01;

#macro f(yy)
	(1/a) * sin(a * yy)
#end

#macro kurve(yy)
	<0, -f(yy), yy>
#end

#macro u1(xx, yy)
	<xx, f(xx - yy), yy>
#end

#macro u2(xx, yy)
	<xx, -f(xx + yy), yy>
#end

#macro g(yy)
	cos(a * yy)
#end

#declare epsilon = 0.015;
#declare voffset = <0, epsilon, 0>;

#macro thicktriangle(p1, p2, p3)
	intersection {
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
		box { <xmin, -1, 0>, <xmax, 1, ymax> }
	}
#end
#macro tang(yy, s)
	thicktriangle(
		kurve(yy),
		kurve(yy) + <streifenbreite,
				0 * s * streifenbreite * g(yy),
				s * streifenbreite>,
		kurve(yy + ystep) + <streifenbreite,
				0 * s * streifenbreite * g(yy + ystep),
				s * streifenbreite>
	)
	thicktriangle(
		kurve(yy),
		kurve(yy + ystep) + <streifenbreite,
				0 * s * streifenbreite * g(yy + ystep),
				s * streifenbreite>,
		kurve(yy + ystep)
	)
	thicktriangle(
		kurve(yy) + <-streifenbreite,
				-0 * s * streifenbreite * g(yy),
				-s * streifenbreite>,
		kurve(yy),
		kurve(yy + ystep)
	)
	thicktriangle(
		kurve(yy) + <-streifenbreite,
				-0 * s * streifenbreite * g(yy),
				-s * streifenbreite>,
		kurve(yy + ystep),
		kurve(yy + ystep) + <-streifenbreite,
				-0 * s * streifenbreite * g(yy + ystep),
				-s * streifenbreite>
	)
#end

union {
	mesh {
#declare xx = xmin;
#while (xx < xmax - xstep / 2)
	#declare yy = 0;
	#while (yy < ymax - ystep/2)
		triangle {
			u1(xx, yy),
			u1(xx + xstep, yy),
			u1(xx + xstep, yy + ystep)
		}
		triangle {
			u1(xx, yy),
			u1(xx + xstep, yy + ystep),
			u1(xx, yy + ystep)
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

union {
	mesh {
#declare xx = xmax;
#while (xx > xmin + xstep / 2)
	#declare yy = 0;
	#while (yy < ymax - ystep/2)
		triangle {
			u2(xx, yy),
			u2(xx - xstep, yy),
			u2(xx - xstep, yy + ystep)
		}
		triangle {
			u2(xx, yy),
			u2(xx - xstep, yy + ystep),
			u2(xx, yy + ystep)
		}
		#declare yy = yy + ystep;
	#end
	#declare xx = xx - xstep;
#end
	}
	pigment {
		color rgbf<1,1,1.2,0.2>
	}
}

#declare kurvendurchmesser = 1.5 * achsendurchmesser;

union {
#declare yy = 0;
#while (yy < ymax - ystep / 2)
	sphere { kurve(yy), kurvendurchmesser }
	cylinder { kurve(yy), kurve(yy + ystep), kurvendurchmesser }
	#declare yy = yy + ystep;
#end
	sphere { kurve(ymax), kurvendurchmesser }
	pigment {
                color rgbf<0.9,0,0,0.0>
        }
}

#declare ystep = 0.01;

union {
#declare yy = -streifenbreite;
#while (yy < ymax + streifenbreite - ystep / 2)
	tang(yy, 1)
	#declare yy = yy + ystep;
#end
	pigment {
                color rgbf<0.8,0.9,0.3,0.>
        }
	finish {
                specular 1.1
                metallic
        }
}

union {
#declare yy = -streifenbreite;
#while (yy < ymax + streifenbreite - ystep / 2)
	tang(yy, -1)
	#declare yy = yy + ystep;
#end
	pigment {
		color rgbf<0.3,0.5,0.6,0.>
	}
	finish {
                specular 0.9
                metallic
        }
}



