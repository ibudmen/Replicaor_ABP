$fn=50;



grill_lower_height = 10;
grill_lower_base = 5;
grill_holes = 6;
base_width = 70;
base_round = 10;
base_head_depth = 20;

base_fan_width = 60;
base_fan_indent = 10;
base_fan_round = 5;
base_center_hole_r = 30;
base_hole_dropdown = 5;
d= 0.01;




Base_height = grill_lower_height +grill_lower_base+base_head_depth;



difference(){
	roundsidedCube(base_width,base_width,Base_height,base_round);
	translate([0,0,Base_height-base_fan_indent])
		roundsidedCube(base_fan_width,base_fan_width,base_fan_indent,base_fan_round);
	cylinder(r=base_center_hole_r, h = Base_height );

	hull(){
		cylinder(r=base_center_hole_r, h = Base_height-base_fan_indent-base_hole_dropdown );
		roundsidedCube(base_fan_width,base_fan_width,base_fan_indent+2,(base_fan_round+2));
	}

	for ( i = [1:20]){	
		translate([0,0,10]){
			rotate(a = 18*i, v=[0,0,1]){
				
				rotate(a=90,v=[1,0,0])
				hull(){
				translate([0,5,0]){
					cylinder(r = 3, h = base_width+d, center = true);
				}
				cylinder(r = 5, h = 2*base_width+d, center = true);
				}




			}
		}

	
	}
}









//modules

module roundsidedCube(x,y,z,r){
	linear_extrude(height=z){
		minkowski()
		{
			 square([x-(r*2),y-(r*2)], center= true);
			 circle(r);
		}	
	}
}





