include <../../../3Dlibrary/buttons.scad>

module korryBaseFixation(width = 25, height = 20, thickness = 1.5, chamfer = 0.1) {
	fixationWidth = width + (thickness * 4) + (buttonSpace * 2);

	// button base walls
	translate([0, 0, - height - (3.5 - thickness)]) {
		cube([fixationWidth, thickness, height]);
		cube([thickness, fixationWidth, height]);
		translate([0, fixationWidth - thickness, 0]) cube([fixationWidth, thickness, height]);
		translate([fixationWidth - thickness, 0, 0])cube([thickness, fixationWidth, height]);
	}

}

module korryBase(width = 25, height = 20, thickness = 1.5, chamfer = 0.1) {

	baseWidth = width + (thickness * 2);
	// Button base
	difference() {
		union() {
			cube([baseWidth, baseWidth, 2]);
			translate([baseWidth / 2, baseWidth / 2, 0]) buttonBasePocket(type = "button-adafruit-1009");

			// screw holes amplification for base fixation
			cube([4, 4, 4]);
			translate([baseWidth - 4, baseWidth - 4, 0])
			cube([4, 4, 4]);

		}

		translate([baseWidth / 2, baseWidth / 2]) buttonBaseHole(type = "button-adafruit-1009", socketHoles = true);

		translate([3.5, baseWidth / 2, 0]) ledHole(type = "small");
		translate([baseWidth - 3.5, baseWidth / 2, 0]) ledHole(type = "small");

		// screw holes for base fixation
		translate([2, 2, -4])
		cylinder(d = 1.8, h = 10, $fn = 144);

		translate([baseWidth - 2, baseWidth - 2, -4])
		cylinder(d = 1.8, h = 10, $fn = 144);
	}




	// button base walls
	translate([0, 0, -height]) {
		cube([baseWidth, thickness, height]);
		cube([thickness, baseWidth, height]);
		translate([0, baseWidth - thickness, 0]) cube([baseWidth, thickness, height]);
		translate([baseWidth - thickness, 0, 0])cube([thickness, baseWidth, height]);
	}

	// button base wall lips

	difference() {
		union() {
			translate([0, 0, -height]) {

				translate([-thickness + chamfer / 2, -thickness, chamfer / 2])
				//minkowski() {
					cube([baseWidth - chamfer + 2 * thickness, thickness * 2 - chamfer, thickness - chamfer]);
					//sphere(d=chamfer, $fn=144);
				//}

				translate([-thickness, -thickness + chamfer / 2, chamfer / 2])
				//minkowski() {
					cube([thickness * 2 - chamfer, baseWidth - chamfer + 2 * thickness, thickness - chamfer]);
					//sphere(d=chamfer, $fn=144);
				//}


				translate([-thickness + chamfer / 2, baseWidth - thickness + chamfer / 2, chamfer / 2])
				//minkowski() {
					cube([baseWidth - chamfer + 2 * thickness, thickness * 2 - chamfer, thickness - chamfer]);
					//sphere(d=chamfer, $fn=144);
				//}

				translate([baseWidth - thickness + chamfer / 2, -thickness + chamfer / 2,  chamfer / 2])
				//minkowski() {
					cube([thickness * 2 - chamfer, baseWidth - chamfer + 2 * thickness, thickness - chamfer]);
					// cube([baseWidth - chamfer + 2 * thickness, thickness * 2 - chamfer, thickness - chamfer]);
					//sphere(d=chamfer, $fn=144);
				//}
			}
		}

		// chamfer
		translate([-10, -3, -height - 4]) {
			rotate([45, 0, 0]) cube([50, 4, 4]);
		}
		translate([-10, baseWidth - 0.2, -height - 1.5]) {
			rotate([-45, 0, 0]) cube([50, 4, 4]);
		}
		translate([baseWidth, 0, 0]) rotate([0, 0, 90]) {
			translate([-10, -3, -height - 4]) {
				rotate([45, 0, 0]) cube([50, 4, 4]);
			}
			translate([-10, baseWidth - 0.2, -height - 1.5]) {
				rotate([-45, 0, 0]) cube([50, 4, 4]);
			}
		}
	}
}

module korryButton(width = 25, height = 20, thickness = 1.5, middle = false) {

	buttonWidth = width - buttonSpace;
	buttonHeight = height - thickness - 4;
	baseWidth = width + (thickness * 2);

	// Button base
	difference() {
		cube([buttonWidth, buttonWidth, 2]);

		// bigger led holes 
		translate([2, buttonWidth / 2, -5]) cylinder(d = 10, h = 10, $fn = 144);
		translate([buttonWidth - 2, buttonWidth / 2, -5]) cylinder(d = 10, h = 10, $fn = 144);
	}

	// button walls
	translate([0, 0, -buttonHeight]) {
		cube([buttonWidth, thickness, buttonHeight]);
		cube([thickness, buttonWidth, buttonHeight + 2]);
		translate([0, buttonWidth - thickness, 0]) cube([buttonWidth, thickness, buttonHeight]);
		translate([buttonWidth - thickness, 0, 0])cube([thickness, buttonWidth, buttonHeight + 2]);
	}

	// lid supports
	supportWidth = buttonWidth-2;
	translate([1, 1, -buttonHeight + lidThickness]) {
		cube([supportWidth, thickness, 2]);
		cube([thickness, supportWidth, 2]);
		translate([0, supportWidth - thickness, 0]) cube([supportWidth, thickness, 2]);
		translate([supportWidth - thickness, 0, 0])cube([thickness, supportWidth, 2]);
	}
}

module buttonLid(width, thickness) {
	// lid supports
	lidWidth = width - thickness * 2 - buttonSpace / 2;
	cube([lidWidth, lidWidth, lidThickness]);
}
