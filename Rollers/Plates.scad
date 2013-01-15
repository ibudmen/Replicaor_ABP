// Roller Project Part #1 Front Bracket

include <Settings.scad>;

FrontRightPlate();
//RearRightPlate();
//FrontLeftPlate();
//RearLeftPlate();

module FrontRightPlate(){
	RightPlate();
}

module RearRightPlate(){
	mirror([ 0, 1, 0 ]){
		RightPlate();
	}
}

module FrontLeftPlate(){
	LeftPlate();
}

module RearLeftPlate(){
	mirror([ 0, 1, 0 ]){
		LeftPlate();
	}
}

module RightPlate(){
	difference(){
		GenericPlate();
		translate(v = [50,-SlideGap/2-20,-d]){
			color("red") cube(size = [100,SlideGap,PlateThickness+2*d]);
			translate(v = [0,SlideGap/2,0]){
				cylinder(h = PlateThickness+2*d,r = SlideGap/2);
			}
		}
	}
}

module LeftPlate(){
	mirror([ 1, 0, 0 ]){
	GenericPlate();
	}
}

module GenericPlate(){
difference(){
union(){
hull(){
	translate(v = [0,-(ArmVOffset+ArmHeight+Lip+(Lip-ClipSticksize)),0]){
		color("red") cube(size = [
ClipSticksize+ArmWidth+PlateArmOverhang,
ArmHeight+ArmVOffset+2*Lip+(Lip-ClipSticksize),
PlateThickness]);
	}

	translate(v = [0,-(ArmVOffset+ArmHeight+Lip+ClipSticksize),0]){
		color("red") cube(size = [ClipSticksize+ArmWidth+PlateArmOverhang,1,PlateThickness]);
	}
	
	translate(v = [ClipSticksize+ArmWidth+PlateArmOverhang+UpperRollerProjection-UpperRollerRadius+Lip,-UpperRollerRadius,0]){
		cylinder(h= PlateThickness ,r = UpperRollerRadius+Lip); 
	}
	
	 translate(v = [
ClipSticksize+ArmWidth+PlateArmOverhang+LowerRollerProjection-LowerRollerRadius+Lip,
-(ArmVOffset+ArmHeight+ClipSticksize)+LowerRollerRadius,
0]){
		cylinder(h= PlateThickness ,r = LowerRollerRadius+Lip); 
	}

}
}

translate(v = [ClipSticksize,-ArmVOffset-ArmHeight,-d]){
	cube(size = [ArmWidth,ArmHeight,PlateThickness+2*d]);
}

translate(v = [0,-BaseVOffset-BaseHeight,-d]){
	cube(size = [ClipSticksize,BaseHeight,PlateThickness+2*d]);
}

translate(v = [ClipSticksize+ArmWidth+PlateArmOverhang+UpperRollerProjection-UpperRollerRadius+Lip,-UpperRollerRadius,-d]){
	cylinder(h= PlateThickness+2*d ,r = UpperRollerBearingCutoutRadius);
}

translate(v = [
ClipSticksize+ArmWidth+PlateArmOverhang+LowerRollerProjection-LowerRollerRadius+Lip,
-(ArmVOffset+ArmHeight+ClipSticksize)+LowerRollerRadius,
-d]){
	cylinder(h= PlateThickness+2*d ,r = LowerRollerBearingCutoutRadius);
}

}


}//end module

