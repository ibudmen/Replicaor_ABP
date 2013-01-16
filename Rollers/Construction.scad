// contructed view


include <Settings.scad>;


use <Rig.scad>;
use <Plates.scad>;
use <Rollers.scad>;

rig();

c_FrontRightPlate();
c_RearRightPlate();
c_FrontLeftPlate();
c_RearLeftPlate();




module c_FrontRightPlate(){
	translate(v=[BaseWidth/2 -ClipSticksize ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0]){
			color("blue") FrontRightPlate();
		}
	}
}

module c_RearRightPlate(){
	translate(v=[BaseWidth/2 -ClipSticksize ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0]){
			color("blue") RearRightPlate();
		}
	}
}

module c_FrontLeftPlate(){
	translate(v=[-BaseWidth/2 +ClipSticksize ,-PlateDepth/2 ,0]){
		rotate(a = [90,0,0]){
			color("blue") FrontLeftPlate();
		}
	}
}

module c_RearLeftPlate(){
	translate(v=[-BaseWidth/2 +ClipSticksize ,PlateDepth/2 ,0]){
		rotate(a = [-90,0,0]){
			color("blue") RearLeftPlate();
		}
	}
}

translate(v = [PlateWidth/2 +UpperRollerProjection-UpperRollerRadius+Lip ,RollerLength/2,-UpperRollerRadius]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") UpperRoller();
	}
}

translate(v = [PlateWidth/2 +LowerRollerProjection-LowerRollerRadius+Lip,RollerLength/2,-ArmVOffset-ArmHeight-ClipSticksize+LowerRollerRadius]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") LowerRoller();
	}
}

translate(v = [-(PlateWidth/2 +UpperRollerProjection-UpperRollerRadius+Lip ),RollerLength/2,-UpperRollerRadius]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") UpperRoller();
	}
}

translate(v = [-(PlateWidth/2 +LowerRollerProjection-LowerRollerRadius+Lip),RollerLength/2,-ArmVOffset-ArmHeight-ClipSticksize+LowerRollerRadius]){
	rotate(a = [90,0,0]){
		color("CornflowerBlue") LowerRoller();
	}
}

translate(v = [PlateWidth/2 +UpperRollerProjection-UpperRollerRadius+Lip ,RollerLength/2+RollerClearance+PlateThickness,-UpperRollerRadius]){
	rotate(a = [90,0,0]){
		color("LightSeaGreen") CoreRod();
	}
}

translate(v = [PlateWidth/2 +LowerRollerProjection-LowerRollerRadius+Lip,RollerLength/2+RollerClearance+PlateThickness,-ArmVOffset-ArmHeight-ClipSticksize+LowerRollerRadius]){
	rotate(a = [90,0,0]){
		color("LightSeaGreen") CoreRod();
	}
}





