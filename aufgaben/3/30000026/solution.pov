//
// 3dimage.pov
//
// (c) 2022 Prof Dr Andreas Müller
//
#version 3.7;
#include "colors.inc"
#include "skies.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.4;
#declare at = 0.012;
#declare curver = 0.018;
#declare gridr = 0.005;

#declare Cameracenter = <1.5,2,-6>;
#declare Worldpoint = <1.5, 0, 0>;
#declare Lightsource = <1,10,-8>;
#declare Lightdirection = vnormalize(Lightsource - Worldpoint);
#declare Lightaxis1 = vnormalize(vcross(Lightdirection, <0,1,0>));
#declare Lightaxis2 = vnormalize(vcross(Lightaxis1, Lightdirection));

camera {
	location Cameracenter
	look_at Worldpoint
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	Lightsource color White
	area_light Lightaxis1 Lightaxis2, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color White
	}
}

#declare xmin = 1;
#declare xmax = 3;
#declare ymin = -2;
#declare ymax = 2;

#macro punkt(X,Y)
	< X, Y * tanh(ln(X)), Y >
#end

#macro charpunkt(y0, T)
	< exp(T), y0 * sinh(T), y0 * cosh(T) >
#end

#macro charpunkt0(y0, T)
	< exp(T), 0, y0 * cosh(T) >
#end

mesh {
	#declare xstep = 0.05;
	#declare ystep = 0.05;

	#declare X = xmin;
	#while (X < xmax - xstep/2)
		#declare Y = ymin;
		#while (Y < ymax - ystep/2)
			triangle {
				punkt(X,         Y),
				punkt(X + xstep, Y),
				punkt(X + xstep, Y + ystep)
			}
			triangle {
				punkt(X,         Y),
				punkt(X + xstep, Y + ystep),
				punkt(X,         Y + ystep)
			}
			#declare Y = Y + ystep;
		#end
		#declare X = X + xstep;
	#end
	pigment {
		color Gray transmit 0.2
	}
	finish {
		specular 0.99
		metallic
	}
}

#macro characteristic(y0, r)
	#declare tstep = 0.01;
	#declare T = 0;
	#declare tmax = ln(xmax);
	#declare p = charpunkt(y0, T);
	sphere { p, r }
	#while (T < tmax - tstep/2)
		#declare oldp = p;
		#declare T = T + tstep;
		#declare p = charpunkt(y0, T);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

#macro characteristic0(y0, r)
	#declare tstep = 0.01;
	#declare T = 0;
	#declare tmax = ln(xmax);
	#declare p = charpunkt0(y0, T);
	sphere { p, r }
	#while (T < tmax - tstep/2)
		#declare oldp = p;
		#declare T = T + tstep;
		#declare p = charpunkt0(y0, T);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

//intersection {
//	box { <0, -10, ymin>, <xmax, 10, ymax> }
	union {
		#declare ystep = 0.5;
		#declare y0 = ymin;
		#while (y0 <= ymax)
			characteristic(y0, curver)
			#declare y0 = y0 + ystep;
		#end
		pigment {
			color Red
		}
		finish {
			specular 0.99
			metallic
		}
	}
//}

	union {
		#declare ystep = 0.5;
		#declare y0 = ymin;
		#while (y0 <= ymax)
			characteristic0(y0, at)
			#declare y0 = y0 + ystep;
		#end
		pigment {
			color rgb<1.0,0.6,0.6>
		}
		finish {
			specular 0.99
			metallic
		}
	}

union {
	#declare ystep = 0.1;
	#declare Y = ymin;
	#declare p = punkt(1, Y);
	sphere { p, curver }
	#while (Y < ymax - ystep/2)
		#declare oldp = p;
		#declare Y = Y + ystep;
		#declare p = punkt(1, Y);
		sphere { p, curver }
		cylinder { oldp, p, curver }
		#declare Y = Y + ystep;
	#end
	pigment {
		color rgb<0,0.6,0>
	}
	finish {
		metallic
		specular 0.99
	}
}


#macro xcurve(Y)
	#declare X = xmin;
	#declare xstep = 0.05;
	#declare p = punkt(X, Y);
	sphere { p, gridr }
	#while (X < xmax - xstep / 2)
		#declare oldp = p;
		#declare X = X + xstep;
		#declare p = punkt(X, Y);
		sphere { p, gridr }
		cylinder { oldp, p, gridr }
	#end
#end

#macro ycurve(X)
	#declare Y = ymin;
	#declare ystep = 0.05;
	#declare p = punkt(X, Y);
	sphere { p, gridr }
	#while (Y < ymax - ystep / 2)
		#declare oldp = p;
		#declare Y = Y + ystep;
		#declare p = punkt(X, Y);
		sphere { p, gridr }
		cylinder { oldp, p, gridr }
	#end
#end

union {
	#declare Yg = ymin;
	#while (Yg < ymax + 0.1)
		xcurve(Yg)
		#declare Yg = Yg + 0.2;
	#end
	#declare Xg = xmin;
	#while (Xg < xmax + 0.1)
		ycurve(Xg)
		#declare Xg = Xg + 0.2;
	#end
	pigment {
		color Gray
	}
	finish {
		metallic
		specular 0.99
	}
}

//
// draw an arrow from <from> to <to> with thickness <arrowthickness> with
// color <c>
//
#macro arrow(from, to, arrowthickness, c)
	#declare arrowdirection = vnormalize(to - from);
	#declare arrowlength = vlength(to - from);
	union {
		sphere {
			from, 1.1 * arrowthickness
		}
		cylinder {
			from,
			from + (arrowlength - 5 * arrowthickness) * arrowdirection,
			arrowthickness
		}
		cone {
			from + (arrowlength - 5 * arrowthickness) * arrowdirection,
			2 * arrowthickness,
			to,
			0
		}
		pigment {
			color c
		}
		finish {
			specular 0.9
			metallic
		}
	}
#end

arrow(<-0.1, 0,  0  >, < 3.2, 0, 0   >, at, White)
arrow(< 0,   0, -2.1>, < 0,   0, 2.1 >, at, White)
arrow(< 0,  -1,  0  >, < 0,   1, 0   >, at, White)

union {
	#declare ystep = 0.2;
	#declare Y = ymin;
	#while (Y < ymax + ystep/2)
		cylinder { <0, 0, Y>, <xmax, 0, Y>, gridr }
		sphere { <xmax, 0, Y>, gridr }
		#declare Y = Y + ystep;
	#end
	#declare xstep = 0.2;
	#declare X = 0;
	#while (X < xmax + xstep/2)
		cylinder { <X, 0, ymin>, <X, 0, ymax>, gridr }
		sphere { <X, 0, ymin>, gridr }
		sphere { <X, 0, ymax>, gridr }
		#declare X = X + xstep;
	#end
	pigment {
		color rgb<0.6,0.8,1.0>
	}
	finish {
		specular 0.99
		metallic
	}
}
