//
// burgers.inc -- burgers equation example
//
// (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#version 3.7;

#include "colors.inc"
#include "../../common/common.inc"

#declare imagescale = 0.17;
#declare at = 0.01;

camera {
        location <10, 6, -14>
        look_at <-0.1,0.5,2>
        right 16/9 * x * imagescale
        up y * imagescale
}

light_source {
        <1, 4, -3> color White
        area_light <0.1,0,0> <0,0,0.1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

arrow(<-2.3, 0, 0>, <2.4, 0, 0>, at, White)
arrow(<0,-0.1, 0>, <0, 1.2, 0>, at, White)
arrow(<0, 0, -0.1>, <0, 0, 4.3>, at, White)

#declare fplus = function(X) { (4*X+1+sqrt(16*X*X+1))/(8*X) };
#declare fminus = function(X) { (4*X+1-sqrt(16*X*X+1))/(8*X) };
#declare g = function(X) { (1/8) * (1/X + 1/(X-1)) };

#declare N = 100;

#declare y0min = 0.01;
#declare y0max = 0.99;
#declare y0r = (y0max - y0min) / 2;

#macro ganzeflaeche()
intersection {
	box { <-2.2, -0.1, 0>, <2.2, 1.1, 4> }
	mesh {
		#declare t0max = 4;
		#declare t0step = t0max / N;

		#declare phistep = pi / N;
		#declare y0previous = y0min;
		#declare x0previous = g(y0min);
		#declare phi = 0;
		#while (phi < pi - phistep/2)
			#declare y0 = y0min + (y0max - y0min) * phi / pi;
			#declare x0 = g(y0);

			#declare t0 = 0;
			#while (t0 < t0max - t0step/2)

				#declare A = <x0previous + t0 * y0previous,
					       y0previous,
					       t0>;
				#declare B = <x0previous + (t0 + t0step) * y0previous,
					      y0previous,
					      t0+t0step>;
				#declare C = <x0 + t0 * y0, y0, t0>;
				#declare D = <x0 + (t0 + t0step) * y0, y0, t0+t0step>;

				triangle { A, B, C }
				triangle { B, D, C }

				#declare t0 = t0 + t0step;
			#end
			#declare phi = phi + phistep;

			#declare y0previous = y0;
			#declare x0previous = x0;
		#end
	}
	pigment {
		color rgbf<1,0.7,0.7,0.3>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro anfangskurve()
union {
	#declare x0min = 0.01;
	#declare x0max = 2.2;
	#declare x0step = (x0max - x0min) / N;
	#declare x0 = x0min;
	#declare x0previous = 0;
	#declare uvalueprevious = 0.5;
	#while (x0 < x0max - x0step/2)
		#declare uvalue = fminus(x0);
		cylinder { <x0previous, uvalueprevious, 0>,
			   <x0, uvalue, 0>, at }
		sphere { <x0, uvalue, 0>, at }
		cylinder { <-x0previous, 1-uvalueprevious, 0>,
			   <-x0, 1-uvalue, 0>, at }
		sphere { <-x0, 1-uvalue, 0>, at }

		#declare x0previous = x0;
		#declare uvalueprevious = uvalue;
		#declare x0 = x0 + x0step;
	#end
	pigment {
		color rgb<0,0.4,0>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro kurven()
intersection {
	box { <-2.2, -0.1, 0>, <2.2, 1.1, 4> }
	union {
		cylinder { <0, 0.5, 0>, <0.5, 0.5, 1>, at }
		sphere { <0, 0.5, 0>, at }
		sphere { <0.5, 0.5, 1>, at }
		#declare ulprevious = < 0.5, 0.5, 1>;
		#declare urprevious = < 0.5, 0.5, 1>;

		#declare x0 = 0.001;
		#declare x0max = 5;
		#declare x0step = x0max / N;
		#while (x0 < x0max - x0step/2)
			#declare ulvalue = fminus(-x0);
			#declare urvalue = 1 - ulvalue;
			#declare t0 = 2*x0 / (1 - 2 * urvalue);
			#declare X = x0 + t0 * urvalue;
			#declare ul = <X, ulvalue, t0>;
			#declare ur = <X, urvalue, t0>;
			cylinder { ulprevious, ul, at }
			sphere { ul, at }
			cylinder { urprevious, ur, at }
			sphere { ur, at }
			#declare ulprevious = ul;
			#declare urprevious = ur;
			#declare x0 = x0 + x0step;
		#end
	}
	pigment {
		color Blue
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro flanke()
intersection {
	box { <-4, -0.1, 0>, <4, 1.1, 4> }
	mesh {
		#declare ulprevious = < 0.5, 0.5, 1>;
		#declare urprevious = < 0.5, 0.5, 1>;

		#declare x0 = 0.001;
		#declare x0max = 5;
		#declare x0step = x0max / N;
		#while (x0 < x0max - x0step/2)
			#declare ulvalue = fminus(-x0);
			#declare urvalue = 1 - ulvalue;
			#declare t0 = 2*x0 / (1 - 2 * urvalue);
			#declare X = x0 + t0 * urvalue;
			#declare ul = <X, ulvalue, t0>;
			#declare ur = <X, urvalue, t0>;
			triangle { urprevious, ur, ul }
			triangle { urprevious, ul, ulprevious }
			#declare ulprevious = ul;
			#declare urprevious = ur;
			#declare x0 = x0 + x0step;
		#end
	}
	pigment {
		color rgb<0.8,0.4,0.8>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro geraden(limitiert)
intersection {
	box { <-2.2, -0.1, 0>, <2.2, 1.1, 4> }
	union {
		#declare x0 = 0.25;
		#declare x0step = 0.25;
		#while (x0 < 6.1)
			#declare ulvalue = fminus(-x0);
			#declare urvalue = 1 - ulvalue;
			#declare T = x0 / (0.5 - urvalue);
			#declare t0 = 4;
			#declare t0 = limitiert * select(T-4, T, 4) + (1 - limitiert) * t0;

			cylinder { <x0, urvalue, 0>,
				   <x0 + urvalue * t0, urvalue, t0>, at }
			sphere { <x0, urvalue, 0>, at }
			sphere { <x0 + urvalue * t0, urvalue, t0>, at }
			cylinder { <-x0, ulvalue, 0>,
				   <-x0 + ulvalue * t0, ulvalue, t0>, at }
			sphere { <-x0, ulvalue, 0>, at }
			sphere { <-x0 + ulvalue * t0, ulvalue, t0>, at }
			
			#declare x0 = x0 + x0step;
		#end
	}
	pigment {
		color Yellow
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro streifenrechts(x0, x1, limitiert)
	#declare u0 = fminus(x0);
	#declare T0 = x0 / (0.5 - u0);
	#declare t0 = limitiert * select(T0 - 4, T0, 4) + (1 - limitiert) * 4;
	#declare t0step = t0 / N;

	#declare u1 = fminus(x1);
	#declare T1 = x1 / (0.5 - u1);
	#declare t1 = limitiert * select(T1 - 4, T1, 4) + (1 - limitiert) * 4;
	#declare t1step = t1 / N;

	#declare i = 0;
	#while (i < N)
		triangle {
			<x0 + u0 *  i    * t0step, u0,  i    * t0step>,
			<x1 + u1 *  i    * t1step, u1,  i    * t1step>,
			<x0 + u0 * (i+1) * t0step, u0, (i+1) * t0step>
		}
		triangle {
			<x1 + u1 *  i    * t1step, u1,  i    * t1step>,
			<x1 + u1 * (i+1) * t1step, u1, (i+1) * t1step>,
			<x0 + u0 * (i+1) * t0step, u0, (i+1) * t0step>
		}
		#declare i = i + 1;
	#end
#end

#macro streifenlinks(x0, x1, limitiert)
	#declare u0 = fminus(x0);
	#declare T0 = x0 / (0.5 - u0);
	#declare t0 = limitiert * select(T0 - 4, T0, 4) + (1 - limitiert) * 4;
	#declare t0step = t0 / N;

	#declare u1 = fminus(x1);
	#declare T1 = x1 / (0.5 - u1);
	#declare t1 = limitiert * select(T1 - 4, T1, 4) + (1 - limitiert) * 4;
	#declare t1step = t1 / N;

	#declare i = 0;
	#while (i < N)
		triangle {
			<x0 + u0 *  i    * t0step, u0,  i    * t0step>,
			<x1 + u1 *  i    * t1step, u1,  i    * t1step>,
			<x0 + u0 * (i+1) * t0step, u0, (i+1) * t0step>
		}
		triangle {
			<x1 + u1 *  i    * t1step, u1,  i    * t1step>,
			<x1 + u1 * (i+1) * t1step, u1, (i+1) * t1step>,
			<x0 + u0 * (i+1) * t0step, u0, (i+1) * t0step>
		}
		#declare i = i + 1;
	#end
#end

#macro sflaeche(limitiert, farbe)
intersection {
	box { <-2.2, -0.1, 0>, <2.2, 1.1, 4> }
	mesh {
		#declare x0 = 0.001;
		#declare x0step = 0.05;
		#while (x0 < 2.2)
			#declare x1 = x0 + x0step;
			streifenrechts(x0, x1, limitiert)
			#declare x0 = x1;
		#end
		#declare x0 = 0.001;
		#declare x0step = 0.05;
		#while (x0 < 6.2)
			#declare x1 = x0 + x0step;
			streifenlinks(-x0, -x1, limitiert)
			#declare x0 = x1;
		#end
	}
	pigment {
		color farbe
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

