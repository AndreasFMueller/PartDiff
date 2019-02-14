//
// scene.inc
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../common/common.inc"

global_settings {
	assumed_gamma 1
}

#declare imagescale = 0.45;

camera {
        location <12.5, 6.3, -5>
        look_at <3, 0.75, 1.5>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <3, 4, -1> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

arrow(<-1,0,0>, <6,0,0>, 0.03, White)
arrow(<0,-1,0>, <0,3,0>, 0.03, White)
arrow(<0,0,-1>, <0,0,4>, 0.03, White)

#declare bump1 = function(A, B) { 2 * exp(-A*A - (B-2)*(B-2)) }
#declare bump2 = function(A, B) { exp(-A*A - B*B) }
#declare bump3 = function(A, B) { exp(-(A-2*B+2)*(A-2*B+2)) }
#declare bump4 = function(A, B) { 0.2 * (B*B) * exp(-(A-2)*(A-2)) }
#declare bump5 = function(A, B) { 1.0 * exp(-(A-1.7)*(A-1.7)-(B-2.5)*(B-2.5)) }
#declare bump6 = function(A, B) { 0.8 * exp(-(A-0.5)*(A-0.5) - (B+1)*(B+1)) }

#macro punkt(a, b)
	<a, (bump1(a, b) + bump2(a, b) + bump3(a, b) + bump4(a, b) + bump5(a, b) + bump6(a, b)) * exp(-0.03 * a), b>
#end

#declare amin = -1;
#declare amax = 5.6;
#declare asteps = 200;
#declare astep = (amax - amin) / asteps;

#declare bmin = -1;
#declare bmax = 4;
#declare bsteps = 200;
#declare bstep = (bmax - bmin) / bsteps;

#if (surface)
mesh {
	#declare a = amin;
	#while (a < amax - astep/2)
		#declare b = bmin;
		#while (b < bmax - bstep/2)
			#declare P1 = punkt(a, b);
			#declare P2 = punkt(a + astep, b);
			#declare P3 = punkt(a, b + bstep);
			#declare P4 = punkt(a + astep, b + bstep);
			triangle { P1, P2, P4 }
			triangle { P1, P4, P3 }
			#declare b = b + bstep;
		#end
		#declare a = a + astep;
	#end
	pigment {
		color rgbf<0.8, 0.8, 0.8>
	}

	finish {
		specular 0.9
		metallic
	}
}
#end

#declare curve = function(B) { 1 - cos(B) + 0.2 * B }

union {
	#declare b = bmin;
	#while (b < bmax - bstep / 2)
		#declare a = curve(b);
		#declare P1 = punkt(a, b);
		#declare b = b + bstep;
		#declare a = curve(b);
		#declare P2 = punkt(a, b);
		cylinder { P1, P2, 0.04 }
		sphere { P1, 0.04 }
	#end
	sphere { P2, 0.04 }
	pigment {
		color rgb<0.0,0.8,0.2>
	}
	finish {
		specular 0.9
		metallic
	}
}

union {
	#declare b = bmin;
	#while (b < bmax - bstep / 2)
		#declare a = curve(b);
		#declare P1 = <a, 0, b>;
		#declare b = b + bstep;
		#declare a = curve(b);
		#declare P2 = <a, 0, b>;
		cylinder { P1, P2, 0.04 }
		sphere { P1, 0.04 }
	#end
	sphere { P2, 0.04 }
	pigment {
		color rgb<0.0,0.2,1.0>
	}
	finish {
		specular 0.9
		metallic
	}
}

mesh {
	#declare b = bmin;
	#while (b < bmax - bstep / 2)
		#declare a = curve(b);
		#declare P1 = punkt(a, b);
		#declare Q1 = <a, 0, b>;
		#declare b = b + bstep;
		#declare a = curve(b);
		#declare P2 = punkt(a, b);
		#declare Q2 = <a, 0, b>;
		triangle { Q1, Q2, P2 }
		triangle { Q1, P2, P1 }
	#end
	pigment {
		color rgbt<0.0,0.5,0.3,0.3>
	}
	finish {
		specular 0.9
		metallic
	}
}
