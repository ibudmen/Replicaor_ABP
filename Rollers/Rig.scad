// Roller Project Part #1 Front Bracket
include <Settings.scad>;

rig();

module rig(){
//plate
translate( v= [-PlateWidth/2,-PlateDepth/2,-PlateHeight]){
	color("red") cube(size=[PlateWidth,PlateDepth,PlateHeight]);
}

//arm
translate( v= [-BaseWidth/2-ArmWidth,-PlateDepth/2-ArmForwardProjection,-ArmVOffset-ArmHeight]){
	color("DarkSlateGray") cube(size=[ArmWidth,PlateDepth+ArmForwardProjection+ArmRearProjection,ArmHeight]);
}

//arm
translate( v= [BaseWidth/2,-PlateDepth/2-ArmForwardProjection,-ArmVOffset-ArmHeight]){
	color("DarkSlateGray")  cube(size=[ArmWidth,PlateDepth+ArmForwardProjection+ArmRearProjection,ArmHeight]);
}

//base
translate( v= [-BaseWidth/2,-PlateDepth/2-BaseForwardProjection,-BaseVOffset-BaseHeight]){
	color("DarkKhakicube") cube (size=[BaseWidth,PlateDepth+BaseForwardProjection+BaseRearProjection,BaseHeight]);
}
}
