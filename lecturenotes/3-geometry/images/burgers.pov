//
// burgers.pov -- burgers equation example
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;

#include "colors.inc"
#include "../../common/common.inc"
#include "burgers.inc"

union {
	cylinder { <0,0.5,0>, <2,0.5, 4>, at }
	sphere { <0, 0.5, 0>, at }
	sphere { <2,0.5, 4>, at }
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}
sflaeche(0, Red)
geraden(0)
anfangskurve()
