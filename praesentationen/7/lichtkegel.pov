#include "colors.inc"

#declare        axisthickness = 0.040;
#declare        arrowheadlength = 0.25;

#declare d = 0.02;
#declare nsteps = 100;

#declare si = 2.5;

#declare xmin = -si;
#declare xmax =  si;
#declare xstep = xmax / (2 * nsteps);

#declare ymin = -si;
#declare ymax =  si;
#declare ystep = ymax / nsteps;

#declare zmin = 0;
#declare zmax = si;

#declare imagescale = 0.35;

camera {
        location <+7, 4.5, -9.2>
        look_at <(xmin + xmax)/2, zmax/2-0.05, (ymin + ymax)/2-0.15>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source { <0, 15, -30> color White }
light_source { <5, -5, -30> color White }
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
        arrow(<xmin, 0, 0>, <xmax, 0, 0>)
        arrow(<0, 0, 0>, <0, zmax, 0>)
        arrow(<0, 0, ymin>, <0, 0, ymax>)
        sphere { <0, 0, 0>, axisthickness }
        pigment {
                color rgb<0.7, 0.7, 0.7>
        }
        finish {
                specular 0.9
                metallic
        }
}

#declare p = 0.1;

union {
	sphere { <0, 0, 0>, p }
	sphere { <1.5, 0, 0>, p }
	sphere { <1.5, 0, -1>, p }
	sphere { <1.5, sqrt(1.5*1.5 + 1), -1>, p }
	cylinder { <0,0,0>, <1.5,0,0>, 0.5 * p }
	cylinder { <1.5,0,0>, <1.5,0,-1>, 0.5 * p }
	cylinder { <1.5,0,-1>, <1.5,sqrt(1.5*1.5 + 1), -1>, 0.5 * p }
        pigment {
                color rgb<1, 0, 0>
        }
        finish {
                specular 0.9
                metallic
        }
}

cylinder { <0,0,0>, <1.5, sqrt(1.5*1.5 + 1),-1>, 0.5 * p 
        pigment {
                color rgb<0, 0, 1>
        }
        finish {
                specular 0.9
                metallic
        }
}

cone {
	<0,0,0>, 0,
	<0,si,0>, si
	open
	pigment {
		color rgb<1,1,0>
	}
	finish {
		specular 0.9
		metallic
	}
}

text {
	internal 1 "x"
	0.2, <0,0,0>
	pigment {
		color rgb<0,0.8,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	rotate <0, -30, 0>
	translate <si+ 0.1, 0.1, -0.1>
}

text {
	internal 1 "t"
	0.2, <0,0,0>
	pigment {
		color rgb<0,0.8,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	rotate <0, -30, 0>
	translate <0.1, si + 0.44,-0.1>
}

text {
	internal 1 "y"
	0.2, <0,0,0>
	pigment {
		color rgb<0,0.8,0>
	}
	finish {
		specular 0.9
		metallic
	}
	scale 0.5
	rotate <0, 60, 0>
	translate <si + 0.2, 0, -0.1>
	rotate <0,-90,0>
}
