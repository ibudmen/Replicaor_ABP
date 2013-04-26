

include <../Settings.scad>;
use <../Libraries/involute_gears.scad>;
use <Plates.scad>;


%translate(v = [-LowerRollerPlateX,-LowerRollerPlateY,-d]) FrontRightPlate();
translate(v = [0,0,PlateThickness-TensionerInset])  TensionArm();

module TensionArm(){
	
	$fs = 0.01;
	union(){
		difference(){
			union(){
				hull(){
					cylinder(h= TensionerInset+2, r = 5);
					translate(v = [0,10,0]) cylinder(h= TensionerInset+2, r = 5);
				}
				translate(v = [0,0,2])
				gear (circular_pitch=150,
					gear_thickness =2,
					rim_thickness = 2,
					rim_width=2,
					hub_thickness = 2,
					hub_diameter=2,
					circles=0,
					bore_diameter=0,
					number_of_teeth=25);

			}
			translate(v = [0,15,-d]) cylinder(h= TensionerInset+2+2*d, r = 2);
			translate(v = [0,0,-d])cylinder(h= TensionerInset+2+2*d, r = 2);
		}
		
		hull(){
			translate(v = [3.5,18,0]) cylinder(h= TensionerInset+2, r = 1.5);
			translate(v = [3.5,10,0]) cylinder(h= TensionerInset+2, r = 1.5);
		}
		hull(){
			translate(v = [-3.5,18,0]) cylinder(h= TensionerInset+2, r = 1.5);
			translate(v = [-3.5,10,0]) cylinder(h= TensionerInset+2, r = 1.5);
		}
	}
}
