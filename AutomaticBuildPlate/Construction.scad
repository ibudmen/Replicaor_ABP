// contructed view


include <Settings.scad>;


use <Rig.scad>;
use <Plates.scad>;
use <FrontPlates.scad>;
use <Rollers.scad>;
use <Undercarriage.scad>;
use <LBeam.scad>;
use <Gears.scad>;

rig();

c_FrontRightPlate();
c_RearRightPlate();
c_FrontLeftPlate();
c_RearLeftPlate();
Undercarriage();

c_FrontPlate();
c_BackPlate();
c_LowerFrontPlate();
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
		color("MidnightBlue") FrontPlate();
}

module c_BackPlate(){
	translate(v = [0,PlateDepth/2])
		BackPlate();
}

module c_FrontRightPlate(){
	translate(v=[BaseWidth/2  ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0]) FrontRightPlate();
	}
}

module c_RearRightPlate(){
	translate(v=[BaseWidth/2 ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0]) RearRightPlate();
	}
}

module c_FrontLeftPlate(){
	translate(v=[-BaseWidth/2 ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0])  FrontLeftPlate();
	}
}

module c_RearLeftPlate(){
	translate(v=[-BaseWidth/2 ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0])  RearLeftPlate();
	}
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
	rotate(a = [90,0,0]) Spindle();
}

translate(v =[PlateX +LowerRollerPlateX,0,LowerRollerPlateY]){
	rotate(a = [90,0,0]) Spindle();
}

translate(v = [-PlateX -UpperRollerPlateX ,0,UpperRollerPlateY]){
	rotate(a = [90,0,0]) Spindle();
}

translate(v =[-PlateX -LowerRollerPlateX,0,LowerRollerPlateY]){
	rotate(a = [90,0,0]) Spindle();
}





