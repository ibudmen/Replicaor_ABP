//$fn=50;


base_width = 90;
base_round = 10;
base_grill_lip = 10;
base_grill_height = 10;
base_grill_width = 8;
base_center_hole_r = 30;
base_hole_dropdown = 8;

Base_height = base_grill_height+base_grill_lip;

peg_r = 3;
peg_length = 3;
peg_inset = 7;

fan_case_height = 10;
fan_width = 59;
fan_indent = 10;
fan_lip= 5;
fan_r = 5;
fan_screw_inset= 5;;
fan_screw_r = 1.5;

cooler_width= 68;
cooler_height =18;

d= 0.05;

//MAIN



translate([100,0,0]){
base();
}
translate([200,0,0]){
fancase();
}
top();

module top(){

difference(){
roundsidedCube(base_width,base_width,4,base_round);
translate([0,0,1]){
pegs();
}
translate([-cooler_width/2,-cooler_width/2,-d]){
#cube([cooler_width,cooler_width,10]);
}

}

}

module fancase(){
translate([0,0,fan_case_height+cooler_height+fan_lip]){
 pegs();
}
	difference(){
		roundsidedCube(base_width,base_width,fan_case_height+cooler_height+fan_lip,base_round);

		translate([0,0,fan_lip]){
			roundsidedCube(fan_width,fan_width,cooler_height+d,fan_r);   // fan indent
		}

		translate([0,0,-d]){
			cylinder(r=base_center_hole_r, h =  fan_lip+fan_case_height-fan_indent+2*d);
		}

		
		cylinder(r=base_center_hole_r, h = fan_case_height-fan_indent );
		screws(fan_case_height);
		
		pegs();

		translate([-cooler_width/2,-cooler_width/2,fan_case_height+fan_lip]){
			cube([cooler_width,cooler_width,cooler_height+d]);
		}
		translate([0,0,fan_case_height+fan_lip]){
			vents(-2,2,cooler_height,base_grill_width,18);
		}
		translate([-fan_width/2,cooler_width/2-d-11,fan_case_height+fan_lip-fan_indent]){
			cube([fan_width,15+d,cooler_height+fan_indent+d]);
		}

translate([fan_width/2-10,fan_width/2+20,fan_indent+10])
rotate(a= 90, v= [1,0,0])
cylinder(r=4, h = 20 );

	}

}


module base(){

	translate([0,0,Base_height]){
		pegs();
	}

	difference(){
		roundsidedCube(base_width,base_width,Base_height,base_round);
		translate([0,0,-d]){
			cylinder(r=base_center_hole_r, h = Base_height +2*d);
		}

		hull(){
			cylinder(r=base_center_hole_r, h = Base_height +d);
		}
		translate([0,0,5+d]){
	      		 vents(0,10,Base_height-5,base_grill_width,18);
		}
screws(Base_height);
              
	}
}




module screws(h1){
		translate([-(fan_width/2 -fan_screw_inset),-(fan_width/2 -fan_screw_inset),0]){
			cylinder(r=fan_screw_r, h = h1 );
		}
		translate([(fan_width/2 -fan_screw_inset),-(fan_width/2 -fan_screw_inset),0]){
			cylinder(r=fan_screw_r, h = h1 );
		}
		translate([-(fan_width/2 -fan_screw_inset),(fan_width/2 -fan_screw_inset),0]){
			cylinder(r=fan_screw_r, h = h1 );
		}
		translate([(fan_width/2 -fan_screw_inset),(fan_width/2 -fan_screw_inset),0]){
			cylinder(r=fan_screw_r, h = h1);
		}
}



module pegs(){
translate([0,0,0]){
translate([(-base_width/2)+peg_inset,(-base_width/2)+peg_inset,0]){
	cylinder(h=peg_length+2*d, r =peg_r );
}
translate([(base_width/2)-peg_inset,(-base_width/2)+peg_inset,0]){
	cylinder(h=peg_length+2*d, r =peg_r );
}
translate([(-base_width/2)+peg_inset,(base_width/2)-peg_inset,0]){
	cylinder(h=peg_length+2*d, r =peg_r );
}
translate([(base_width/2)-peg_inset,(base_width/2)-peg_inset,0]){
	cylinder(h=peg_length+2*d, r =peg_r );
}
}
}


module vents(b,n,h,w,a){
	for ( i = [b:n]){	
		translate([0,0,0]){
			rotate(a = a*i, v=[0,0,1]){
				//vent();
				translate([-base_width,-w/2,0]){
					cube([2*base_width,w,h+d]);
				}
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





