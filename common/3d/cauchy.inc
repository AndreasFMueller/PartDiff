#include "colors.inc"

#declare	axisthickness = 0.015;

/*
#declare square = function(x) { x * x }
*/

#macro charpoint(y0, u0, xx)
	<xx, u0 * exp(-xx), y0 + 0.5 * (xx * xx)>
#end

#macro surfacecharpoint(y0, xx)
	charpoint(y0, sin(y0), xx)
#end

#declare d = 0.02;
#declare nsteps = 60;

#declare xmax = 1.8;
#declare xstep = xmax / nsteps;

#declare ymax = pi;
#declare ystep = ymax / nsteps;

#declare y0max = pi;
#declare y0step = y0max / nsteps;

#declare zmax = 1.3;
#declare imagescale = 1.02;

camera {
	location <3.3, 1.1, 2.2>
	look_at <0.5, 0.3, pi/2 - 0.06>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source { <10, 10, 10> color White }
sky_sphere {
	pigment {
		color <1,1,1>
	}
}

union {
	cylinder { <-0.1, 0, 0>, <xmax + 0.1, 0, 0>, axisthickness }
	cone { <xmax + 0.1, 0, 0>, 2*axisthickness, <xmax + 0.2, 0, 0>, 0 }

	cylinder { <0, -0.1, 0>, <0, zmax, 0>, axisthickness }
	cone { <0, zmax, 0>, 2*axisthickness, <0, zmax + 0.1, 0>, 0 }

	cylinder { <0, 0, -0.1>, <0, 0, ymax + 0.1>, axisthickness }
	cone { <0, 0, ymax + 0.1>, 2*axisthickness, <0, 0, ymax + 0.2>, 0 }

	pigment {
		color rgb<0.7, 0.7, 0.7>
	}
        finish {
                specular 0.9
                metallic
        }
}

box {
	<0, -0.005, 0>, <xmax - 0.001, 0.005, ymax>
	pigment {
		color rgbf <0.99, 0.99, 0.99, 0.6>
	}
}

#declare y0 = 0;
union {
#while (y0 < (y0max - y0step / 2))
	sphere { <0, sin(y0), y0>, d }
	cylinder { <0, sin(y0), y0>, <0, sin(y0 + y0step), y0 + y0step>, d }
#declare y0 = y0 + y0step;
#end
	sphere { <0, sin(y0), y0>, d }
	pigment {
		color rgb<0, 1, 0>
	}
        finish {
                specular 0.9
                metallic
        }
}

