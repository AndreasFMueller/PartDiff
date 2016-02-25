#include "colors.inc"

#declare	axisthickness = 0.008;
#declare	arrowheadlength = 0.06;

#declare d = 0.01;
#declare nsteps = 100;

#declare xmax = 2;
#declare xstep = xmax / nsteps;
#declare ymax = 2;
#declare zmax = 1;
#declare ystep = ymax / nsteps;
#declare imagescale = 0.4;

camera {
        location <2.1, 1.3, -3.2>
        look_at <xmax/2, zmax/2-0.1, ymax/2-0.15>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source { <-10, 10, 10> color White }
sky_sphere {
        pigment {
                color <1,1,1>
        }
}

#macro arrow(from, to)
#declare dirvector = to - from;
#declare dirvector = arrowheadlength * vnormalize(dirvector);
        cylinder {
                from - dirvector,
                to   + dirvector,
                axisthickness
        }
        cone {
                to +     dirvector, 2 * axisthickness,
                to + 2 * dirvector, 0
        }
#end

union {
        arrow(<0, 0, 0>, <xmax, 0, 0>)
        arrow(<0, 0, 0>, <0, zmax, 0>)
        arrow(<0, 0, 0>, <0, 0, ymax>)
        sphere { <0, 0, 0>, axisthickness }
        pigment {
                color rgb<0.7, 0.7, 0.7>
        }
        finish {
                specular 0.9
                metallic
        }
}

#macro surfacepoint(xx, yy)
	<xx, 0.25 * xx * yy, yy>
#end

mesh {
#declare xx = 0;
#while (xx < xmax - xstep / 2)
#declare yy = 0;
#while (yy < ymax - ystep / 2)
	triangle {
		surfacepoint(xx,         yy        ),
		surfacepoint(xx + xstep, yy        ),
		surfacepoint(xx + xstep, yy + ystep)
	}
	triangle {
		surfacepoint(xx,         yy        ),
		surfacepoint(xx + xstep, yy + ystep),
		surfacepoint(xx        , yy + ystep)
	}
#declare yy = yy + ystep;
#end
#declare xx = xx + xstep;
#end
	pigment { color rgb <1, 1, 0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}

#macro curvepoint(ss, tt)
	<ss * exp(tt), 0.25 * ss * ss, ss * exp(-tt)>
#end

union {
#declare s = 0.25;
#while (s < 2.1) 
#declare tmax = ln(2 / s);
#declare tmin = -tmax;
#declare tstep = (tmax - tmin) / 100;
#declare tt = tmin;
#while (tt < tmax - tstep/2)
	cylinder { curvepoint(s, tt), curvepoint(s, tt + tstep), d }
	sphere { curvepoint(s, tt), d }
	sphere { curvepoint(s, tt + tstep), d }
#declare tt = tt + tstep;
#end
#declare s = s + 0.25;
#end
	pigment { color rgb <0, 1, 0> }
	finish {
		specular 0.9
		metallic
	}
}

union {
#declare tt = -1.25;
#while (tt < 1.3) 
#declare smin = 0;
#if (tt > 0)
#declare smax = 2 / exp(tt);
#else
#declare smax = 2 / exp(-tt);
#end
#declare sstep = (smax - smin) / 100;
#declare ss = smin;
#while (ss < smax - sstep/2)
	cylinder { curvepoint(ss, tt), curvepoint(ss + sstep, tt), d }
	sphere { curvepoint(ss, tt), d }
	sphere { curvepoint(ss + sstep, tt), d }
#declare ss = ss + sstep;
#end
#declare tt = tt + 0.25;
#end
	pigment { color rgb <1, 0, 0> }
	finish {
		specular 0.9
		metallic
	}
}


