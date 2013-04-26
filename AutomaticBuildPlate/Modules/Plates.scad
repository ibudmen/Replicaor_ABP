// Roller Project Part #1 Front Bracket

include <../Settings.scad>;
use <Connector.scad>;
use <Rig.scad>;

//Printing();
//Viewing();

FrontRightPlate();

module Printing(){
	translate([10,-10,0])FrontRightPlate();
	//translate([-10,-10,0])FrontLeftPlate();
	//translate([10,10,0])RearRightPlate();
	//translate([-10,10,0])RearLeftPlate();
}


module Viewing(){
	%rig();
	FrontRightPlate_Placed();
	RearRightPlate_Placed();
	FrontLeftPlate_Placed();
	RearLeftPlate_Placed();
}

module FrontRightPlate_Placed(){
	translate(v=[BaseWidth/2  ,-PlateDepth/2 ,0]) 
		rotate(a = [90,0,0]) FrontRightPlate();
}

module RearRightPlate_Placed(){
	translate(v=[BaseWidth/2 ,PlateDepth/2 ,0])
		rotate(a = [-90,0,0]) 	RearRightPlate();	
}

module FrontLeftPlate_Placed(){
	translate(v=[-BaseWidth/2 ,-PlateDepth/2 ,0])
		rotate(a = [90,0,0])  FrontLeftPlate();
}

module RearLeftPlate_Placed(){
	translate(v=[-BaseWidth/2 ,PlateDepth/2 ,0])
		rotate(a = [-90,0,0]) RearLeftPlate();
}


module FrontRightPlate(){ RightPlate();}
module RearRightPlate(){ mirror([ 0, 1, 0 ]) RightPlate();}
module FrontLeftPlate(){  LeftPlate();}
module RearLeftPlate(){ mirror([ 0,1,0 ])LeftPlate();}

module TensionCurve(Radius,Depth){
	union(){
		difference(){
			translate(v=[0,0,]){
				color("red") cylinder(h =Depth ,r =TensionerOffsetRadius+Radius);
			}
			translate(v=[0,0,-d])
				cylinder(h =Depth+2*d ,r =TensionerOffsetRadius-Radius);	
		
			translate( v = [-(TensionerOffsetRadius+Radius),-(TensionerOffsetRadius+Radius),-d])
				cube(size = [TensionerOffsetRadius+Radius,2*(TensionerOffsetRadius+Radius),Depth+2*d]);
		}
		translate(v=[0,TensionerOffsetRadius,0])
			cylinder(h =Depth ,r =Radius);	
	}
}

module RightPlate(){
	difference(){
		GenericPlate();
		translate(v=[LowerRollerPlateX,LowerRollerPlateY,-d]){
			rotate(a = TensionerAngle, v=[0,0,1] ){
				TensionCurve(TensionerBearingRadius, PlateThickness +2*d );
				translate(v=[0,0,PlateThickness-TensionerInset])
					hull(){
						TensionCurve(TensionerBearingRadius+TensionerBearingExtention , TensionerInset+2*d);
						cylinder(h =TensionerInset+d ,r =7);
						}
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
	color("DarkSeaGreen") hull(){
		//main block
		translate(v = [-PlateInnerHookWidth,-(ArmVOffset+ArmHeight)-BottomLip,0])
			color("red") cube(size = [
					PlateInnerHookWidth+ArmWidth+PlateArmOverhang,
					ArmHeight+ArmVOffset+Lip+BottomLip,
					PlateThickness]);
		
		//top roller curve
		translate(v = [UpperRollerPlateX+Lip,UpperRollerPlateY,0])
			cylinder(h= PlateThickness ,r = UpperRollerRadius+Lip); 
		
		//lower roller curve
		translate(v = [LowerRollerPlateX+Lip,LowerRollerPlateY,0])
			cylinder(h= PlateThickness ,r = LowerRollerRadius+BottomLip); 

	}
	
	// Arm Hole cut
	translate(v = [0,-(ArmVOffset+ArmHeight)-d,-2*d])
		cube(size = [ArmWidth,ArmHeight+d,PlateThickness+4*d]);

	//inner cut hole
	translate(v = [-PlateInnerHookWidth-d, -ArmVOffset-ArmHeight-BottomLip-d  ,-2*d])
	cube(size = [PlateInnerHookWidth+ArmWidth+d,ArmHeight+BottomLip-(BaseVOffset-ArmVOffset)+d,PlateThickness+4*d]);

	//under hole cut
	translate(v= [-d,-(ArmVOffset+ArmHeight+BottomLip+d),-2*d])
		cube(size = [ArmWidth+6+d,BottomLip+d,PlateThickness+4*d]);
	

	//upper bearing hole
	translate(v = [UpperRollerPlateX,UpperRollerPlateY,-d])
	  color("Magenta")
           cylinder(h= PlateThickness+2*d ,r = RollerBearingCutoutRadius);
	
	//lower bearing hole
	translate(v = [LowerRollerPlateX,LowerRollerPlateY,-d])
	  color("DarkViolet")
	    cylinder(h= PlateThickness+2*d ,r = RollerBearingCutoutRadius);

	//Inner bearing hole
	translate(v = [LowerRollerPlateX-7,LowerRollerPlateY+24,-d])
	  color("DarkViolet")
	    cylinder(h= PlateThickness+2*d ,r = RollerBearingCutoutRadius);		

	//top clip
	translate(v = [-PlateInnerHookWidth, -ArmVOffset+MidPlateOverlapOffset,0])
		color("green")ClipHole(Thickness= PlateThickness,Width = 10,Length = 10);

	//bottom clip TODO MATH IS BAD HERE
	translate(v = [ArmWidth+3,-(ArmVOffset+ArmHeight),0])
		rotate(v=[0,0,1], a = 90)
	 		color("blue")ClipHole(Thickness= PlateThickness,Length = 10, Width=6+d);
	}

}//end module

