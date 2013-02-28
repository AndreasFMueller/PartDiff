#include "colors.inc"

#declare	axisthickness = 0.01;

camera {
	location <3.3, 1.1, 2.2>
	look_at <0.5, 0.3, pi/2>
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
	<0, 0, 0>, <2, 0, 0>, axisthickness
	pigment {
		color rgb<0.7, 0.7, 0.7>
	}
}

cylinder {
	<0, 0, 0>, <0, 1.3, 0>, axisthickness
	pigment {
		color rgb<0.7, 0.7, 0.7>
	}
}

cylinder {
	<0, 0, 0>, <0, 0, 3.6>, axisthickness
	pigment {
		color rgb<0.7, 0.7, 0.7>
	}
}

box {
	<0, -0.01, 0>, <1.8, 0, pi>
	pigment {
		color rgb <0.99, 0.99, 0.99>
	}
}

#declare d = 0.02;

parametric {
	function { d * cos(v) }
	function { sin(u) + d * sin(v) }
	function { u }
	<0, 0>, <pi, 2 * pi>
	contained_by {
		box {
			<-0.1,-0.1,-0.1>, <0.1,1.1,pi>
		}
	}
	pigment {
		color rgb<0, 1, 0>
	}
}

