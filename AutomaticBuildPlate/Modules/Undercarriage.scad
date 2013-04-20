// Roller Project undercarrage

include <../Settings.scad>;

Undercarriage();

module Undercarriage(){
	difference(){
	translate(v=[-BaseWidth/2,-PlateDepth/2,-ArmVOffset -ArmHeight ])
		cube(size=[BaseWidth,PlateDepth ,10]);


	translate(v=[-BaseWidth/2+10,-PlateDepth/2+10,-ArmVOffset -ArmHeight-d+2 ])
		cube(size=[BaseWidth-20,PlateDepth-20 ,10+2*d]);
	}
}
