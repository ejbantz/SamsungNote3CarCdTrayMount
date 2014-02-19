include <MCAD\units.scad>;
include <phone_case.scad>;
include <utils\roundedRect.scad>;

screen_width = 2.88 * inch;
screen_height = 5.74 * inch;

	difference() { 
	
	union(){
			translate ([1.0 * inch, -1.2 * inch, 0]) 
			rotate (a = [0, 0, -45]) 
			{
				difference(){
				union(){
					holderForPhone();
					//mainPlatform();
				}
				translate ([-.5 * inch, 0, 3.5 * inch])
				    openingForPower();}
			}
			hull()
			{
			translate ([1.4 * inch, -.8 * inch, 0]) 
				rotate (a = [0, 0, -45]) 
					mainSmallerPlatform();
			transition();}
			taper();
			cdInsert();
		}
		translate ([1.0 * inch, -1.2 * inch, 0]) 
			rotate (a = [0, 0, -45]) 
			{
				translate ([-.5 * inch, 0, 3.5 * inch]) 
					 openingForPower();
			}
		cleanOffBottom();
	}


module cleanOffBottom(){
translate ([-5 * inch, -5 * inch, -10 * inch]) 
	cube (size = [10 * inch, 10 * inch, 10 * inch]);
}
module taper() {

	width = 3.13 * inch;
	thickness = 1 * inch;
	length = 2.25 * inch;
	translate ([-length, -width/2, -.92 * inch]) 
		rotate (a = [0, -3, 0]) 
		 	roundedRect (size = [length, width, thickness], radius = .25 * inch);
}

module transition() {

	width = 4.72 * inch;
	thickness = 0.25 * inch;
	length = 1.11 * inch;
		translate ([-length, -width/2, 0]) 
		 	roundedRect (size = [length, width, thickness], radius = .25 * inch);
}

module mainPlatform() {
	width = 4.72 * inch;
	thickness = 0.35 * inch;
	length = 1 * inch;
		translate ([-length, -width/2, 0]) 
		 	roundedRect (size = [length, width, thickness], radius = .25 * inch);
};

module mainSmallerPlatform() {
	width = 2.5 * inch;
	thickness = 0.35 * inch;
	length = 1 * inch;
		translate ([-length, -width/2, 0]) 
		 	roundedRect (size = [length, width, thickness], radius = .25 * inch);
};
module holderForPhone(){
	translate ([-.5 * inch, 0, 3.4 * inch]) 
	difference() { 
		perimeterOfPhone();
		translate ([-1*inch, -5*inch, -.0*inch]) 
			cutOffTopOfHolder();
		translate ([0, -screen_width/2, screen_height/2]) 
			openingForScreen();
	}
}

module cdInsert() {
	width = 4.72 * inch;
	thickness = 0.08 * inch;
	length = 2.35 * inch;
		translate ([-length, -width/2, 0]) 
		 	roundedRect (size = [length, width, thickness], radius = .25 * inch);
}
module openingForPower(){
	width = 2 * inch;
	height = 10 * inch;
	translate ([-.2*inch, -width/2, -height]) 
	 	roundedRect (size = [ 1 * inch, width, height], radius = .25 * inch);
}

module perimeterOfPhone(){
	difference() { 
		scale (v = [2, 1.1, 1.1]) 
			phoneCase();
		phoneCase();
	}
}
module cutOffTopOfHolder(){
	cube (size = [2*inch, 10*inch, 5*inch]);
}

module openingForScreen()
{
	rotate (a = [0, 90, 0]) 
		 roundedRect (size = [screen_height, screen_width, 1 * inch], radius = .25 * inch);
}
