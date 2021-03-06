// Front plate
include <../Settings.scad>;
use <Connector.scad>;
use <Rig.scad>;



%rig();
translate(v = [0,-PlateDepth/2]) FrontPlate();
translate(v = [0,PlateDepth/2]) BackPlate();
translate(v = [0,-PlateDepth/2]) LowerFrontPlate();
translate(v = [0,PlateDepth/2]) LowerRearPlate();

module LowerRearPlate(){
	rotate(v =[0,0,1], a= 180)
	LowerFrontPlate();
}


module LowerFrontPlate(){
	translate(v=[-(BaseWidth/2),-PlateThickness,-ArmVOffset-ArmHeight])
		color("Blue") cube(size=[BaseWidth,PlateThickness,ArmVOffset+ArmHeight-BaseVOffset-BaseHeight]);

	translate(v=[-(BaseWidth/2+(ArmWidth+6)),-PlateThickness,-ArmVOffset-ArmHeight-BottomLip])
		color("SteelBlue") cube(size=[BaseWidth+2*(ArmWidth+6),PlateThickness,BottomLip]);

	translate(v=[-(BaseWidth/2)-(ArmWidth+6)+3,0,-ArmVOffset-ArmHeight])
		rotate(v =[1,0,0], a= 90)
			rotate(v =[0,0,1], a= 90)
      				color("green") Clip(Thickness=PlateThickness,Length= 10);

	translate(v=[(BaseWidth/2)+(ArmWidth+6)-3,0,-ArmVOffset-ArmHeight])
		rotate(v =[1,0,0], a= 90)
			rotate(v =[0,0,1], a= 90)
      				color("red") Clip(Thickness=PlateThickness,Length= 10);
}


module BackPlate(){
	rotate(v =[0,0,1], a= 180)
	FrontPlate();
}

module FrontPlate(){
	union(){
	translate(v=[-(BaseWidth/2)+PlateInnerHookWidth,-PlateThickness,-BaseVOffset])
	color("SteelBlue") cube(size=[BaseWidth-2*PlateInnerHookWidth,PlateThickness,BaseVOffset+Lip]);

	translate(v=[BaseWidth/2-PlateInnerHookWidth,0,-ArmVOffset+MidPlateOverlapOffset])
		rotate(v =[1,0,0], a= 90)
      			color("red") Clip(Thickness=PlateThickness, Width = 10,Length = 10);

	translate(v=[-(BaseWidth/2-PlateInnerHookWidth),0,-ArmVOffset+MidPlateOverlapOffset])
		rotate(v =[1,0,0], a= 90)
			rotate(v =[0,0,1], a= 180)
      			color("green") Clip(Thickness=PlateThickness,Width = 10, Length = 10);
	} 
}
