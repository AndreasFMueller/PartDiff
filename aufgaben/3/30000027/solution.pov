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

#declare imagescale = 1.03;
#declare at = 0.012;
#declare curver = 0.018;
#declare gridr = 0.005;

#declare Cameracenter = <-4.5,3,0.5>;
#declare Worldpoint = <0, 0, 0.5>;
#declare Lightsource = <-3,10,-1>;
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

#declare ymin = 1;
#declare ymax = 3;
#declare xmin = -2;
#declare xmax = 2;

#macro punkt(X,Y)
	< X, X * tanh(ln(Y)) + 1 / cosh(ln(Y)), Y >
#end

#macro charpunkt(x0, T)
	< x0 * cosh(T) + sinh(T), x0 * sinh(T) + cosh(T), exp(T) >
#end

#macro charpunkt0(y0, T)
	< y0 * cosh(T) + sinh(T), 0, exp(T) >
#end

mesh {
	#declare ystep = 0.05;
	#declare xstep = 0.05;

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
		color Gray transmit 0.2
	}
	finish {
		specular 0.99
		metallic
	}
}

#macro characteristic(x0, r)
	#declare tstep = 0.01;
	#declare T = 0;
	#declare tmax = ln(ymax);
	#declare p = charpunkt(x0, T);
	sphere { p, r }
	#while (T < tmax - tstep/2)
		#declare oldp = p;
		#declare T = T + tstep;
		#declare p = charpunkt(x0, T);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

#macro characteristic0(x0, r)
	#declare tstep = 0.01;
	#declare T = 0;
	#declare tmax = ln(ymax);
	#declare p = charpunkt0(x0, T);
	sphere { p, r }
	#while (T < tmax - tstep/2)
		#declare oldp = p;
		#declare T = T + tstep;
		#declare p = charpunkt0(x0, T);
		sphere { p, r }
		cylinder { oldp, p, r }
	#end
#end

//intersection {
//	box { <0, -10, ymin>, <xmax, 10, ymax> }
	union {
		#declare xstep = 0.5;
		#declare x0 = xmin;
		#while (x0 <= xmax)
			characteristic(x0, curver)
			#declare x0 = x0 + xstep;
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
		#declare xstep = 0.5;
		#declare x0 = xmin;
		#while (x0 <= xmax)
			characteristic0(x0, at)
			#declare x0 = x0 + xstep;
		#end
		pigment {
			color rgb<1.0,0.6,0.6>
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
	#declare xstep = 0.1;
	#declare X = xmin;
	#declare p = punkt(X, 1);
	sphere { p, curver }
	#while (X < xmax - xstep/2)
		#declare oldp = p;
		#declare X = X + xstep;
		#declare p = punkt(X, 1);
		sphere { p, curver }
		cylinder { oldp, p, curver }
		#declare X = X + xstep;
	#end
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

arrow(<-2.1, 0,    0  >, < 2.1, 0, 0   >, at, White)
arrow(< 0,   0,   -0.1>, < 0,   0, 3.1 >, at, White)
arrow(< 0,  -0.1,  0  >, < 0,   2, 0   >, at, White)

//
// coordinate grid
//
union {
	#declare xstep = 0.2;
	#declare X = xmin;
	#while (X < xmax + xstep/2)
		cylinder { <X, 0, 0>, <X, 0, ymax>, gridr }
		sphere { <X, 0, ymax>, gridr }
		#declare X = X + xstep;
	#end
	#declare ystep = 0.2;
	#declare Y = 0;
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
	triangle { <-2, 0, 0>, <2, 0, 0>, <2, 0, 3> }
	triangle { <-2, 0, 0>, <2, 0, 3>, <-2, 0, 3> }
	pigment {
		color rgb<0.6,0.8,1.0> transmit 0.7
	}
	finish {
		specular 0.99
		metallic
	}
}

union {
	cylinder { <-2,0,1>, <2,0,1>, at }
	sphere { <-2, 0, 1>, at }
	sphere { <2, 0, 1>, at }
	pigment {
		color rgb<0.4,0.8,0.6>
	}
	finish {
		specular 0.99
		metallic
	}
}
