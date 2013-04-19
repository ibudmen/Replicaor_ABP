//Misc
include <Settings.scad>;

ScrewHole();

module ScrewHole(
ThreadLength = 10,
ThreadRadius = 1,
SinkLength = 2,
SinkRadius = 2,
SinkTaperLength = 1){
	translate(v=[0,0,-ThreadLength-SinkTaperLength-SinkLength])
		color("DarkViolet") cylinder(h=ThreadLength,r=ThreadRadius, $fn = 15);

	translate(v=[0,0,-SinkLength])
		color("RosyBrown") cylinder(h=SinkLength+d,r=SinkRadius, $fn = 15);

	translate(v=[0,0,-SinkLength-SinkTaperLength])
		color("RosyBrown") cylinder(h=SinkTaperLength,r1=ThreadRadius,r2=SinkRadius , $fn = 15);
};