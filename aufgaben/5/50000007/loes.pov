#include "colors.inc"

#declare skalierung = 0.8;
#declare axisthickness = 0.016;

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


#declare d = 0.01;

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


#macro charpoint(p, tzero) 
	<p, (p*p*p/6 + tzero*p + exp(tzero)) / 4, 0.5 * p * p + tzero >
#end

#macro charpoint2(p, xzero)
	<xzero + p, 0, 0.5 * p * p>
#end

#macro tzero(xx, yy)
	(yy - 0.5 * xx * xx)
#end


#declare nsteps = 50;

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

#declare x0max = 2;
#declare x0step = 0.25;
#declare x0 = 0;
#while (x0 < x0max - x0step/2)
union {
#declare p = 0;
#declare pstep = (2 - x0) / nsteps;
#while (p < (2 - x0) - pstep / 2)
	sphere { charpoint2(p, x0), d }
	cylinder { charpoint2(p, x0), charpoint2(p + pstep, x0), d }
#declare p = p + pstep;
#end
	sphere { charpoint2(p, x0), d }
        pigment { color rgb <1,1,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}
#declare x0 = x0 + x0step;
#end



mesh {
#declare xx = 0;
#declare maxxx = 2;
#declare xxstep = maxxx / nsteps;
#while (xx < maxxx - xxstep / 2)
	triangle {
		<xx,          0, 0>,
		<xx + xxstep, 0, 0>,
		<xx + xxstep, 0, (xx + xxstep) * (xx + xxstep) / 2>
	}
	triangle {
		<xx,          0, 0>,
		<xx + xxstep, 0, (xx + xxstep) * (xx + xxstep) / 2>,
		<xx,          0, xx * xx / 2>
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

#macro surfacepoint(xx, yy)
    <
	xx,
	(xx * xx * xx / 6 + xx * tzero(xx,yy) + exp(tzero(xx, yy))) / 4,
	yy
    >
#end

mesh {
#declare maxxx = 2;
#declare xxstep = maxxx / nsteps;
#declare xx = 0;
#while (xx < maxxx - xxstep / 2)

#declare maxyy = 2;
#declare yyminleft = 0.5 * xx * xx;
#declare yyminright = 0.5 * (xx + xxstep) * (xx + xxstep);
#declare yystepleft = (maxyy - yyminleft) / nsteps;
#declare yystepright = (maxyy - yyminright) / nsteps;

#declare i = 0;
#while (i < nsteps)
	triangle {
		surfacepoint(xx         , yyminleft  +  i      * yystepleft ),
		surfacepoint(xx + xxstep, yyminright +  i      * yystepright),
		surfacepoint(xx + xxstep, yyminright + (i + 1) * yystepright)
	}
	triangle {
		surfacepoint(xx         , yyminleft  +  i      * yystepleft ),
		surfacepoint(xx + xxstep, yyminright + (i + 1) * yystepright),
		surfacepoint(xx         , yyminleft  + (i + 1) * yystepleft )
	}
#declare i = i + 1;
#end

#declare xx = xx + xxstep;
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


