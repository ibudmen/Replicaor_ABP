// Roller Project Part #1 Front Bracket

include <Settings.scad>;
use <Connector.scad>;

FrontRightPlate();
//RearRightPlate();
//FrontLeftPlate();
//RearLeftPlate();


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
		translate(v=[LowerRollerPlateX,LowerRollerPlateY,-d]){
			rotate(a = TensionerAngle, v=[0,0,1] ){
				TensionCurve(TensionerBearingRadius, PlateThickness +2*d );
				translate(v=[0,0,PlateThickness-TensionerInset])
					hull()
						TensionCurve(TensionerBearingRadius+TensionerBearingExtention , TensionerInset+2*d);
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
		union(){
	difference(){
		union(){
			color("DarkSeaGreen") hull(){
				//main block
				translate(v = [-ClipSticksize,-(ArmVOffset+ArmHeight)-BottomLip,0]){
					color("red") cube(size = [ClipSticksize+ArmWidth+PlateArmOverhang,
ArmHeight+ArmVOffset+Lip+BottomLip,
PlateThickness]);
				}
				//magic lower block
				translate(v = [-ClipSticksize,-(ArmVOffset+ArmHeight+Lip+ClipSticksize),0]){
					//color("red") cube(size = [ClipSticksize+ArmWidth+PlateArmOverhang,1,PlateThickness]);
				}
				//top curve
				translate(v = [UpperRollerPlateX+Lip,UpperRollerPlateY,0]){
					cylinder(h= PlateThickness ,r = UpperRollerRadius+Lip); 
				}
				//lower curve
				 translate(v = [LowerRollerPlateX+Lip,LowerRollerPlateY,0]){
					cylinder(h= PlateThickness ,r = LowerRollerRadius+BottomLip); 
				}
			}
		}
		union(){
			// Arm Hole
				translate(v = [0,-(ArmVOffset+ArmHeight)-d,-d])
					cube(size = [ArmWidth,ArmHeight+d,PlateThickness+2*d]);
	
			//base hole
			translate(v = [-ClipSticksize-d,-BaseVOffset-BaseHeight-ArmHeight,-d])
				cube(size = [ClipSticksize+ArmWidth+d,BaseHeight+ArmHeight,PlateThickness+2*d]);
			
			translate(v= [ArmWidth-d,-(ArmVOffset+ArmHeight+BottomLip+d),-d])
				cube(size = [6+d,BottomLip+d,PlateThickness+2*d]);
		}

		//upper bearing hole
		translate(v = [UpperRollerPlateX,UpperRollerPlateY,-d]){
			cylinder(h= PlateThickness+2*d ,r = RollerBearingCutoutRadius);
		}
		//lower bearing hole
		translate(v = [LowerRollerPlateX,LowerRollerPlateY,-d]){
			cylinder(h= PlateThickness+2*d ,r = RollerBearingCutoutRadius);
		}

		//top clip
		translate(v = [-ClipSticksize, -ArmVOffset+MidPlateOverlapOffset,0])
			ClipHole(Thickness= PlateThickness,Width = 10,Length = 10);

		//bottom clip TODO MATH IS BAD HERE
		translate(v = [ArmWidth+3,-(ArmVOffset+ArmHeight),0])
			rotate(v=[0,0,1], a = 90)
		 		ClipHole(Thickness= PlateThickness,Length = 10);


}
	}
}//end module

