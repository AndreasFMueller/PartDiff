//
// normal.pov -- 
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../../lecturenotes/common/common.inc"

#declare imagescale = 0.41;
#declare at = 0.05;

camera {
        location <18, 4.3, -10>
        look_at <1.8,2.05,2.5>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <+1, 16, -12> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#declare nsteps = 200;

#declare xmin = -8;
#declare xmax = 8;
#declare xstep = (xmax - xmin) / nsteps;
#declare ymin = 0;
#declare ymax = 5;
#declare ystep = (ymax - ymin) / nsteps;
#declare zmin = -1;
#declare zmax = 6;

#declare uu = function(xx, yy) { cos(xx - yy) + yy }
#macro UU(xx, yy) 
	<xx, uu(xx, yy), yy>
#end

arrow(< xmin - 0.3, 0  , 0  >, < xmax + 0.4,0  ,0>, at, White)
arrow(< 0, 0  ,-0.2>, <0,0  , ymax + 0.4>, at, White)
arrow(< 0,zmin-0.2, 0  >, <0,zmax + 0.2,0>, at, White)

union {
	#declare tick = 0.8 * at;
	#declare xx = 1;
	#while (xx < xmax)
		cylinder { <xx-0.3*tick, 0, 0>, <xx+0.3*tick,0,0>, 2 * tick }
		cylinder { <-xx-0.3*tick, 0, 0>, <-xx+0.3*tick,0,0>, 2 * tick }
		#declare xx = xx + 1;
	#end
	#declare yy = 1;
	#while (yy < ymax)
		cylinder { <0, 0, yy-0.3*tick>, <0, 0, yy+0.3*tick>, 2 * tick }
		#declare yy = yy + 1;
	#end
	#declare zz = 1;
	#while (zz < zmax)
		cylinder { <0, zz-0.3*tick, 0>, <0, zz+0.3*tick, 0>, 2 * tick }
		#declare zz = zz + 1;
	#end
	cylinder { <0, -1-0.3*tick, 0>, <0, -1+0.3*tick, 0>, 2 * tick }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

mesh {
	#declare xx = xmin;
	#while (xx < (xmax - xstep/2))
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			#declare A = UU(xx        , yy        );
			#declare B = UU(xx + xstep, yy        );
			#declare C = UU(xx        , yy + ystep);
			#declare D = UU(xx + xstep, yy + ystep);
			triangle { A, B, D }
			triangle { A, D, C }
			#declare yy = yy + ystep;
		#end
		#declare xx = xx + xstep;
	#end
	pigment {
		color rgbf<0.4,0.6,0.8,0.9>
	}
	finish {
		specular 0.9
		metallic
	}
}

//
// initial curve
//
intersection {
	box { <xmin, -5, -1>, <xmax, 5, 1> }
	union {
		#declare xx = xmin - 0.2;
		#while (xx < (xmax + 0.2))
			#declare A = UU(xx, 0);
			#declare B = UU(xx + xstep, 0);
			cylinder { A, B, at }
			sphere { A, at }
			#declare xx = xx + xstep;
		#end
		sphere { B, at }
	}
	pigment {
		color rgb<0,0.6,0>
	}
	finish {
		specular 0.9
		metallic
	}
}

//
// characteristic curves
//
intersection {
	box { <xmin, -10, ymin>, <xmax, 10, ymax> }
	union {
		#declare ct = 0.7 * at;
		#declare x0 = xmin - ymax;
		#while (x0 < xmax)
			#declare A = UU(x0, 0);
			#declare B = UU(x0 + ymax + 1, ymax + 1);
			cylinder { A, B, ct }
			#declare x0 = x0 + 0.5;
		#end
	}
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}

//
// add a grid
//
union {
	#declare gridstep = 0.5;
	#declare gt = at / 3;
	#declare xx = xmin;
	#while (xx <= xmax)
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			cylinder { <xx, 0, yy>, <xx, 0, yy + ystep>, gt }
			sphere { <xx, 0, yy>, gt }
			#declare A = UU(xx, yy);
			#declare B = UU(xx, yy + ystep);
			cylinder { A, B, gt }
			sphere { A, gt }
			#declare yy = yy + ystep;
		#end
		sphere { B, gt }
		sphere { <xx, 0, yy>, gt }
		#declare xx = xx + gridstep;
	#end
	#declare yy = ymin;
	#while (yy <= ymax)
		#declare xx = xmin;
		#while (xx < (xmax - xstep/2))
			cylinder { <xx, 0, yy>, <xx + xstep, 0, yy>, gt }
			sphere { <xx, 0, yy>, gt }
			#declare A = UU(xx, yy);
			#declare B = UU(xx + xstep, yy);
			cylinder { A, B, gt }
			sphere { A, gt }
			#declare xx = xx + xstep;
		#end
		sphere { B, gt }
		sphere { <xx, 0, yy>, gt }
		#declare yy = yy + gridstep;
	#end
	pigment {
		color rgb<0.0,0.4,0.8>
	}
	finish {
		specular 0.9
		metallic
	}
}
