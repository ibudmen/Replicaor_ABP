// contructed view


include <Settings.scad>;


use <Rig.scad>;
use <Plates.scad>;
use <Rollers.scad>;
use <Undercarriage.scad>;


rig();

c_FrontRightPlate();
c_RearRightPlate();
c_FrontLeftPlate();
c_RearLeftPlate();


Undercarriage();

module c_FrontRightPlate(){
	translate(v=[BaseWidth/2  ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0]){
			color("blue") FrontRightPlate();
		}
	}
}

module c_RearRightPlate(){
	translate(v=[BaseWidth/2 ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0]){
			color("blue") RearRightPlate();
		}
	}
}

module c_FrontLeftPlate(){
	translate(v=[-BaseWidth/2 ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0]){
			color("blue") FrontLeftPlate();
		}
	}
}

module c_RearLeftPlate(){
	translate(v=[-BaseWidth/2 ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0]){
			color("blue") RearLeftPlate();
		}
	}
}

translate(v = [PlateX +UpperRollerPlateX ,RollerLength/2,UpperRollerPlateY]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") UpperRoller();
	}
}

translate(v = [PlateX +LowerRollerPlateX,RollerLength/2,LowerRollerPlateY]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") LowerRoller();
	}
}

translate(v = [-(PlateX +UpperRollerPlateX) ,RollerLength/2,UpperRollerPlateY]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") UpperRoller();
	}
}

translate(v = [-(PlateX +LowerRollerPlateX),RollerLength/2,LowerRollerPlateY]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") LowerRoller();
	}
}

translate(v = [PlateX +UpperRollerPlateX ,RollerLength/2,UpperRollerPlateY]){
	rotate(a = [90,0,0]){
		color("LightSeaGreen") CoreRod();
	}
}

translate(v =[PlateX +LowerRollerPlateX,RollerLength/2,LowerRollerPlateY]){
	rotate(a = [90,0,0]){
		color("LightSeaGreen") CoreRod();
	}
}





