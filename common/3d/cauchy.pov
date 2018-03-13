#include "cauchy.inc"

#declare d = 0.02;

intersection {
	union {
	#declare yy = 0;
	#while (yy < (ymax - ystep/2))
		sphere { <0, sin(yy), yy>, d }
		cylinder {
			<0, sin(yy), yy>,
			<0, sin(yy + ystep), yy + ystep>, d
		}
	#declare yy = yy + ystep;
	#end
		sphere { <0, sin(yy), yy>, d }
	}
	box {
		<-1, -1, 0>, <1, 2, pi>
	}
	pigment {
		color rgb<0, 1, 0>
	}
	finish {
                specular 0.9
                metallic
        }
}

