//
// coneplanes.pov
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../common/common.inc"

#include "cone.inc"

#declare XX = 7;
#declare YY = 5;
#declare ZZ = 3;

#declare r = 3;

gridpoint(XX, YY, ZZ)
charcone(XX, YY, ZZ)
#declare a = 25;
#while (a < 360)
	charplane(XX, YY, ZZ, a)
	#declare a = a + 30;
#end




