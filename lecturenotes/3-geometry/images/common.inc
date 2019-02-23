//
// common.inc
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#ifndef (show_grid)    #declare show_grid = false;    #end
#ifndef (show_surface) #declare show_surface = false; #end
#ifndef (show_normal)  #declare show_normal = false;  #end
#ifndef (show_tangent) #declare show_tangent = false; #end
#ifndef (show_red)     #declare show_red = false;     #end
#ifndef (show_legs)    #declare show_legs = false;    #end
#ifndef (show_lines)   #declare show_lines = false;   #end
#ifndef (show_steps)   #declare show_steps = false;   #end
#ifndef (show_center)  #declare show_center = false;  #end

#declare at = 0.03;
#declare imagescale = 0.205;

#macro surface(xx,yy)
	<xx, 0.125*xx*xx + 0.133*yy*yy, yy>
#end
#declare dsurfacedx = function(xx,yy) { dxfactor * 2 * 0.125 * xx };
#declare dsurfacedy = function(xx,yy) { dyfactor * 2 * 0.133 * yy };
#macro tx(xx,yy)
	<1,dsurfacedx(xx,yy),0>
#end
#macro ty(xx,yy)
	<1,0,dsurfacedy(xx,yy)>
#end
#macro n(xx,yy)
	<-dsurfacedx(xx,yy), 1, -dsurfacedy(xx,yy)>
#end

camera {
	location <-1.8, 4.3, -10>
	look_at <1.8,0.5,1.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-1, 4, -3> color White
	area_light <0.1,0,0> <0,0,0.1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

arrow(0, <3.5,0,0>, at, White)
arrow(0, <0,0,3.5>, at, White)
arrow(0, <0,2.2,0>, at, White)
union {
	#declare xx = xgridspacing;
	#while (xx < 3.3)
		cylinder { <xx-0.2*at,0,0>, <xx+0.2*at,0,0>, 1.2 * at }
		#declare xx = xx + xgridspacing;
	#end
	#declare yy = ygridspacing;
	#while (yy < 3.3)
		cylinder { <0,0,yy-0.2*at>, <0,0,yy+0.2*at>, 1.2 * at }
		#declare yy = yy + ygridspacing;
	#end
	#declare zz = 0.2;
	#while (zz <= 2.1)
		cylinder { <0,zz-0.2*at,0>, <0,zz+0.2*at,0>, 1.2 * at }
		#declare zz = zz + 0.2;
	#end
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}

#declare C = surface(1,1);

#if (show_center)
sphere { C, 1.6 * at
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_red)
union {
	#declare dir = <1,dsurfacedx(1,1), 0>;
	#declare A = C - 1 * dir;
	#declare B = C + 2 * dir;
	cylinder { A, B, at/2 }
	sphere { A, at/2 }
	sphere { B, at/2 }
	cylinder { C + <1,0,0>, C + dir, at / 2 }
	#declare dir = <0,dsurfacedy(1,1), 1>;
	#declare A = C - 1 * dir;
	#declare B = C + 2 * dir;
	cylinder { A, B, at/2 }
	sphere { A, at/2 }
	sphere { B, at/2 }
	cylinder { C + <0,0,1>, C + dir, at / 2 }
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_legs)
union {
	sphere { C, 1.5 * at }
	cylinder { C, C + <1,0,0>, at }
	sphere { C + <1,0,0>, at }
	cylinder { C, C + <0,0,1>, at }
	sphere { C + <0,0,1>, at }
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_surface)
mesh {
	// surface
	#declare xstep = (xmax - xmin) / nsteps;
	#declare ystep = (ymax - ymin) / nsteps;
	#declare xx = xmin;
	#while (xx < (xmax - xstep/2))
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			triangle {
				surface(xx        , yy        ),
				surface(xx + xstep, yy        ),
				surface(xx + xstep, yy + ystep)
			}
			triangle {
				surface(xx        , yy        ),
				surface(xx + xstep, yy + ystep),
				surface(xx        , yy + ystep)
			}
			#declare yy = yy + ystep;
		#end
		#declare xx = xx + xstep;
	#end
	pigment {
		color rgbf<0.6,0.6,1,0.4>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_grid)
union {
	// y surface grid lines
	#declare xx = xmin;
	#while (xx <= xmax)
		#declare yy = ymin;
		#while (yy < (ymax - ystep/2))
			sphere { surface(xx, yy), 0.2 * at }
			cylinder {
				surface(xx, yy        ),
				surface(xx, yy + ystep),
				0.2 * at
			}
			#declare yy = yy + ystep;
		#end
		sphere { surface(xx, yy), 0.2 * at }
		#declare xx = xx + xgridspacing;
	#end
	#declare yy = ymin;
	#while (yy <= ymax)
		#declare xx = xmin;
		#while (xx < (xmax - xstep/2))
			sphere { surface(xx, yy), 0.2 * at }
			cylinder {
				surface(xx        , yy),
				surface(xx + xstep, yy),
				0.2 * at
			}
			#declare xx = xx + xstep;
		#end
		sphere { surface(xx, yy), 0.2 * at }
		#declare yy = yy + ygridspacing;
	#end
	pigment {
		color rgb<0.6,0.6,1>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_lines)
union {
	#declare xx = 1;
	#declare yy = ymin;
	#while (yy < (ymax - ystep/2))
		sphere { surface(xx, yy), 0.25 * at }
		cylinder {
			surface(xx, yy        ),
			surface(xx, yy + ystep),
			0.25 * at
		}
		#declare yy = yy + ystep;
	#end
	sphere { surface(xx, yy), 0.25 * at }
	#declare yy = 1;
	#declare xx = xmin;
	#while (xx < (xmax - xstep/2))
		sphere { surface(xx, yy), 0.25 * at }
		cylinder {
			surface(xx        , yy),
			surface(xx + xstep, yy),
			0.25 * at
		}
		#declare xx = xx + xstep;
	#end
	sphere { surface(xx, yy), 0.25 * at }
	pigment {
		color Blue
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_normal)
arrow(surface(1,1), surface(1,1) + n(1,1), at, Green)
#end

#if (show_steps)
union {
	#declare D = C + <0,1,0>;
	cylinder { C, D, at/2 }
	sphere { D, at/2 }
	cylinder {
		D,
		D + <-dsurfacedx(1,1),0,0>,
		at/2
	}
	sphere { D + <-dsurfacedx(1,1),0,0>, at/2 }
	cylinder {
		D + <-dsurfacedx(1,1),0,0>,
		D + <-dsurfacedx(1,1),0,-dsurfacedy(1,1)>,
		at/2
	}
	sphere { D + <-dsurfacedx(1,1),0,-dsurfacedy(1,1)>, at/2 }
	pigment {
		color Green
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#if (show_tangent)
mesh {
	#declare dirx = <1, dsurfacedx(1,1), 0>;
	#declare diry = <0, dsurfacedy(1,1), 1>;
	triangle {
		C - 0.5 * dirx - 0.5 * diry,
		C + 0.5 * dirx - 0.5 * diry,
		C + 0.5 * dirx + 0.5 * diry
	}
	triangle {
		C - 0.5 * dirx - 0.5 * diry,
		C + 0.5 * dirx + 0.5 * diry,
		C - 0.5 * dirx + 0.5 * diry
	}
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
#end
