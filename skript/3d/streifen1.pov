//
// streifen.pov -- visualisierung eines Streifens
//
// (c) 2017 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#include "colors.inc"

#declare imagescale = 0.6;

#declare ymax = 2.3;
#declare xmin = -1;
#declare xmax = 2;

camera {
        location <3.3, 1.1, 4.2>
        look_at <(xmin + xmax) / 2, 0, ymax / 2>
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
#declare a = 5;

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

#declare streifenbreite = 0.2;

#declare xstep = 0.05;
#declare ystep = 0.05;

#macro u1(xx, yy)
	<xx, (1/a) * sin(a * (xx - yy)), yy>
#end

#macro u2(xx, yy)
	<xx, (xx - yy) / (1 + (xx - yy) * (xx - yy)), yy>
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
		color rgbf<1,1.2,1,0.3>
	}
}

union {
	mesh {
#declare xx = xmin;
#while (xx < xmax - xstep / 2)
	#declare yy = 0;
	#while (yy < ymax - ystep/2)
		triangle {
			u2(xx, yy),
			u2(xx + xstep, yy),
			u2(xx + xstep, yy + ystep)
		}
		triangle {
			u2(xx, yy),
			u2(xx + xstep, yy + ystep),
			u2(xx, yy + ystep)
		}
		#declare yy = yy + ystep;
	#end
	#declare xx = xx + xstep;
#end
	}
	pigment {
		color rgbf<1,1,1.2,0.3>
	}
}

union {
	cylinder {
		<0, 0, 0>, <2, 0, 2>, achsendurchmesser
	}
	sphere { <0, 0, 0>, achsendurchmesser }
	sphere { <2, 0, 2>, achsendurchmesser }
	mesh {
		triangle {
			<streifenbreite, streifenbreite, 0>,
			<2, streifenbreite, 2 - streifenbreite>,
			<2, -streifenbreite, 2 + streifenbreite>
		}
		triangle {
			<-streifenbreite, -streifenbreite, 0>,
			<streifenbreite, streifenbreite, 0>,
			<2, -streifenbreite, 2 + streifenbreite>
		}
	}
	pigment {
                color rgbf<0.9,0,0,0.8>
        }
}


