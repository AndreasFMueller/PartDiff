//
// common.inc -- some common useful tools for drawing 3d images
//
// (c) 2018 Prof Dr Andreas Müller, Hochschule Rapperswil
//

//
// draw a right angle quarter circle at point <o> with legs <v1> and <v2> and 
// color <c>
//
#declare rechterwinkelradius = 0.5;
#declare rechterwinkelthickness = 0.01;
#macro rechterwinkel(o, v1, v2, c)
intersection {
	sphere { o, rechterwinkelradius }
	#declare rnormale = vnormalize(vcross(v1, v2));
	plane { rnormale, vdot(o, rnormale) + rechterwinkelthickness * rechterwinkelradius / 0.5 }
	plane { -rnormale, -vdot(o, rnormale) + rechterwinkelthickness * rechterwinkelradius / 0.5 }
	plane { -v1, -vdot(o, v1) }
	plane { -v2, -vdot(o, v2) }
	pigment {
		color c
	}
}
sphere { o + 0.45 * (vnormalize(v1) +vnormalize(v2)) * rechterwinkelradius,
	0.05 * rechterwinkelradius / 0.5
	pigment {
		color c
	}
}
#end

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

