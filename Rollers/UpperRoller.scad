
m_plate_depth = 150;
o_roller_overlap = 2;
o_roller_radius = 8;
o_bearing_contact = 2;
o_cube_size = 5;

c_roller_length = m_plate_depth + 2*(o_roller_overlap);




difference(){

	cylinder( h=c_roller_length, r=o_roller_radius);

	translate(v=[-o_cube_size/2,-o_cube_size/2,0]){
		cube(size=[o_cube_size,o_cube_size,o_cube_size]);
	}
	translate(v=[-o_cube_size/2,-o_cube_size/2,c_roller_length-o_cube_size]){
		cube(size=[o_cube_size,o_cube_size,o_cube_size]);
	}
}