//
// cone.inc -- cone of tangent planes defined by PDE
//
// (c) 2019 Prof Dr Andreas Müller, Hochschule Rapperswil
//
#declare imagescale = 0.205;
#declare at = 0.15;
#declare xgridspacing = 1;
#declare ygridspacing = 1;

#ifndef (show_grid)  #declare show_grid = true;  #end
#ifndef (show_cone)  #declare show_cone = true;  #end
#ifndef (show_plane) #declare show_plane = true; #end
#ifndef (show_axes)  #declare show_axes = true;  #end

camera {
	location < -9, 21.5, -50  >
	look_at  <  9,  2.5,   7.5>
	right 16/9 * x * imagescale
	up y * imagescale
}

light_source {
	<-5, 20, -15> color White
	area_light <1, 0, 0> <0, 0, 1>, 10, 10
	adaptive 1
	jitter
}

sky_sphere {
	pigment {
		color rgb<1,1,1>
	}
}

#declare Xa = 6;
#declare Ya = 4;

#if (show_axes)
arrow(0, <17.5,  0, 0  >, at, White)
arrow(0, < 0.0,  0,17.5>, at, White)
arrow(0, < 0.0, 11, 0  >, at, White)
union {
	#declare xx = xgridspacing;
	#while (xx < 17)
		cylinder {
			<xx - 0.2 * at, 0, 0>,
			<xx + 0.2 * at, 0, 0>,
			1.2 * at
		}
		#declare xx = xx + xgridspacing;
	#end
	#declare yy = ygridspacing;
	#while (yy < 17)
		cylinder {
			<0, 0, yy - 0.2 * at>,
			<0, 0, yy + 0.2 * at>,
			1.2 * at
		}
		#declare yy = yy + ygridspacing;
	#end
	#declare zz = 1;
	#while (zz <= 10)
		cylinder {
			<0, zz - 0.2 * at, 0>,
			<0, zz + 0.2 * at, 0>,
			1.2 * at
		}
		#declare zz = zz + 1;
	#end
	pigment {
		color White
	}
	finish {
		specular 0.9
		metallic
	}
}
#end

#macro gridpoint(X, Y, Z)
#declare C = <X, Z, Y>;
#if (show_grid)
union {
	sphere { C, 0.1 }

	sphere { <0, Z, Y>, at / 2 }
	sphere { <X, Z, 0>, at / 2 }
	sphere { <X, 0, Y>, at / 2 }

	cylinder { <X, 0, 0>, <X, Z, 0>, at / 2 }
	cylinder { <X, 0, 0>, <X, 0, Y>, at / 2 }

	cylinder { <0, Z, 0>, <X, Z, 0>, at / 2 }
	cylinder { <0, Z, 0>, <0, Z, Y>, at / 2 }

	cylinder { <0, 0, Y>, <0, Z, Y>, at / 2 }
	cylinder { <0, 0, Y>, <X, 0, Y>, at / 2 }

	cylinder { <0, Z, Y>, <X, Z, Y>, at / 2 }
	cylinder { <X, Z, 0>, <X, Z, Y>, at / 2 }
	cylinder { <X, 0, Y>, <X, Z, Y>, at / 2 }
	pigment {
		color Red
	}
	finish {
		specular 0.9
		metallic
	}
}
#end
#end

#declare r = 4;

#macro charcone(X, Y, Z)
#declare C = <X, Z, Y>;
#if (show_cone)
#declare Xh = Xa / X;
#declare Yh = Ya / Y;
#macro coneline(phi)
	<Xh * cos(radians(phi)), 1, Yh * sin(radians(phi))>
#end
mesh {
	#declare phistep = 1;
	#declare phi = 0;
	#while (phi < 360 - (phistep/2))
		#declare rphi = radians(phi);
		triangle {
			C,
			C + r * coneline(phi),
			C + r * coneline(phi + phistep)
		}
		triangle {
			C,
			C - r * coneline(phi),
			C - r * coneline(phi + phistep)
		}
		#declare phi = phi + phistep;
	#end
	pigment {
		color Orange
	}
	finish {
		specular 0.9
		metallic
	}
}
#end
#end

#macro charplane(X, Y, Z, a) 
#declare C = <X, Z, Y>;
#if (show_plane)
mesh {
	#declare Xh = Xa / X;
	#declare Yh = Ya / Y;
	#declare n = <cos(radians(a)) / Xh, -1., sin(radians(a)) / Yh>;
	#declare n0 = vnormalize(n);
	#declare R = r / sqrt(1 - n0.y * n0.y);
	#declare xdir = R * vnormalize(vcross(n0, <0, 1, 0>));
	#declare ydir = R * vnormalize(vcross(n0, xdir));
	triangle {
		C - xdir - ydir,
		C + xdir - ydir,
		C + xdir + ydir
	}
	triangle {
		C - xdir - ydir,
		C + xdir + ydir,
		C - xdir + ydir
	}
	pigment {
		color rgb<0.4,0.4,1>
	}
	finish {
		specular 0.9
		metallic
	}
}
#end
#end


