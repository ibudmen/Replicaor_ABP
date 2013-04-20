// Roller Project Part #1 Front Bracket

include <../Settings.scad>;



RollersDefaults_Length = RollerLength+2*RollerClearance+2*PlateThickness+40;


translate(v = [10+UpperRollerRadius,0,0]){
	UpperRoller();
}

translate(v = [-10-LowerRollerRadius,0,0]){
	LowerRoller();
}

//CoreRod();

Washer();


module Washer(
l = 0.1,
h = 1,
r){
	HollowCylinder(r-l,h , RollerCore);
}


module UpperRoller(){
	HollowCylinder(UpperRollerRadius, RollerLength, RollerCore);
}

module LowerRoller(){
	HollowCylinder(LowerRollerRadius, RollerLength, RollerCore);
}

module CoreRod(
	Length = RollersDefaults_Length ){
	translate(v = [-RollerCore/2,-RollerCore/2,0]){
		cube(size = [RollerCore,RollerCore,Length]);
	}
}

module HollowCylinder(r,h,c){
	difference(){	
		translate(v = [0,0,-d]){
			cylinder(h = h+2*d, r =  r, $fn = 100);
		}
		translate(v = [-c/2,-c/2, - 2*d]){
			cube(size = [c,c,h+4*d]);
		}
	}
}
