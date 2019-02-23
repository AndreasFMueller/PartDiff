//
// planefield.pov
//
// (c) 2019 Prof DR Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../common/common.inc"

#ifndef (show_planefield) #declare show_planefield = false; #end
#declare show_planefield = true;

#declare at = 0.03;
#declare imagescale = 0.274;

#declare a = 0.25;
#declare b = 0.5;
#declare c = 1.0;

#declare zvalue = function(xx,yy) { c - (a*xx*xx + b*yy*yy) / 2 };

#macro surface(xx,yy)
	<xx, zvalue(xx, yy), yy>
#end

camera {
	location <-2.6, 4.3, -10>
	look_at <0.2,0.7,0>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-1, 4, -3> color White
	area_light <0.1,0,0> <0,0,0.1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

#declare xmin = -2.1;
#declare xmax =  2.1;

#declare ymin = -1.6;
#declare ymax =  2.1;

arrow(<xmin-0.2, 0,      0  >, <xmax+0.5, 0.0,      0  >, at, White)
arrow(<     0  , 0, ymin-0.2>, <     0  , 0.0, ymax+0.2>, at, White)
arrow(<     0  , 0,      0  >, <     0  , 2.2,      0  >, at, White)

#declare nsteps = 100;
#declare xstep = (xmax - xmin) / nsteps;
#declare ystep = (ymax - ymin) / nsteps;

mesh {
#declare xx = xmin;
#while (xx < (xmax - xstep/2))
	#declare yy = ymin;
	#while (yy < (ymax - ystep/2))
		triangle {
			surface(xx        , yy        ),
			surface(xx + xstep, yy        ),
			surface(xx + xstep, yy + ystep)
		}
		triangle {
			surface(xx        , yy        ),
			surface(xx + xstep, yy + ystep),
			surface(xx        , yy + ystep)
		}
		#declare yy = yy + ystep;
	#end
	#declare xx = xx + xstep;
#end
	pigment {
		color Orange
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare h = 0.5;

#macro ebene(X, Y, Z, col)
	#declare xdir = <1, -a * X, 0> * h / 4;
	#declare ydir = <0, -b * Y, 1> * h / 4;
	mesh {
		#declare C = <X, Z, Y>;
		triangle {
			C - xdir - ydir,
			C + xdir - ydir,
			C + xdir + ydir
		}
		triangle {
			C - xdir - ydir,
			C + xdir + ydir,
			C - xdir + ydir
		}
		pigment {
			color col
		}
		finish {
			specular 0.9
			metallic
		}
	}
	sphere { <X, Z, Y>, at
		pigment {
			color col
		}
		finish {
			specular 0.9
			metallic
		}
	}
#end

#declare xx = -2;
#while (xx <= 2)
	#declare yy = -1.5;
	#while (yy <= 2)
		#declare zz = zvalue(xx, yy);
		ebene(xx, yy, zz, rgb<0.6,0.6,1>)
		#declare yy = yy + h;
	#end
	#declare xx = xx + h;
#end

#if (show_planefield)
#declare xx = 0;
#while (xx <= 2)
	#declare yy = -1.5;
	#while (yy <= 2)
		#declare zz = zvalue(xx, yy);
		#declare zz = 0;
		#while (zz <= 2)
			ebene(xx, yy, zz, rgbf<0.6,0.6,1,0.8>)
			#declare zz = zz + 0.25;
		#end
		#declare yy = yy + h/2;
	#end
	#declare xx = xx + 1.5;
#end
#end
