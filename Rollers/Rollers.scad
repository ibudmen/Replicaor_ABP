// Roller Project Part #1 Front Bracket

include <Settings.scad>;

translate(v = [10+UpperRollerRadius,0,0]){
UpperRoller();
}
translate(v = [-10-LowerRollerRadius,0,0]){
LowerRoller();
}


module UpperRoller(){
	difference(){	
		translate(v = [0,0,-d]){
			cylinder(h = RollerLength+2*d, r =  UpperRollerRadius);
		}
		translate(v = [-RollerCore/2,-RollerCore/2, - d]){
			cube(size = [RollerCore,RollerCore,RollerLength+2*d]);
		}
	}
}

module LowerRoller(){
	difference(){	
		translate(v = [0,0,-d]){
			cylinder(h = RollerLength+2*d, r =  LowerRollerRadius);
		}
		translate(v = [-RollerCore/2,-RollerCore/2, - d]){
			cube(size = [RollerCore,RollerCore,RollerLength+2*d]);
		}
	}
}