#include "colors.inc"

#declare skalierung = 0.35;
#declare axisthickness = 0.008;

camera { 
        location <-3.8, 1.8, -1.2>
        look_at <1 / 2, 1/2, 1 / 2>
        right 16/9 * x * skalierung
        up y * skalierung
}

light_source { <-8, 8, -5> color White }
/* light_source { <1, 8,  4> color White } */
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}


#declare d = 0.005;

union {
	cylinder { <0,0,0>, <0,0,1.1>, axisthickness }
	cone { <0,0,1.1>, 2*axisthickness, <0,0,1.2> 0 }
	cylinder { <0,0,0>, <1.1,0,0>, axisthickness }
	cone { <1.1,0,0>, 2*axisthickness, <1.2,0,0> 0 }
	cylinder { <0,0,0>, <0,1.1,0>, axisthickness }
	cone { <0,1.1,0>, 2*axisthickness, <0,1.2,0>, 0 }
	sphere { <0,0,0>, axisthickness }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#macro surfacepoint(xx, yy)
	<xx, yy + (xx - yy) * (xx - yy), yy>
#end

#declare nsteps = 50;
#declare xmax = 1;
#declare xstep = xmax / nsteps;
#declare ymax = 1;
#declare ystep = ymax / nsteps;

mesh {
	triangle { <0,0,0>, <1,1,1>, <0,1,1> }
#declare yy = 0;
#while (yy < ymax - ystep / 2)

#declare xx = yy;
#while (xx < xmax - xstep / 2)
	triangle {
		surfacepoint(xx,         yy        ),
		surfacepoint(xx + xstep, yy        ),
		surfacepoint(xx + xstep, yy + ystep)
	}
#declare xx = xx + xstep;
#end

#declare xx = yy + xstep;
#while (xx < xmax - xstep / 2)
	triangle {
		surfacepoint(xx,         yy        ),
		surfacepoint(xx + xstep, yy + ystep),
		surfacepoint(xx        , yy + ystep)
	}
#declare xx = xx + xstep;
#end

#declare yy = yy + ystep;
#end
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

#declare schritte = 10;
#declare xstep = xmax / schritte;
#declare ystep = ymax / schritte;

union {

#declare xx = 0;
#while (xx < xmax - xstep / 2)
	cylinder { <xx, xx * xx, 0>, <1, xx * xx + 1 - xx, 1 - xx>, d }
	sphere { <xx, xx * xx, 0>, d }
	sphere { <1, xx * xx + (1- xx), 1 - xx>, d }
#declare xx = xx + xstep;
#end
#declare yy = ystep;
#while (yy < ymax - ystep / 2)
	cylinder { <0, yy, yy>, <1 - yy, 1, 1>, d }
	sphere { <0, yy, yy>, d }
	sphere { <1 - yy, 1, 1>, d }

#declare yy = yy + ystep;
#end

        pigment { color rgb <1,1,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

/*
#declare schritte = 40;
#declare dx = 7 / schritte;
#declare dy = 9 / schritte;

#macro domainquad(xx)
	triangle {
		<xx     , -0.01, 0>,
		<xx + dx, -0.01, 0>,
		<xx     , -0.01, log(xx)>
	}
	triangle {
		<xx + dx, -0.01, 0>,
		<xx + dx, -0.01, log(xx + dx)>,
		<xx     , -0.01, log(xx)>
	}
#end

#declare xx = 1;
object {
mesh {
#while (xx < 7 - dx/2)
	domainquad(xx)
#declare xx = xx + dx;
#end
}
        pigment { color rgb <1,1,1> }
        finish {
                specular 0.9
                metallic
        }
}

        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
*/


