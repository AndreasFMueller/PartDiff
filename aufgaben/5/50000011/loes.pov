#include "colors.inc"

#declare skalierung = 0.33;

#declare xmax = 4;
#declare tmax = 3;
#macro basecurve(xx)
	<xx, 0, 1-1/xx>
#end
#macro topcurve(xx)
	<xx, tmax - 1 + 1/xx, tmax>
#end

camera { 
        location <14, 2.8, -1.0>
        look_at <xmax/2, tmax/2 - 0.2, tmax/2>
        right 16/9 * x * skalierung
        up y * skalierung
}

light_source { <-5, 8, -5> color White }
/* light_source { <1, 8,  4> color White } */
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}

#declare d = 0.020;

union {
	cylinder { <0,0,0>, <0,0,tmax>, d }
	cone { <0,0,tmax>, 2*d, <0,0,tmax + 0.1> 0 }
	cylinder { <0,0,0>, <xmax,0,0>, d }
	cone { <xmax,0,0>, 2*d, <xmax + 0.1,0,0> 0 }
	cylinder { <0,0,0>, <0,tmax,0>, d }
	cone { <0,tmax,0>, 2*d, <0,tmax + 0.1,0>, 0 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare schritte = 400;
#declare dx = xmax / schritte;

#macro botquad(xx)
	triangle {
		<xx     , 0, 0>,
		<xx + dx, 0, 0>,
		basecurve(xx)
	}
	triangle {
		<xx + dx, 0, 0>,
		basecurve(xx + dx),
		basecurve(xx)
	}
#end
#macro topquad(xx)
	triangle {
		basecurve(xx),
		basecurve(xx + dx),
		topcurve(xx)
	}
	triangle {
		topcurve(xx),
		basecurve(xx + dx),
		topcurve(xx + dx)
	}
#end

#declare xx = 1;
object {
mesh {
#while (xx < xmax - dx/2)
	botquad(xx)
	topquad(xx)
#declare xx = xx + dx;
#end
}
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

#macro charpoint(xx, tt)
	<xx, tt, tt + 1 - 1/xx>
#end
#declare d2 = 0.7 * d;

union {
#declare tt = 0;
#declare tstep = 0.2;
#while (tt < tmax - (1 - 1/xmax))
#declare xx = 1;
#while (xx < xmax - dx/2)
	sphere { charpoint(xx, tt), d2 }
	cylinder { charpoint(xx, tt), charpoint(xx + dx, tt), d2 }
#declare xx = xx + dx;
#end
	sphere { charpoint(xx, tt), d2 }
#declare tt = tt + tstep;
#end
        pigment { color rgb <1,1,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

