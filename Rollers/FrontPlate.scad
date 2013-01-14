// Roller Project Part #1 Front Bracket

PlateThickness = 5;
roller_depression = 2;

UpperRollerRadius = 15;
LowerRollerRadius = 10;

UpperRollerLip = 5;
LowerRollerLip = 5;

InnerHoleWidth = 95;
InnerHoleHeight= 25;

TopGapHeight = 10;
BottomGapHeight = 10;

UpperRollerOutset = 30;
LowerRollerOutset = 15;

Upper_bearing_r = 8;
Lower_bearing_r =8;

C_total_height = InnerHoleHeight + TopGapHeight + BottomGapHeight;


main();

module main(){
	difference(){
		hulled_part_a();
		holes();
		translate( v = [InnerHoleWidth/2 + UpperRollerOutset,-UpperRollerRadius,PlateThickness-roller_depression]){
			cylinder(h=roller_depression, r=UpperRollerRadius);
		}
		translate( v = [-(InnerHoleWidth/2 + UpperRollerOutset),-UpperRollerRadius,PlateThickness-roller_depression]){
			cylinder(h=roller_depression, r=UpperRollerRadius);
		}	
		translate( v = [InnerHoleWidth/2 + LowerRollerOutset,-C_total_height+LowerRollerRadius,PlateThickness-roller_depression]){
			cylinder(h=roller_depression, r=LowerRollerRadius);
		}
		translate( v = [-(InnerHoleWidth/2 + LowerRollerOutset),-C_total_height+LowerRollerRadius,PlateThickness-roller_depression]){
			cylinder(h=roller_depression, r=LowerRollerRadius);
		}		
	}

}


module part1a(side,radius,x,y){
	translate(v = [side*x, y,0]){
		cylinder(h = PlateThickness, r = radius);
	}
}

module hulled_part_a(){
	hull(){
		part1a(1,UpperRollerRadius,InnerHoleWidth/2 + UpperRollerOutset+UpperRollerLip,-UpperRollerRadius);
		part1a(-1,UpperRollerRadius,InnerHoleWidth/2 + UpperRollerOutset+UpperRollerLip,-UpperRollerRadius);

		part1a(1,LowerRollerRadius,InnerHoleWidth/2 + LowerRollerOutset+LowerRollerLip,
		-(InnerHoleHeight+TopGapHeight+BottomGapHeight-LowerRollerRadius));
		part1a(-1,LowerRollerRadius,InnerHoleWidth/2 + LowerRollerOutset+LowerRollerLip,
		-(InnerHoleHeight+TopGapHeight+BottomGapHeight-LowerRollerRadius));
	}
}

module holes(){
	translate( v= [-InnerHoleWidth/2,-InnerHoleHeight-TopGapHeight]){
		cube(size=[InnerHoleWidth,InnerHoleHeight,PlateThickness]);
	}
	translate(v=[InnerHoleWidth/2+UpperRollerOutset,-UpperRollerRadius,0]){
		cylinder(h = PlateThickness, r = Upper_bearing_r);
	}
	translate(v=[-(InnerHoleWidth/2+UpperRollerOutset),-UpperRollerRadius,0]){
		cylinder(h = PlateThickness, r = Upper_bearing_r);
	}
	translate(v=[InnerHoleWidth/2+LowerRollerOutset,-C_total_height+LowerRollerRadius,0]){
		cylinder(h = PlateThickness, r = Lower_bearing_r);
	}
	translate(v=[-(InnerHoleWidth/2+LowerRollerOutset),-C_total_height+LowerRollerRadius,0]){
		cylinder(h = PlateThickness, r = Lower_bearing_r);
	}
}






