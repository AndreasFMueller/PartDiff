#declare d = 0.01;

#declare y0 = 0;

#while (y0 < pi)
#declare u0 = 0;
#while (u0 <= 1.25) 
parametric {
	function { u }
	function { u0 * exp(-u) + d * sin(v) }
	function { y0 + 0.5 * u * u + d * cos(v) }
	<0, 0>, <1.8, 2 * pi>
	contained_by {
		box {
			<-0.1, -0.1, -0.1>, <1.8,1.4,pi>
		}
	}
	precompute 18 x,y,z
	pigment {
		color rgb<1, 0, 0>
	}
}
#declare u0 = u0 + 0.25;
#end
#declare y0 = y0 + 0.25;
#end
