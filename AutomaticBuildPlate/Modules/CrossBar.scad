// contructed view

use <Rig.scad>;
use<Plates.scad>;
include <../Settings.scad>;

%rig();
%FrontRightPlate_Placed();

LBeam();
mirror([1,0,0]) LBeam();

module LBeam(){
	union(){
		translate(v= [BaseWidth/2,-PlateDepth/2,-ArmVOffset])
			color("green")cube(size = [ArmWidth+IbeamPlateThikness+IbeamProjection,PlateDepth,5]);
		
		translate(v= [BaseWidth/2-PlateInnerHookWidth,-PlateDepth/2,-ArmVOffset-(BaseVOffset-ArmVOffset)])
			color("blue")cube(size = [PlateInnerHookWidth,PlateDepth,  BaseVOffset-ArmVOffset+5   ]);
		
		translate(v= [BaseWidth/2+ArmWidth,-PlateDepth/2,-ArmVOffset-ArmHeight])
			color("Red")cube(size = [IbeamPlateThikness,PlateDepth,  ArmHeight   ]);
	}
}
