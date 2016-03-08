#include "colors.inc"

#declare pi2 = (3.1415926535 / 2);
#declare skalierung = 0.63;

//#declare sqr = function(x) { x * x }
#declare s2 = function(x) { x * x }
#declare denominator = function(k) { prod(i, 1, k, 4 * i * i) }

#declare J0 = function(x) {
	1
	- pow(x, 2)/denominator( 1)
	+ pow(x, 4)/denominator( 2)
	- pow(x, 6)/denominator( 3)
	+ pow(x, 8)/denominator( 4)
	- pow(x,10)/denominator( 5)
	+ pow(x,12)/denominator( 6)
	- pow(x,14)/denominator( 7)
	+ pow(x,16)/denominator( 8)
	- pow(x,18)/denominator( 9)
	+ pow(x,20)/denominator(10)
	- pow(x,22)/denominator(11)
	+ pow(x,24)/denominator(12)
	- pow(x,26)/denominator(13)
	+ pow(x,28)/denominator(14)
	- pow(x,30)/denominator(15)
	+ pow(x,32)/denominator(16)
	- pow(x,34)/denominator(17)
	+ pow(x,36)/denominator(18)
	- pow(x,38)/denominator(19)
	+ pow(x,40)/denominator(20)
	- pow(x,42)/denominator(21)
	+ pow(x,44)/denominator(22)
	- pow(x,46)/denominator(23)
	+ pow(x,48)/denominator(24)
	- pow(x,50)/denominator(25)
	+ pow(x,52)/denominator(26)
	- pow(x,54)/denominator(27)
	+ pow(x,56)/denominator(28)
}
#declare j0 = function(x) { J0(2 * x) }

camera { 
        location <12, 2.8, -2.0>
        look_at <7 / 2, 0, 9 / 2>
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


#declare d = 0.020;

union {
	cylinder { <0,0,0>, <0,0,9>, d }
	cone { <0,0,9>, 2*d, <0,0,9.1> 0 }
	cylinder { <0,0,0>, <7,0,0>, d }
	cone { <7,0,0>, 2*d, <7.1,0,0> 0 }
	cylinder { <0,0,0>, <0,2.1,0>, d }
	cone { <0,2.1,0>, 2*d, <0,2.2,0>, 0 }
	pigment {
		color rgb <0.95,0.95,0.95>
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare schritte = 400;
#declare dx = 7 / schritte;
#declare dy = 9 / schritte;

#macro domainquad(xx)
	triangle {
		<xx     , -0.01, 0>,
		<xx + dx, -0.01, 0>,
		<xx     , -0.01, log(xx)>
	}
	triangle {
		<xx + dx, -0.01, 0>,
		<xx + dx, -0.01, log(xx + dx)>,
		<xx     , -0.01, log(xx)>
	}
#end

#declare xx = 1;
object {
mesh {
#while (xx < 7 - dx/2)
	domainquad(xx)
#declare xx = xx + dx;
#end
}
        pigment { color rgb <1,1,1> }
        finish {
                specular 0.9
                metallic
        }
}

#macro domainquadupper(xx)
	triangle {
		<xx     , 0, 0>,
		<xx + dx, 0, 0>,
		<xx     , 0, log(xx)>
	}
	triangle {
		<xx + dx, 0, 0>,
		<xx + dx, 0, log(xx + dx)>,
		<xx     , 0, log(xx)>
	}
#end

#declare xx = 1;
object {
mesh {
#while (xx < 7 - dx/2)
	domainquadupper(xx)
#declare xx = xx + dx;
#end
}
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

#macro ypos(xx, yy)
	log(xx) + yy * (9 - log(xx)) / 9
#end
#macro uu(xx, yy)
	1 - j0(yy * (9 - log(xx)) / 9)
#end

#macro surfacepoint(xx, yy)
	<xx, uu(xx, yy), ypos(xx, yy)>
#end

#macro surfacequad(xx, yy)
triangle {
	surfacepoint(xx     , yy     ),
	surfacepoint(xx + dx, yy     ),
	surfacepoint(xx + dx, yy + dy)
}
triangle {
	surfacepoint(xx     , yy     ),
	surfacepoint(xx + dx, yy + dy),
	surfacepoint(xx     , yy + dy)
}
#end

object {
mesh {
#declare xx = 1;
#while (xx < 7 - dx/2)
#declare yy = 0;
#while (yy < 9 - dy/2)
	surfacequad(xx, yy)
#declare yy = yy + dy;
#end
#declare xx = xx + dx;
#end
}
        pigment { color rgb <1,0,0> }
        finish {
		diffuse 0.7
                specular 0.9
                metallic
        }
}

#macro charpoint(xx, y0)
	<xx, 1 - j0(y0), y0 + log(xx)>
#end

#declare y0 = 0;

#while (y0 < 8)
union {
#declare xx = 1;
#while (xx < 7 - dx/2)
        sphere { charpoint(xx, y0), d }
        cylinder {
                charpoint(xx, y0),
                charpoint(xx + dx, y0),
                d
        }
#declare xx = xx + dx;
#end
        sphere { charpoint(xx, y0), d }
        pigment {
                color rgb <1,1,0>
        }
        finish {
                specular 0.9
                metallic
        }
}
#declare y0 = y0 + 0.2;
#end

