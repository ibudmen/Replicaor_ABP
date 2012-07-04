$fn=50;


lip_outer_width = 67;
lip_outer_radius = 10;
lip_inner_width = 63;
lip_inner_radius = 6;
lip_height= 7;
base_height = 20;

cube([30,50,base_height]);




linear_extrude(height=lip_height+base_height){
	projection(cut = true){
		difference(){
			minkowski()
			{
			 cube([lip_outer_width,lip_outer_width,1], center= true);
			 cylinder(r=lip_outer_radius,h=1,center= true);
			}
		
			minkowski()
			{
			 cube([lip_inner_width,lip_inner_width,1], center= true);
			 cylinder(r=lip_inner_radius,h=1, center= true);
			}
		}
	}

}


cylinder(r = r1, h = h);






