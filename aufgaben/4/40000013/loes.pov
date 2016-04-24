#include "colors.inc"

camera { 
        location <-1.2, 1.4, -7.0>
        look_at <1, 0.5, 0.7>
        right 16/9 * x * 0.25
        up y * 0.25
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
#declare delta = 3.1415926535 / 800;

#declare phi = 0;
union {
#while (phi < 3.1415926535 / 2)
	sphere { <cos(phi), 0, sin(phi)>, d }
	cylinder {
		<cos(phi), 0, sin(phi)>,
		<cos(phi+delta), 0, sin(phi+delta)>,
		d
	}
	sphere { <2 * cos(phi), 0, 2 * sin(phi)>, d }
	cylinder {
		<2 * cos(phi), 0, 2 * sin(phi)>,
		<2 * cos(phi+delta), 0, 2 * sin(phi+delta)>,
		d
	}
#declare phi = phi + delta;
#end
        pigment {
                color rgb <1,1,1>
        }
        finish {
                specular 0.9
                metallic
        }
}

#declare phi = 0;
union {
#while (phi < 3.1415926535 / 3)
	triangle {
		<    cos(phi        ), 0,     sin(phi        )>
		<2 * cos(phi        ), 0, 2 * sin(phi        )>
		<    cos(phi + delta), 0,     sin(phi + delta)>
	}
	triangle {
		<    cos(phi + delta), 0,     sin(phi + delta)>
		<2 * cos(phi        ), 0, 2 * sin(phi        )>
		<2 * cos(phi + delta), 0, 2 * sin(phi + delta)>
	}
#declare phi = phi + delta;
#end
        pigment {
                color rgb <1,1,1>
        }
        finish {
                specular 0.9
                metallic
        }
}

#declare phi = 0;
union {
#while (phi < 3.1415926535 / 3)
	sphere { <cos(phi), sin(3 * phi), sin(phi)>, d }
	cylinder {
		<cos(phi), sin(3 * phi), sin(phi)>,
		<cos(phi+delta), sin(3 * (phi+delta)), sin(phi+delta)>,
		d
	}
	sphere { <2 * cos(phi), sin(3 * phi), 2 * sin(phi)>, d }
	cylinder {
		<2 * cos(phi), sin(3 * phi), 2 * sin(phi)>,
		<2 * cos(phi+delta), sin(3 * (phi+delta)), 2 * sin(phi+delta)>,
		d
	}
#declare phi = phi + delta;
#end
        pigment {
                color rgb <1,1,0>
        }
        finish {
                specular 0.9
                metallic
        }
}

#macro surfacepoint(r, phi)
	<r * cos(phi), sin(3 * phi) * (r*r*r + 8/(r*r*r))/9, r * sin(phi)>
#end

#declare rstep = 0.01;

#macro surfacequad(r, phi)
triangle {
	surfacepoint(r, phi),
	surfacepoint(r + rstep, phi),
	surfacepoint(r + rstep, phi + delta)
}
triangle {
	surfacepoint(r, phi),
	surfacepoint(r, phi + delta),
	surfacepoint(r + rstep, phi + delta)
}
#end

object {
mesh {
#declare phi = 0;
#while (phi < 3.1415926535 / 3)

#declare r = 1;
#while (r < 2)
surfacequad(r, phi)
#declare r = r + rstep;
#end
#declare phi = phi + delta;
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
	cylinder { <0,0,0>, <0,0,2.2>, d }
	cone { <0,0,2.2>, 2*d, <0,0,2.3> 0 }
	cylinder { <0,0,0>, <2.2,0,0>, d }
	cone { <2.2,0,0>, 2*d, <2.3,0,0> 0 }
	cylinder { <0,0,0>, <0,1.2,0>, d }
	cone { <0,1.2,0>, 2*d, <0,1.3,0>, 0 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}


