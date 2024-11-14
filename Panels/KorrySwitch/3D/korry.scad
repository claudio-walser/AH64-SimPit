include <../../../3Dlibrary/buttons.scad>

buttonWidth = 25;
buttonHeight = 20;
wallThickness = 1.5;

baseWidth = buttonWidth + (wallThickness * 2);

// Button base
difference() {
	union() {
		cube([baseWidth, baseWidth, 2]);
		translate([baseWidth / 2, baseWidth / 2, 0]) buttonBasePocket(type = "button-adafruit-1009");
	}

	translate([baseWidth / 2, baseWidth / 2]) buttonBaseHole(type = "button-adafruit-1009", socketHoles = true);

	translate([4, baseWidth / 2, 0]) ledHole(type = "small");
	translate([baseWidth - 4, baseWidth / 2, 0]) ledHole(type = "small");
}

// button base walls
translate([0, 0, -buttonHeight]) {
	cube([baseWidth, wallThickness, buttonHeight]);
	cube([wallThickness, baseWidth, buttonHeight]);
	translate([0, baseWidth - wallThickness, 0]) cube([baseWidth, wallThickness, buttonHeight]);
	translate([baseWidth - wallThickness, 0, 0])cube([wallThickness, baseWidth, buttonHeight]);
}

// button base wall lips
chamfer = 0.2;
difference() {
	union() {
		translate([0, 0, -buttonHeight]) {

			translate([-wallThickness + chamfer / 2, -wallThickness, chamfer / 2])
			minkowski() {
				cube([baseWidth - chamfer + 2 * wallThickness, wallThickness * 2 - chamfer, wallThickness - chamfer]);
				sphere(d=chamfer, fn=144);
			}

			translate([-wallThickness, -wallThickness + chamfer / 2, chamfer / 2])
			minkowski() {
				cube([wallThickness * 2 - chamfer, baseWidth - chamfer + 2 * wallThickness, wallThickness - chamfer]);
				sphere(d=chamfer, fn=144);
			}


			translate([-wallThickness + chamfer / 2, baseWidth - wallThickness + chamfer / 2, chamfer / 2])
			minkowski() {
				cube([baseWidth - chamfer + 2 * wallThickness, wallThickness * 2 - chamfer, wallThickness - chamfer]);
				sphere(d=chamfer, fn=144);
			}

			translate([baseWidth - wallThickness + chamfer / 2, -wallThickness + chamfer / 2,  chamfer / 2])
			minkowski() {
				cube([wallThickness * 2 - chamfer, baseWidth - chamfer + 2 * wallThickness, wallThickness - chamfer]);
				// cube([baseWidth - chamfer + 2 * wallThickness, wallThickness * 2 - chamfer, wallThickness - chamfer]);
				sphere(d=chamfer, fn=144);
			}
		}
	}

	// // chamfer - ugly but simple to render
	// translate([-10, -3, -buttonHeight - 4]) {
	// 	rotate([45, 0, 0]) cube([50, 4, 4]);
	// }

	// translate([-10, baseWidth - 0.2, -buttonHeight - 1.5]) {
	// 	rotate([-45, 0, 0]) cube([50, 4, 4]);
	// }

	// translate([baseWidth, 0, 0]) rotate([0, 0, 90]) {
	// 	translate([-10, -3, -buttonHeight - 4]) {
	// 		rotate([45, 0, 0]) cube([50, 4, 4]);
	// 	}

	// 	translate([-10, baseWidth - 0.2, -buttonHeight - 1.5]) {
	// 		rotate([-45, 0, 0]) cube([50, 4, 4]);
	// 	}
	// }

}