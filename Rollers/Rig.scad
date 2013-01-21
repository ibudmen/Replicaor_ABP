// Roller Project Part #1 Front Bracket
include <Settings.scad>;

rig();




module rig(){
//plate
translate( v= [-PlateWidth/2,-PlateDepth/2,-PlateHeight]){
	color("Silver") cube(size=[PlateWidth,PlateDepth,PlateHeight]);
}

//arm
translate( v= [-BaseWidth/2-ArmWidth,-PlateDepth/2-ArmForwardProjection,-ArmVOffset-ArmHeight]){
	color("DimGray") cube(size=[ArmWidth,PlateDepth+ArmForwardProjection+ArmRearProjection,ArmHeight]);
}

//arm
translate( v= [BaseWidth/2,-PlateDepth/2-ArmForwardProjection,-ArmVOffset-ArmHeight]){
	color("DimGray")  cube(size=[ArmWidth,PlateDepth+ArmForwardProjection+ArmRearProjection,ArmHeight]);
}

//base
translate( v= [-BaseWidth/2,-PlateDepth/2-BaseForwardProjection,-BaseVOffset-BaseHeight]){
	color("Gainsboro") cube (size=[BaseWidth,PlateDepth+BaseForwardProjection+BaseRearProjection,BaseHeight]);
}

translate(v= [ScrewsWidthOutset,ScrewsDepthOutset,-(BaseVOffset+BaseHeight+ScrewsHeadProtrusion)])
color("SlateGray") RigScrew();

translate(v= [-ScrewsWidthOutset,ScrewsDepthOutset,-(BaseVOffset+BaseHeight+ScrewsHeadProtrusion)])
color("SlateGray") RigScrew();

translate(v= [ScrewsWidthOutset,-ScrewsDepthOutset,-(BaseVOffset+BaseHeight+ScrewsHeadProtrusion)])
color("SlateGray") RigScrew();

translate(v= [-ScrewsWidthOutset,-ScrewsDepthOutset,-(BaseVOffset+BaseHeight+ScrewsHeadProtrusion)])
color("SlateGray") RigScrew();
}


module RigScrew(){
	cylinder(h=ScrewsHeadHeight, r=ScrewsHeadRadius );
	cylinder(h=ScrewsHeadHeight, r=ScrewsHeadRadius );
	translate(v = [0,0,-d]){
		cylinder(h=BaseVOffset+BaseHeight+ScrewsHeadProtrusion-d, r=ScrewsShaftRadius );
	}
}
