include <MCAD\units.scad>;
include <utils\roundedRect.scad>;

thickness = .5 * inch;
length = 6.1 * inch;
width = 3.33 * inch;
radius = .25 * inch;

module phoneCase(){
		translate ([-thickness/2, -width/2, -length/2]) 
		rotate (a = [90, 0, 90]) 
		intersection () 
		{
			roundedRect (size = [width,length,thickness], radius = .5 * inch);
			translate ([0, 0, thickness]) 
				rotate (a = [-90, 0, 0]) 
					roundedRect (size = [width,thickness,length], radius = radius);
			translate ([0, 0, thickness]) 
				rotate (a = [0, 90, 0]) 
					roundedRect (size = [thickness,length,width], radius = radius);

		}
}	
