//
// solution.pov
//
// (c) 2022 Prof Dr Andreas Müller
//
#version 3.7;
#include "colors.inc"
#include "skies.inc"

global_settings {
        assumed_gamma 1
}

#declare imagescale = 0.51;
#declare at = 0.012;
#declare curver = 0.018;
#declare gridr = 0.005;

#declare Cameracenter = <-4.5,3,0.5>;
#declare Worldpoint = <0, 1.282, 0.05>;
#declare Lightsource = <-20,10,5>;
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

#declare ymin = -2;
#declare ymax = 2;
#declare xmin = 0;
#declare xmax = 4;

#macro punkt(X,Y)
	< X, sqrt(X + Y * Y * exp(-2 * X)), Y >
#end

#macro charpunkt(X, y0)
	punkt(X, y0 * exp(X))
#end

#macro charpunkt0(X, y0)
	< X, 0, y0 * exp(X) >
#end

mesh {
	#declare ystep = 0.025;
	#declare xstep = 0.025;

	#declare Y = ymin;
	#while (Y < ymax - ystep/2)
		#declare X = xmin;
		#while (X < xmax - xstep/2)
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
			#declare X = X + xstep;
		#end
		#declare Y = Y + ystep;
	#end
	pigment {
		color rgb<0.6,0.8,1> transmit 0.2
	}
	finish {
		specular 0.99
		metallic
	}
}

#macro characteristic(y0, r, xlimit)
	#declare xstep = (sqrt(xlimit) - xmin) / 40;
	#declare X = 0;
	#declare p = charpunkt(X, y0);
	sphere { p, r }
	#while (X < sqrt(xlimit) - xstep/2)
		#declare oldp = p;
		#declare X = X + xstep;
		#declare p = charpunkt(X * X, y0);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

union {
	characteristic(0, curver, 4)
	#declare ystep = 0.20;
	#declare y0 = ystep;
	#while (y0 <= ymax - ystep)
		#declare xlimit = ln(2/y0);
		characteristic(y0, curver, xlimit)
		characteristic(-y0, curver, xlimit)
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

#macro characteristic0(y0, r, xlimit)
	#declare xstep = (xlimit - xmin) / 20;
	#declare X = 0;
	#declare p = charpunkt0(X, y0);
	sphere { p, r }
	#while (X < xlimit - xstep/2)
		#declare oldp = p;
		#declare X = X + xstep;
		#declare p = charpunkt0(X, y0);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

union {
	characteristic0(0, curver, 4)
	#declare ystep = 0.20;
	#declare y0 = ystep;
	#while (y0 <= ymax - ystep)
		#declare xlimit = ln(2/y0);
		characteristic0(y0, curver, xlimit)
		characteristic0(-y0, curver, xlimit)
		#declare y0 = y0 + ystep;
	#end
	pigment {
		color rgb<0.8,0.4,0.6>
	}
	finish {
		specular 0.99
		metallic
	}
}


//
// Cauchy initial curve
//
#declare darkgreen = rgb<0,0.6,0>;
union {
	sphere { <0, 2, -2>, curver }
	sphere { <0, 2, 2>, curver }
	sphere { <0, 0, 0>, curver }
	cylinder { <0, 0, 0>, <0, 2, -2>, curver }
	cylinder { <0, 0, 0>, <0, 2, 2>, curver }
	pigment {
		color darkgreen
	}
	finish {
		metallic
		specular 0.99
	}
}

//
// coordinate grid on surface
//
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

union {
	#declare Xg = xmin;
	#while (Xg < xmax + 0.1)
		ycurve(Xg)
		#declare Xg = Xg + 0.2;
	#end
	#declare Yg = ymin;
	#while (Yg < ymax + 0.1)
		xcurve(Yg)
		#declare Yg = Yg + 0.2;
	#end
	pigment {
		color rgb<0.6,0.8,1>
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

arrow(<-0.1, 0,    0  >, < 4.1, 0, 0   >, at, White)
arrow(< 0,   0,   -2.1>, < 0,   0, 2.1 >, at, White)
arrow(< 0,  -0.1,  0  >, < 0,   2, 0   >, at, White)

//
// coordinate grid
//
union {
	#declare xstep = 0.2;
	#declare X = xmin;
	#while (X < xmax + xstep/2)
		cylinder { <X, 0, ymin>, <X, 0, ymax>, gridr }
		sphere { <X, 0, ymax>, gridr }
		#declare X = X + xstep;
	#end
	#declare ystep = 0.2;
	#declare Y = ymin;
	#while (Y < ymax + ystep/2)
		cylinder { <xmin, 0, Y>, <xmax, 0, Y>, gridr }
		sphere { <xmin, 0, Y>, gridr }
		sphere { <xmax, 0, Y>, gridr }
		#declare Y = Y + ystep;
	#end
	pigment {
		color rgb<0.6,0.8,1.0>
	}
	finish {
		specular 0.99
		metallic
	}
}

mesh {
	triangle { <0, 0, -2>, <4, 0, -2>, <4, 0, 2> }
	triangle { <0, 0, -2>, <4, 0, 2>, <0, 0, 2> }
	pigment {
		color rgb<0.6,0.8,1.0> transmit 0.7
	}
	finish {
		specular 0.99
		metallic
	}
}

