//
// common.inc
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//

#declare imagescale = 0.075;
#declare at = 0.015;

camera {
        location < -19, 21.5, -45  >
        look_at  <  -0.02,  0,   0>
        right 9/16 * x * imagescale
        up y * imagescale
}

light_source {
        <-5, 7, -5> color White
        area_light <1, 0, 0> <0, 0, 1>, 10, 10
        adaptive 1
        jitter
}

sky_sphere {
        pigment {
                color rgb<1,1,1>
        }
}

#ifndef (show_domain) #declare show_domain = false; #end
#ifndef (show_domain_boundary) #declare show_domain_boundary = false; #end
#ifndef (show_boundary) #declare show_boundary = false; #end
#ifndef (show_r_boundary) #declare show_r_boundary = false; #end
#ifndef (show_r_surface) #declare show_r_surface = false; #end
#ifndef (show_p_surface) #declare show_p_surface = false; #end
#ifndef (show_p_boundary) #declare show_p_boundary = false; #end
#ifndef (show_solution) #declare show_solution = false; #end

#declare Up = function(xx, yy) { xx*xx + yy*yy };
#declare Ur = function(xx, yy) { 0.5 * xx - 1/2 };
#declare U = function(xx, yy) { Ur(xx, yy) + Up(xx, yy) };

#macro loesungp(phi, r)
	<r * cos(phi), Up(r * cos(phi), r * sin(phi)), r * sin(phi)>
#end

#macro loesungr(phi, r)
	<r * cos(phi), Ur(r * cos(phi), r * sin(phi)), r * sin(phi)>
#end

#macro loesung(phi, r)
	<r * cos(phi), U(r * cos(phi), r * sin(phi)), r * sin(phi)>
#end

arrow(<-1.2,0,0>, <1.2,0,0>, at, White)
arrow(<0,-1.2,0>, <0,1.6,0>, at, White)
arrow(<0,0,-1.2>, <0,0,1.2>, at, White)

#declare tt = 1.9*at;
union {
	cylinder { < 0.995, 0    , 0    >, < 1.005, 0    , 0    >, tt }
	cylinder { <-0.995, 0    , 0    >, <-1.005, 0    , 0    >, tt }
	cylinder { < 0    , 0    , 0.995>, < 0    , 0    , 1.005>, tt }
	cylinder { < 0    , 0    ,-0.995>, < 0    , 0    ,-1.005>, tt }
	cylinder { < 0    , 0.995, 0    >, < 0    , 1.005, 0    >, tt }
	cylinder { < 0    ,-0.995, 0    >, < 0    ,-1.005, 0    >, tt }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare nsteps = 100;

#declare phistep = pi / nsteps;

//
// domain area
//
#if (show_domain)
mesh {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		triangle {
			<0,0,0>,
			<cos(phi), 0, sin(phi)>, 
			<cos(phi + phistep), 0, sin(phi + phistep)>
		}
		#declare phi = phi + phistep;
	#end
	pigment {
		color rgb<0.6, 0.6, 1>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// domain boundary
//
#if (show_domain_boundary)
union {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare A = <cos(phi), 0, sin(phi)>;
		sphere { A, at }
		#declare phi = phi + phistep;
		#declare B = <cos(phi+phistep), 0, sin(phi+phistep)>;
		cylinder { A, B, at }
	#end
	pigment {
		color Blue
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// U boundary
//
#if (show_boundary)
union {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare A = loesung(phi, 1);
		sphere { A, at }
		#declare phi = phi + phistep;
		#declare B = loesung(phi, 1);
		cylinder { A, B, at }
	#end
	pigment {
		color rgb<1.0,0.2,0.4>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// Ur boundary
//
#if (show_r_boundary)
union {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare A = loesungr(phi, 1);
		sphere { A, at }
		#declare phi = phi + phistep;
		#declare B = loesungr(phi, 1);
		cylinder { A, B, at }
	#end
	pigment {
		color rgb<0.2,0.6,0.2>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// Up boundary
//
#if (show_p_boundary)
union {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare A = loesungp(phi, 1);
		sphere { A, at }
		#declare phi = phi + phistep;
		#declare B = loesungp(phi, 1);
		cylinder { A, B, at }
	#end
	pigment {
		color rgb<1,0.6,0>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#declare rmin = 0.00001;
#declare rmax = 1;
#declare rstep = (rmax - rmin) / nsteps;

//
// Ur surface
//
#if (show_r_surface)
mesh {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare r = rmin;
		#while (r < rmax - rstep/2)
			#declare A = loesungr(phi, r);
			#declare B = loesungr(phi + phistep, r);
			#declare r = r + rstep;
			#declare C = loesungr(phi, r);
			#declare D = loesungr(phi + phistep, r);
			triangle { A, B, D }
			triangle { A, D, C }
		#end
		#declare phi = phi + phistep;
	#end
	pigment {
		color rgb<0.6,1.0,0.8>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// Up surface
//
#if (show_p_surface)
mesh {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare r = rmin;
		#while (r < rmax - rstep/2)
			#declare A = loesungp(phi, r);
			#declare B = loesungp(phi + phistep, r);
			#declare r = r + rstep;
			#declare C = loesungp(phi, r);
			#declare D = loesungp(phi + phistep, r);
			triangle { A, B, D }
			triangle { A, D, C }
		#end
		#declare phi = phi + phistep;
	#end
	pigment {
		color rgb<1.0,0.8,0.6>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

//
// final solution
//
#if (show_solution)
mesh {
	#declare phi = 0;
	#while (phi < (2 * pi - phistep/2))
		#declare r = rmin;
		#while (r < rmax - rstep/2)
			#declare A = loesung(phi, r);
			#declare B = loesung(phi + phistep, r);
			#declare r = r + rstep;
			#declare C = loesung(phi, r);
			#declare D = loesung(phi + phistep, r);
			triangle { A, B, D }
			triangle { A, D, C }
		#end
		#declare phi = phi + phistep;
	#end
	pigment {
		color rgb<1.0,0.8,0.8>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end
