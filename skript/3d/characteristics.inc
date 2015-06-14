#declare d = 0.01;

#declare y0 = 0;

#while (y0 < pi)
#declare u0 = 0;
#while (u0 <= 1.25) 

union {
#declare xx = 0;
#while (xx < (xmax - xstep/2))
	sphere { charpoint(y0, u0, xx), d }
	cylinder { charpoint(y0, u0, xx), charpoint(y0, u0, xx + xstep), d }
#declare xx = xx + xstep;
	sphere { charpoint(y0, u0, xx), d }
#end
	pigment {
		color rgb<1, 0, 0>
	}
}
#declare u0 = u0 + 0.25;
#end
#declare y0 = y0 + 0.25;
#end
