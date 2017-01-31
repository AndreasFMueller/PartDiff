#include "colors.inc"
#declare skalierung = 0.18;

#declare pi2 = 3.1415926535 / 2;
#declare quadrat = function(x) { (x * x) }
#declare tmax = 3.0;

#declare term = function(n, tt, xx) {
	8 / (pi * pi * quadrat(2*n+1)) * exp(-quadrat(2 * n + 1) * tt) * sin((2 * n + 1) * xx)
}

#declare w = function(tt, xx) {
	  term(0, tt, xx)
	- term(1, tt, xx)
	+ term(2, tt, xx)
	- term(3, tt, xx)
	+ term(4, tt, xx)
	- term(5, tt, xx)
	+ term(6, tt, xx)
	- term(7, tt, xx)
	+ term(8, tt, xx)
	- term(9, tt, xx)
	+ term(10, tt, xx)
	- term(11, tt, xx)
}

camera {
	location <-7, 2.2, 14>
	look_at <0, 0.3, tmax / 2>
	right 16/9 * x * skalierung
	up y * skalierung
}

light_source { <-5, 8, -5> color White }
/* light_source { <1, 8,  4> color White } */
light_source { <0, -5, 3> color <0.5,0.5,0.5> }
sky_sphere {
	pigment {
		color <1,1,1>
	}
}


#declare d = 0.015;

union {
	cylinder { <0,0,0>, <0,0,tmax>, d }
	cone { <0,0,tmax>, 2*d, <0,0,tmax + 0.1> 0 }
	cylinder { <-pi2,0,0>, <pi2,0,0>, d }
	cone { <pi2,0,0>, 2*d, <pi2 + 0.1,0,0> 0 }
	cylinder { <0,0,0>, <0,1,0>, d }
	cone { <0,1,0>, 2*d, <0,1.1,0>, 0 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare schritte = 100;
#declare dx = pi2 / schritte;
#declare dt = tmax / (16 * schritte);

#macro surfacepoint(tt, xx)
	<xx, w(tt,xx), tt>
#end

#macro surfacequad(tt, xx)
triangle {
	surfacepoint(tt     , xx     ),
	surfacepoint(tt + dt, xx     ),
	surfacepoint(tt + dt, xx + dx)
}
triangle {
	surfacepoint(tt     , xx     ),
	surfacepoint(tt + dt, xx + dx),
	surfacepoint(tt     , xx + dx)
}
#end

#declare d2 = 0.7 * d;

object {
mesh {
#declare tt = 0;
#while (tt < tmax - dt / 2)

#if (dt < (tt / 32))
#declare dt = 2 * dt;
#end
#declare xx = -pi2;
#while (xx < pi2 - dx/2)
	surfacequad(tt, xx)
#declare xx = xx + dx;
#end

#declare tt = tt + dt;

#end
}
	pigment {
		color rgb <0.9,0.65,0.7,0.3>
	}
	finish {
		specular 0.9
		metallic
	}
}

#macro curve(tt)
#declare xx = -pi2;
#while (xx < pi2 - dx/2)
	sphere { surfacepoint(tt, xx), d2 }
	cylinder { surfacepoint(tt, xx), surfacepoint(tt, xx + dx), d2 }
#declare xx = xx + dx;
#end
	sphere { surfacepoint(tt, xx), d2 }
#end

union {
	cylinder { <-pi2,-1,0>, <pi2, 1, 0>, d2 }
	sphere { <-pi2, -1, 0>, d2 }
	sphere { <pi2, 1, 0>, d2 }
#declare tcurve = 0.9 * tmax;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	curve(tcurve)
#declare tcurve = tcurve / 2;
	pigment {
		color rgb <1,1,0>
	}
	finish {
		specular 0.9
		metallic
	}
}


