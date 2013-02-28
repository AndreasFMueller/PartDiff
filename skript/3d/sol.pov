#include "cauchy.inc"

#declare d = 0.01;

#declare square = function(x) { x * x }

// Loesungsflaeche
parametric {
	function { u }
	function { exp(-u) * sin(v - 0.5 * u * u) }
	function { v }
	<0, 0>, <1.8, pi>
	contained_by {
		box {
			<-0.1,-0.5,-0.1>, <1.8,1.1,pi>
		}
	}
	pigment {
		color rgb<0.8, 0.8, 1>
	}
}

#declare y0 = -0.5;
#while (y0 <= 3) 

// Charakteristik zu y0, u0 = sin(y0)
parametric {
	function { u }
	function { sin(y0) * exp(-u) + d * cos(v) }
	function { y0 + 0.5 * x * x + d * sin(v) }
	<0, 0>, <1.8, 2 * pi>
	contained_by {
		box {
			<-0.1,-0.5,-0.1>, <1.8,1.1,pi>
		}
	}
	pigment {
		color rgb<1, 0, 0>
	}
}

#declare y0 = y0 + 0.25;

#end

