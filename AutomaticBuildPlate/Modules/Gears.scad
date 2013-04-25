// Gears
include <../Settings.scad>;
use <Rollers.scad>;
use <../Libraries/involute_gears.scad>;
Spindle();


module Spindle(){

translate(v = [0,0,-PlateThickness-(PlateDepth/2)]) 
	color("blue")CoreRod(PlateDepth+(2*PlateThickness));

translate(v = [0,0,-PlateThickness-(PlateDepth/2)]) 
	Washer(r=RollerBearingCutoutRadius,h=PlateThickness, l = 0.05);

translate(v = [0,0,(PlateDepth/2)]) 
	Washer(r=RollerBearingCutoutRadius,h=PlateThickness, l = 0.05);


translate(v = [0,0,-(PlateDepth/2)-PlateThickness-2]) 
	Washer(r=5,h=2, l = 0.05);

translate(v = [0,0,(PlateDepth/2)+PlateThickness]) 
	Washer(r=5,h=2, l = 0.05);

translate(v = [0,0,(PlateDepth/2)+PlateThickness+2]) 
	color("DarkSlateGray")  myGear();

translate(v = [0,0,-((PlateDepth/2)+PlateThickness+2)]) 
	color("DarkSlateGray")  mirror([0,0,1])myGear();

}

module myGear(){
	gear (circular_pitch=300,
		gear_thickness = 3,
		rim_thickness = 4,
		rim_width=2,
		hub_thickness = 4,
		hub_diameter=5,
		circles=8,
		bore_diameter=0,
		number_of_teeth=15);
}