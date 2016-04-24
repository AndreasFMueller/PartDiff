#include "colors.inc"

#declare pi2 = (3.1415926535 / 2);
#declare skalierung = 0.28;

camera { 
        location <-1.2, 3.4, 7.0>
        look_at <pi2 / 2, 0.4, pi2 / 2>
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


#declare d = 0.010;

#declare schritte = 100;

#declare dx = pi2 / schritte;
#declare dy = pi2 / schritte;

#macro xpos(xx, yy)
	1 - cos(yy) + (xx / pi2) * (pi2 - 1 + cos(yy))
#end

#macro surfacepoint(xx, yy)
	<xpos(xx, yy), sin(xpos(xx, yy) + cos(yy) - 1), yy>
#end

#declare rstep = 0.01;

#macro surfacequad(xx, yy)
triangle {
	surfacepoint(xx     , yy     ),
	surfacepoint(xx + dx, yy     ),
	surfacepoint(xx + dx, yy + dy)
}
triangle {
	surfacepoint(xx     , yy     ),
	surfacepoint(xx     , yy + dy),
	surfacepoint(xx + dx, yy + dy)
}
#end

#macro domainquad(xx, yy)
triangle {
	domainpoint(xx     , yy     ),
	domainpoint(xx + dx, yy     ),
	domainpoint(xx + dx, yy + dy)
}
triangle {
	domainpoint(xx     , yy     ),
	domainpoint(xx     , yy + dy),
	domainpoint(xx + dx, yy + dy)
}
#end

#macro charpoint(yy, x0)
	<-cos(yy) + 1 + x0, sin(x0), yy>
#end

#declare x0 = 0;
#while (x0 < pi2)
union {
#declare yy = 0;
#if (x0 > (pi2 - 1))
#declare ymax = acos(x0 - (pi2 - 1));
#else
#declare ymax = pi2;
#end
#declare dx = ymax / schritte;
#while (yy < ymax - dx/2)
	sphere { charpoint(yy, x0), d }
	cylinder {
		charpoint(yy, x0),
		charpoint(yy + dy, x0),
		d
	}
#declare yy = yy + dy;
#end
	sphere { charpoint(yy, x0), d }
	pigment {
                color rgb <1,1,0>
        }
        finish {
                specular 0.9
                metallic
        }

}
#declare x0 = x0 + 0.2;
#end

#declare dy = pi2 / schritte;
#declare dx = pi2 / schritte;
object {
mesh {
#declare yy = 0;
#while (yy < pi2 - dy/2)

#declare xx = -cos(yy) + 1;
#declare xx = 0;
#while (xx < pi2 - dx/2)
surfacequad(xx, yy)
#declare xx = xx + dx;
#end
#declare yy = yy + dy;
#end
}
        pigment { color rgb <1,0,0> }
        finish {
                diffuse 0.7
                specular 0.9
                metallic
        }
	
}

union {
	cylinder { <0,0,0>, <0,0,1.7>, d }
	cone { <0,0,1.7>, 2*d, <0,0,1.8> 0 }
	cylinder { <0,0,0>, <1.7,0,0>, d }
	cone { <1.7,0,0>, 2*d, <1.8,0,0> 0 }
	cylinder { <0,0,0>, <0,1.1,0>, d }
	cone { <0,1.1,0>, 2*d, <0,1.2,0>, 0 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}


