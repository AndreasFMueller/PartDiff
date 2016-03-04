#include "colors.inc"

#declare	axisthickness = 0.005;
#declare	arrowheadlength = 0.04;

#declare d = 0.02;
#declare nsteps = 100;

#declare verticalscale = 0.4;

#declare xmax = 1.0;
#declare xstep = xmax / (2 * nsteps);

#declare ymax = 1.0;
#declare ystep = ymax / nsteps;

#declare zmax = 1.5 * verticalscale;

#declare imagescale = 0.25;

camera {
	location <-1.3, 1.4, -3.2>
	look_at <xmax/2, zmax/2-0.05, ymax/2-0.15>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source { <-10, 10, -2> color White }
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

#macro u1(xx, yy)
	<xx, verticalscale * (1.5 * yy), yy>
#end

#macro u2(xx, yy)
	<xx, verticalscale * (xx + yy), yy>
#end

mesh {
	triangle { u1(0, 0), u1(1, 0), u1(1, 1) }
	triangle { u1(0, 0), u1(1, 1), u1(0.5, 1) }
	triangle { u2(0, 0), u2(0.5, 1), u2(0, 1) }
	pigment { color rgb <1,1,1> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}

}

#declare d = 0.005;

union {
	sphere { <0, 0, 0>, 1.5 * d }
	sphere { <1, 0, 0>, 1.5 * d }
	sphere { <0, verticalscale * 1, 1>, 1.5 * d }
	cylinder { <0, 0, 0>, <1, 0, 0>, 1.5 * d }
	cylinder { <0, 0, 0>, <0, verticalscale * 1, 1>, 1.5 * d }
	pigment { color rgb <0,1,0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}

#macro characteristic1(x0)
	sphere { u1(x0, 0), d }
#if (x0 < 0.5)
	cylinder { u1(x0, 0), u1(x0 + 0.5, 1), d }
	sphere { u1(x0 + 0.5, 1), d }
#else
	cylinder { u1(x0, 0), u1(1, 2 * (1 - x0)), d }
	sphere { u1(1, 2 * (1 - x0)), d }
#end
#end

#macro characteristic2(y0)
	cylinder { u2(0, y0), u2(0.5 * (1 - y0), 1), d }
	sphere { u2(0, y0), d }
	sphere { u2(0.5 * (1 - y0), 1), d }
#end

#declare x0max = 1;
#declare x0steps = 5;
#declare x0step = x0max / x0steps;

union {
#declare x0 = x0step / 2;
#while (x0 < x0max)
	characteristic1(x0)
	characteristic2(x0)
#declare x0 = x0 + x0step;
#end
	pigment {
		color rgb <1,0.1,0>
	}
	finish {
		specular 0.9
		metallic
	}

}
