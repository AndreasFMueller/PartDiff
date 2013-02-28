#include "cauchy.inc"

#declare d = 0.02;

parametric {
	function { d * cos(v) }
	function { sin(u) + d * sin(v) }
	function { u }
	<0, 0>, <pi, 2 * pi>
	contained_by {
		box {
			<-0.1,-0.1,0>, <0.1,1.1,4>
		}
	}
	pigment {
		color rgb<0, 1, 0>
	}
}

