// contructed view


include <Settings.scad>;


use <Modules/Rig.scad>;
use <Modules/Plates.scad>;
use <Modules/FrontPlates.scad>;
use <Modules/Rollers.scad>;
use <Modules/Undercarriage.scad>;
use <Modules/CrossBar.scad>;
use <Modules/Gears.scad>;
use <Modules/TensionArm.scad>;

%rig();

FrontRightPlate_Placed();
RearRightPlate_Placed();
FrontLeftPlate_Placed();
RearLeftPlate_Placed();

Undercarriage();

translate(v=[LowerRollerPlateX+BaseWidth/2,-(PlateDepth/2)-PlateThickness+TensionerInset,LowerRollerPlateY])
rotate(a=[90,0,0])
TensionArm();

c_FrontPlate();
c_BackPlate();
%c_LowerFrontPlate();
c_LowerRearPlate();

color("green")LBeam();
rotate(a = [0,0,180]) color("green")LBeam();

//***********************************************************************
//               below is modules to move parts into place
//***********************************************************************


module c_LowerFrontPlate(){
	translate(v = [0,-PlateDepth/2])
		color("LightSeaGreen")LowerFrontPlate();
}

module c_LowerRearPlate(){
	translate(v = [0,PlateDepth/2])
		color("LightSeaGreen")LowerRearPlate();
}

module c_FrontPlate(){
	translate(v = [0,-PlateDepth/2])
		FrontPlate();
}

module c_BackPlate(){
	translate(v = [0,PlateDepth/2])
		BackPlate();
}


translate(v = [PlateX +UpperRollerPlateX ,RollerLength/2,UpperRollerPlateY]){
	rotate(a = [90,0,0]) color("CornflowerBlue") UpperRoller();
}

translate(v = [PlateX +LowerRollerPlateX,RollerLength/2,LowerRollerPlateY]){
	rotate(a = [90,0,0]) color("CornflowerBlue") LowerRoller();
}

translate(v = [-(PlateX +UpperRollerPlateX) ,RollerLength/2,UpperRollerPlateY]){
	rotate(a = [90,0,0]) color("CornflowerBlue") UpperRoller();
}

translate(v = [-(PlateX +LowerRollerPlateX),RollerLength/2,LowerRollerPlateY]){
	rotate(a = [90,0,0]) color("CornflowerBlue") LowerRoller();
	
}

translate(v = [PlateX +UpperRollerPlateX ,0,UpperRollerPlateY]){
	rotate(a = [90,0,0]) rotate(v = [0,0,1], a=7)Spindle();
}

translate(v =[PlateX +LowerRollerPlateX,0,LowerRollerPlateY]){
	rotate(a = [90,0,0]) %Spindle();
}

translate(v = [-PlateX -UpperRollerPlateX ,0,UpperRollerPlateY]){
	rotate(a = [90,0,0]) Spindle();
}

translate(v =[-PlateX -LowerRollerPlateX,0,LowerRollerPlateY]){
	rotate(a = [90,0,0]) Spindle();
}

translate(v =[PlateX +LowerRollerPlateX-7,0,LowerRollerPlateY+24]){	
	rotate(a = [90,0,0]) 
		rotate(v = [0,0,1], a=21) color("grey")Spindle();
}





