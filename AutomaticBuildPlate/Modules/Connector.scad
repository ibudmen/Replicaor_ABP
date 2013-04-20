include <../Settings.scad>;

ConnectorDefaults_Length = 8;
ConnectorDefaults_Width = 6;
ConnectorDefaults_Thickness = 5;
ConnectorDefaults_HoleRadius = 1;
ConnectorDefaults_SlipRadius = 0.2; // Radius increase in clip to allow thread to slip

ConnectorTest();

module Clip(
Length =ConnectorDefaults_Length,
Width = ConnectorDefaults_Width,
Thickness = ConnectorDefaults_Thickness,
HoleRadius = ConnectorDefaults_HoleRadius,
SlipRadius = ConnectorDefaults_SlipRadius){
	translate(v = [0,-Width/2,Thickness/2])
		difference(){
			translate(v = [-d,0,0]){
				cube(size=[Length+d,Width,Thickness/2]);
			}
			translate(v = [Length-(Width/2),Width/2,-d])
				color("blue")cylinder(h=Thickness+2*d,r= HoleRadius+SlipRadius, $fn =25);
		}
}

module ClipHole(
Length =ConnectorDefaults_Length,
Width = ConnectorDefaults_Width,
Thickness = ConnectorDefaults_Thickness,
HoleRadius = ConnectorDefaults_HoleRadius){
translate(v = [0,-Width/2,Thickness/2])
	union(){
		translate(v = [-d,0,0])
			cube(size=[Length+d,Width,Thickness/2+d]);
		translate(v = [Length-(Width/2),Width/2,(-Thickness/2)-d])
			color("red")cylinder(h=Thickness+2*d,r= HoleRadius, $fn =25);
	}
}





module ConnectorTest(){

	translate(v = [0,20,0])
		ClipHole();

	translate(v = [0,40,0])
		Clip();

	%color("green") difference(){
		union(){
			difference(){
				translate(v = [-5,-10,0])
					cube(size = [30,20,5]);
			
				translate(v = [0,0,0])
					ClipHole();
			}
		}
		translate(v = [-6,-22,-1])
			color("green") cube(size = [32,22,7]);
	}

	difference(){
		translate(v = [0,0,0])
			color("red") Clip();
		translate(v = [-6,-22,-1])
			color("red") cube(size = [32,22,7]);
	}
}
