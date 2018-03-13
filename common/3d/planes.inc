
#declare w = 0.04;
#declare h = 0.0001;

#declare x0 = 0;
#while (x0 < 1.8)

#declare y0 = 0;
#while (y0 <= pi)

#declare z0 = 0;
#while (z0 <= 1.4)

#declare a = 0;
#while (a < 180)

#declare v1 = vnormalize(<1, -z0, x0>);
#declare v2 = vaxis_rotate(vcross(v1 , <0, 1, 0>), v1, a);
#declare v3 = vcross(v1, v2);
#declare c = <x0, z0, y0>;

object {
	box {
		<-w,-h,-1.4 * w>, <w,h,1.4 * w>
		pigment {
			color rgb<1,1,0>
		}
		matrix <v1.x, v1.y, v1.z,
			v3.x, v3.y, v3.z,
			v2.x, v2.y, v2.z,
			c.x, c.y, c.z>
	}
}

#declare a = a + 45;
#end

#declare z0 = z0 + 0.25;
#end

#declare y0 = y0 + 0.25;
#end

#declare x0 = x0 + 0.25;
#end
