#include "colors.inc"

camera {
	location <1.2, 0.7, 3.5>
	look_at <0.45, 0, 0.5>
	right 16/9 * x * 0.25
	up y * 0.25
}

#declare d = 0.005;

light_source { <1, 8, 4> color White }
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
	pigment {
		color <1,1,1>
	}
}

union {
	cylinder { <0,0,0>, <0,0,1.06>, d }
	cone { <0,0,1.05>, 2*d, <0,0,1.1>, 0 }
	cylinder { <0,0,0>, <1.06,0,0>, d }
	cone { <1.05,0,0>, 2*d, <1.1,0,0>, 0 }
	cylinder { <0,-0.5,0>, <0,0.2,0>, d }
	cone { <0,0.2,0>, 2*d, <0,0.25, 0>, 0 }
	cylinder { <0,0,1>, <1,0,1>, d*0.7 }
	cylinder { <1,0,0>, <1,0,1>, d*0.7 }
	sphere { <1, 0, 1>, d*0.7 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare xi = 0.1;
#while (xi < 0.95)
union {
	sphere { <1,0,xi>, d }
	cylinder { <1,0,xi>, <xi,xi*(xi-1),xi>, d }
	sphere { <xi,xi*(xi-1),xi>, d }
	cylinder { <0,0,xi>, <xi,xi*(xi-1),xi>, d }
	sphere { <0,0,xi>, d }
	pigment {
		color rgb <1,1,0>
	}
	finish {
		specular 0.9
		metallic
	}
}
#declare xi = xi + 0.1;
#end

parametric {
	function { u },
	function { 0.5 * (u - v) + 0.5 * abs(u - v) - u * (1 - v) }
	function { v }
	<0,0>, <1,1>
	contained_by { box { <0,-1.1,0>, <1,0.1,1> } }
	accuracy 0.001
	precompute 10, x,y,z
	pigment { color rgb <1,0,0> }
	finish {
		diffuse 0.7
		specular 0.9
		metallic
	}
}
