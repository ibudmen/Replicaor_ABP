// Roller Project Part #1 Front Bracket

include <Settings.scad>;
use <Rig.scad>;

//rig();
FrontRightPlate();

module FrontRightPlate(){
difference(){
hull(){
translate(v = [0,-(ArmVOffset+ArmHeight+ClipSticksize),0]){
	color("red") cube(size = [ClipSticksize+ArmWidth+PlateArmOverhang,ArmHeight+ClipSticksize+ArmVOffset,PlateThickness]);
}

translate(v = [ClipSticksize+ArmWidth+PlateArmOverhang+UpperRollerProjection-UpperRollerRadius,-UpperRollerRadius,0]){
	cylinder(h= PlateThickness ,r = UpperRollerRadius); 
}

translate(v = [ClipSticksize+ArmWidth+PlateArmOverhang+LowerRollerProjection-LowerRollerRadius,-(ArmVOffset+ArmHeight+ClipSticksize)+LowerRollerRadius,0]){
	cylinder(h= PlateThickness ,r = LowerRollerRadius); 
}
}

translate(v = [ClipSticksize,-ArmVOffset-ArmHeight,-d]){
	cube(size = [ArmWidth,ArmHeight,PlateThickness+2*d]);
}


translate(v = [0,-BaseVOffset-BaseHeight,-d]){
cube(size = [ClipSticksize,BaseHeight,PlateThickness+2*d]);
}

}
}

