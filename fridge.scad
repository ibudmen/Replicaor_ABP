//$fn=50;


base_width = 85;
base_round = 10;
base_head_depth = 15;

ext_base_width = 85;
ext_base_r = 4;

base_fan_width = 60;
base_fan_indent = 10;
base_fan_round = 5;

base_center_hole_r = 30;
base_hole_dropdown = 8;
d= 0.1;




Base_height = 20 +5+base_head_depth;

difference(){
union(){
	roundsidedCube(base_width,base_width,Base_height,base_round);
	translate([0,0,Base_height])
	linear_extrude(height=25){
	difference(){
		roundsidedsquare(base_width,base_width,base_round);
		roundsidedsquare(base_width-2,base_width-2,base_round);
	}
	}
}


	translate([0,0,Base_height-base_fan_indent])
		roundsidedCube(base_fan_width,base_fan_width,base_fan_indent+d,base_fan_round);
	cylinder(r=base_center_hole_r, h = Base_height );

	hull(){
		cylinder(r=base_center_hole_r, h = Base_height-base_fan_indent-base_hole_dropdown );

 		translate([0,0,-d])
		roundsidedCube(base_fan_width,base_fan_width,base_fan_indent+2+d,(base_fan_round+2));
	}
      vents();

//translate([0,0,Base_height-base_fan_indent-1.5])
	//rotate(a= 45 , v=[0,0,1])
	//cube([5,75,3], center = true);


//translate([base_fan_width/2,-15,Base_height-base_fan_indent])
	//cube([2,30,base_fan_indent]);

translate([0,0,31])
      vents();

}

//translate([-base_width/2,-base_width/2,Base_height])
//color([1,0,0])cube([base_width,base_width,20]);




//modules

module vents(){
	for ( i = [1:20]){	
		translate([0,0,10]){
			rotate(a = 18*i, v=[0,0,1]){
				//vent();
				cube([2*base_width,8,15]);
			}
		}
	}
}

module vent(){
				rotate(a=90,v=[1,0,0])
				hull(){
					translate([0,5,0]){
						cylinder(r = 5, h = 2*base_width+d, center = true);
					}
					cylinder(r = 5, h = 2*base_width+d, center = true);
				}
}


module roundsidedCube(x,y,z,r){
	linear_extrude(height=z){
		roundsidedsquare(x,y,r);
	}
}

module roundsidedsquare(x,y,r){
		minkowski()
		{
			 square([x-(r*2),y-(r*2)], center= true);
			 circle(r);
		}	
}





