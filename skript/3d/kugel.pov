/*
#include "colors.inc"
*/

#declare	axisthickness = 0.012;
#declare	arrowheadlength = 0.1;

#declare d = 0.01;
#declare nsteps = 200;

#declare imagescale = 0.46;

camera {
        location <2.1, 1.3, 3.2>
        look_at <0, 0.43, 0>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source { <30, 10, 10> color <1,1,1> }
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
        arrow(<-1.1, 0, 0>, <1.1, 0, 0>)
        arrow(<0, 0, -1.1>, <0, 0, 1.1>)
        arrow(<0, 0, 0>, <0, 1.1, 0>)
        pigment {
                color rgb<0.9, 0.9, 0.9>
        }
        finish {
                specular 0.9
                metallic
        }
}

intersection {
	sphere { <0,0,0>, 1 }
	box { <-2,0,-2>, <2, 2, 2> }
	pigment {
                color rgb<0.9, 0.9, 0.9>
	}
        finish {
                specular 0.4
                metallic
        }
}

#macro surfacepoint(phi, theta)
	<sin(theta) * cos(phi), cos(theta), sin(theta) * sin(phi)>
#end

union {
	#declare phistep = pi/12;
	#declare phi = 0;
	sphere { <0,1,0>, axisthickness }
	#while (phi < 2 * pi - phistep/2)
		#declare thetastep = pi / nsteps;
		#declare theta = thetastep;
		#declare previous = <0,1,0>;
		#while (theta < pi/2 - thetastep/2)
			#declare newpoint = surfacepoint(phi, theta);
			sphere { newpoint, axisthickness }
			cylinder { previous, newpoint, axisthickness }
			#declare previous = newpoint;
			#declare theta = theta + thetastep;
		#end
		#declare newpoint = surfacepoint(phi, pi/2);
		sphere { newpoint, axisthickness }
		cylinder { previous, newpoint, axisthickness }
		#declare phi = phi + phistep;
	#end
	pigment { color rgb <1, 0, 0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}

union {
	#declare thetastep = pi / 12;
	#declare theta = thetastep;
	#while (theta < pi/2 + thetastep/2)
		#declare phistep = pi / nsteps;
		#declare phi = 0;
		#declare previous = surfacepoint(phi, theta);
		#while (phi < 2 * pi - phistep/2)
			#declare next = surfacepoint(phi + phistep, theta);
			sphere { previous, axisthickness }
			cylinder { previous, next, axisthickness }
			#declare previous = next;
			#declare phi = phi + phistep;
		#end
		#declare theta = theta + thetastep;
	#end
	pigment { color rgb <0, 1, 0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}

union {
	pigment { color rgb <1, 0, 0> }
	finish {
		specular 0.9
		metallic
	}
}


