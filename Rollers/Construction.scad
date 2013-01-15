// contructed view


include <Settings.scad>;


use <Rig.scad>;
use <FrontRightPlate.scad>;


rig();

translate(v=[BaseWidth/2 -ClipSticksize ,-PlateDepth/2 ,0]){
rotate(a = [90,0,0]){
color("blue") FrontRightPlate();
}
}
