#include "colors.inc"

#declare	axisthickness = 0.005;
#declare	arrowheadlength = 0.04;

#declare d = 0.02;
#declare nsteps = 100;

#declare xmax = 1.0;
#declare xstep = xmax / (2 * nsteps);

#declare ymax = 1.5;
#declare ystep = ymax / nsteps;

#declare zmax = 0.25;

#declare imagescale = 0.20;

camera {
	location <3.3, 1.7, -3.2>
	look_at <xmax/2, zmax/2-0.1, ymax/2-0.15>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source { <10, 10, 10> color White }
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

#declare quadrat = function(x) { x * x }
#macro g(x0)
	0.25 * exp(-32 * quadrat(x0 - 0.5))
#end

#macro surfacepoint(xx, yy) 
	<xx + yy * g(xx), g(xx), yy>
#end

mesh {
#declare xx = 0;
#while (xx < xmax - xstep/2)
#declare yy = 0;
#while (yy < ymax - ystep/2)
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
	pigment { color rgb <1,0,0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}

}

#declare d = 0.005;

#macro characteristic(x0)
	cylinder { <x0, g(x0), 0>, <x0 + g(x0) * ymax, g(x0), ymax>, d }
	sphere { <x0, g(x0), 0>, d }
	sphere { <x0 + g(x0) * ymax, g(x0), ymax>, d }
#end

#declare x0max = xmax;
#declare x0steps = 14;
#declare x0step = x0max / x0steps;

union {
#declare x0 = 0;
#while (x0 < x0max + x0step/2)
	characteristic(x0)
#declare x0 = x0 + x0step;
#end
	pigment {
		color rgb <1,1,0>
	}
	finish {
		specular 0.9
		metallic
	}

}
