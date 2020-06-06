//
// siren.pov
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "common.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.4;
#declare at = 0.03;

camera {
        location <7.5, 3.3, 1>
        look_at <0, -0.3, 0>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <3, 2, 0.4> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#declare phi0 = 0.2;
#declare r = 1.3;

intersection {
	plane { <-1, 0, 0>, -0.1 }
	difference {
		intersection {
			cylinder { <0,-1.01,0>, <0,1.01,0>, r }
			intersection {
				plane { -<  sin(phi0), 0, cos(phi0) >, 0.01 }
				plane {  < -sin(phi0), 0, cos(phi0) >, 0.01 }
			}
		}
		intersection {
			cylinder { <0,-0.99,0>, <0,0.99,0>, r }
			intersection {
				plane { -<  sin(phi0), 0, cos(phi0) >, 0.01 }
				plane {  < -sin(phi0), 0, cos(phi0) >, 0.01 }
			}
			translate <0.1, 0, 0>
		}
	}
	pigment {
		color rgb<0.8, 0.8, 1>
	}
}

arrow( <0,-1,0>, <1.6 * cos(phi0), -1, -1.4 * sin(phi0) >, at, Red)
arrow( <0,-1,0>, <0,1.2,0>, at, Green)

