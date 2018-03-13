#include "cauchy.inc"

#declare d = 0.01;

// Loesungsflaeche

#macro surfacepoint(xx, yy)
	<xx, sin(yy - 0.5 * xx * xx) * exp(-xx), yy>
#end

#macro quad(xx, yy)
	triangle {
		surfacepoint(xx        , yy        ),
		surfacepoint(xx + xstep, yy        ),
		surfacepoint(xx + xstep, yy + ystep) 
	}
	triangle {
		surfacepoint(xx + xstep, yy + ystep),
		surfacepoint(xx        , yy + ystep),
		surfacepoint(xx        , yy        )
	}
#end

mesh {
	#declare xx = 0;
	#while (xx < (xmax - xstep/2))

	#declare yy = 0;
	#while (yy < (ymax - ystep/2))
		quad(xx, yy)
	#declare yy = yy + ystep/2;
	#end

	#declare xx = xx + xstep;
	#end
	pigment {
		color rgb<0.8, 0.8, 1>
	}
        finish {
                specular 0.9
                metallic
        }
}

#declare y0step = pi/12;
#declare y0 = -pi/2;
#while (y0 <= 3) 

#declare xx = 0;

intersection {
	union {
	#while (xx < (xmax - xstep / 2))
		sphere { surfacecharpoint(y0, xx), d }
		cylinder {
			surfacecharpoint(y0, xx),
			surfacecharpoint(y0, xx + xstep), d
		}
	#declare xx = xx + xstep;
	#end
		sphere { surfacecharpoint(y0, xx), d }
	}
	box { <-0.1,-0.5,-0.0>, <1.8,1.1,pi> }
	pigment { color rgb<1, 0, 0> }
        finish {
                specular 0.9
                metallic
        }
}
#declare y0 = y0 + y0step;
#end

