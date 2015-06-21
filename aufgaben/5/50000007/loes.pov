#include "colors.inc"

#declare skalierung = 0.8;
#declare axisthickness = 0.008;

camera { 
        location < 2.8, 1.8, -3.2>
        look_at <2 / 2, 2/2, 2 / 2>
        right 16/9 * x * skalierung
        up y * skalierung
}

light_source { <-3, 8, -5> color White }
/* light_source { <1, 8,  4> color White } */
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}


#declare d = 0.005;

union {
	cylinder { <0,0,0>, <0,0,2.1>, axisthickness }
	cone { <0,0,2.1>, 2*axisthickness, <0,0,2.2> 0 }
	cylinder { <0,0,0>, <2.1,0,0>, axisthickness }
	cone { <2.1,0,0>, 2*axisthickness, <2.2,0,0> 0 }
	cylinder { <0,0,0>, <0,2.1,0>, axisthickness }
	cone { <0,2.1,0>, 2*axisthickness, <0,2.2,0>, 0 }
	sphere { <0,0,0>, axisthickness }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#macro charpoint(p, tt) 
	<p, (p*p*p/6 + tt*p + exp(tt)) / 4, 0.5 * p * p + tt >
#end

#declare nsteps = 50;
#declare xmax = 1;
#declare xstep = xmax / nsteps;
#declare ymax = 1;
#declare ystep = ymax / nsteps;

#declare tt = 0;
#declare ttstep = 0.25;
#declare maxtt = 2;
#while (tt < maxtt - ttstep /2)
#declare maxp = sqrt(2 * (2 - tt));
#declare pstep = maxp / nsteps;
#declare p = 0;
union {
#while (p < maxp - pstep/2)
	sphere { charpoint(p, tt), d }
	cylinder { charpoint(p, tt), charpoint(p + pstep, tt), d }
#declare p = p + pstep;
#end
	sphere { charpoint(p, tt), d }
        pigment { color rgb <1,1,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}
#declare tt = tt + ttstep;
#end

mesh {
#declare xx = 0;
#declare maxxx = 2;
#declare xxstep = maxxx / nsteps;
#while (xx < maxxx - xxstep / 2)
	triangle {
		<xx, 0, 0>,
		<xx + xxstep, 0, 0>,
		<xx + xxstep, 0, (xx + xxstep) * (xx + xxstep) / 2>
	}
	triangle {
		<xx, 0, 0>,
		<xx + xxstep, 0, (xx + xxstep) * (xx + xxstep) / 2>,
		<xx, 0, xx * xx / 2>
	}
#declare xx = xx + xxstep;
#end
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

#macro surfacequad(p, tt, pstep, ttstep)
	triangle {
		charpoint(p        , tt         ),
		charpoint(p + pstep, tt         ),
		charpoint(p + pstep, tt + ttstep)
	}
	triangle {
		charpoint(p        , tt         ),
		charpoint(p + pstep, tt + ttstep),
		charpoint(p        , tt + ttstep)
	}
#end

mesh {
#declare tt = 0;
#declare ttstep = 0.1;
#declare maxtt = 2;
#while (tt < maxtt - ttstep / 2)
#declare maxp = sqrt(2 * (2 - tt));
#declare pstep = maxp / nsteps;
#declare p = 0;
#while (p < maxp - pstep / 2)
	surfacequad(p, tt, pstep, ttstep)
#declare p = p + pstep;
#end
#declare tt = tt + ttstep;
#end
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

/*
mesh {
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

*/

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


