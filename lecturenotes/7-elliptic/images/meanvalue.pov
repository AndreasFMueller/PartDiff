//
// meanvalue.pov -- 
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;
#include "colors.inc"
#include "../../common/common.inc"

#declare xo = -0.1;
#declare yo = -0.1;
#declare at = 0.013;

#macro surface(xx, yy)
	<xx, log(sqrt((xx-xo)*(xx-xo)+(yy-yo)*(yy-yo))), yy>
#end

#declare nsteps = 200;

#declare xmin = -1;
#declare xmax = 2;
#declare xstep = (xmax - xmin) / nsteps;
#declare ymin = 0;
#declare ymax = 2;
#declare ystep = (ymax - ymin) / nsteps;

#declare xmid = (xmax + xmin) / 2;
#declare ymid = (ymax + ymin) / 2;
#declare center = surface(xmid, ymid);

#declare imagescale = 0.174;

camera {
        location <1.8, 4.3, -10>
        look_at center + <0, -0.44, 0>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <-12, 8, -6> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

arrow(<xmin,0,0>, <xmax,0,0>, at, White)
arrow(<0,0,ymin>, <0,0,ymax>, at, White)
arrow(<0,-1,0>, <0,1,0>, at, White)

mesh {
	#declare xx = xmin;
	#while (xx < (xmax - xstep/2))
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			#declare A = surface(xx        , yy        );
			#declare B = surface(xx + xstep, yy        );
			#declare C = surface(xx        , yy + ystep);
			#declare D = surface(xx + xstep, yy + ystep);
			triangle { A, B, D }
			triangle { A, D, C }
			#declare yy = yy + ystep;
		#end
		#declare xx = xx + xstep;
	#end
	pigment {
		color rgbf<0.6,0.6,1,0.4>
	}
	finish {
		specular 0.9
		metallic
	}
}

sphere { center, 2 * at
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}

#macro kreis(r, phi)
	surface(xmid + r*cos(phi), ymid + r*sin(phi))
#end

#macro meancircle(rr)
union {
	#declare phi = 0;
	#declare phistep = pi / nsteps;
	#while (phi < (2*pi - phistep/2))
		#declare A = kreis(rr, phi);
		sphere { A, at }
		#declare B = kreis(rr, phi + phistep);
		cylinder { A, B, at }
		#declare phi = phi + phistep;
	#end
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

meancircle(0.1)
meancircle(0.2)
meancircle(0.3)
meancircle(0.4)
meancircle(0.5)
meancircle(0.6)
meancircle(0.7)

#declare gt = at / 2;

union {
	#declare xx = xmin;
	#while (xx <= xmax)
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			#declare A = surface(xx, yy        );
			#declare B = surface(xx, yy + ystep);
			sphere { A, gt }
			cylinder { A, B, gt }
			#declare yy = yy + ystep;
		#end
		sphere { B, gt }
		#declare xx = xx + 0.2;
	#end
	#declare yy = ymin;
	#while (yy <= ymax)
		#declare xx = xmin;
		#while (xx <= (xmax - xstep/2))
			#declare A = surface(xx        , yy);
			#declare B = surface(xx + xstep, yy);
			sphere { A, gt }
			cylinder { A, B, gt }
			#declare xx = xx + xstep;
		#end
		sphere { B, gt }
		#declare yy = yy + 0.2;
	#end
	pigment {
		color rgb<0.6,0.6,1>
	}
	finish {
		specular 0.9
		metallic
	}
}
