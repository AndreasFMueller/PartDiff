//
// conemovie.pov
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../common/common.inc"
#include "cone.inc"

#declare T = clock;

#declare XX = 7;
#declare YY = 5;
#declare ZZ = 3;

#declare r = 3;

#if (0 <= T)
	#if (T < 1)
		gridpoint(XX, YY, ZZ)
		charplane(XX, YY, ZZ, 2 * T * 360)
	#end
#end
#if (1 <= T)
	#if (T < 2)
		gridpoint(XX, YY, ZZ)
		charplane(XX, YY, ZZ, 2 * T * 360)
		charcone(XX, YY, ZZ)
	#end
#end
#declare height = function(a) { sin(a) * (sin(a) + 1) };
#if (2 <= T)
	#if (T < 19)
		#declare A = 360 * (T - 2) / 8;
		#declare X = XX + 5 * (1 - cos(radians(A)));
		#declare Y = YY + 3 * (sin(radians(A)));
		#declare Z = ZZ + height(radians(A));
		gridpoint(X, Y, Z)
		charplane(X, Y, Z, 10 * A)
		charcone(X, Y, Z)
	#end
#end

