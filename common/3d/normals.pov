#include "colors.inc"

camera {
	location <2, 1.2, 2.5>
	look_at <0, 0.2, 1>
	right 16/9 * x
	up y
}

light_source { <10, 10, 10> color White }
sky_sphere {
	pigment {
		color <1,1,1>
	}
}

cylinder {
	<0,0,0>, <0,0,2>, 0.1
	pigment {
		color rgb <1,0,0>
	}
}
cone {
	<0,0,2>, 0.15, <0,0,2.4>, 0
	pigment {
		color rgb <1, 0, 0>
	}
}
sphere {
	<0, 0, 0>, 0.14
	pigment {
		color rgb <1, 0, 0>
	}
}

#declare a = 0;
#while (a < 2 * pi)

	cylinder {
		<0, 0, 0>, <0, 1, 0>, 0.05
		pigment {
			color rgb <0.6, 0.6, 1>
		}
		matrix <cos(a), -sin(a), 0,
			sin(a),  cos(a), 0,
			     0,       0, 1,
			     0,       0, 0> 
	}
	cone {
		<0, 1, 0>, 0.08, <0, 1.2, 0>, 0
		pigment {
			color rgb <0.6, 0.6, 1>
		}
		matrix <cos(a), -sin(a), 0,
			sin(a),  cos(a), 0,
			     0,       0, 1,
			     0,       0, 0> 
	}

#declare a = a + pi / 9;

#end
