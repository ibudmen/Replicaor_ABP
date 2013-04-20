// contructed view


include <../Settings.scad>;

LBeam();


module LBeam(){
union(){
translate(v= [BaseWidth/2,-PlateDepth/2,-ArmVOffset])
	color("green")cube(size = [ArmWidth+IbeamPlateThikness+IbeamProjection,PlateDepth,5]);

//left beam
translate(v= [BaseWidth/2-ClipSticksize,-PlateDepth/2,-ArmVOffset-(BaseVOffset-ArmVOffset)])
	color("blue")cube(size = [ClipSticksize,PlateDepth,  BaseVOffset-ArmVOffset+5    ]);

translate(v= [BaseWidth/2+ArmWidth,-PlateDepth/2,-ArmVOffset-ArmHeight])
	color("Red")cube(size = [IbeamPlateThikness,PlateDepth,  ArmHeight   ]);
}
}
