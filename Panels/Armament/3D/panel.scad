include <../../../3Dlibrary/buttons.scad>


// faceplate
translate([60, 0, 0]) {
	difference() {
		color("black") boxFaceplate(width = 55, length = 146);
	    translate([8.25, 40, 0]) buttonCoverHole(type = "korry");
		translate([8.5, 146-40-25, 0]) buttonCoverHole(type = "korry");

	}
	translate([1, 0, -0.5])
	color("white") {
		linear_extrude(1) {

			font = "Monospace";
			translate([46, 57, 0]) {
				// title tailwheel
				rotate([180, 0, 90]) {
					text(text = "ARMAMENT", font = font, size = 5);
					translate([15, -45, 0])
					text(text = "+", font = font, size = 3);
				}
			}

			translate([47, 95, 0]) {
				rotate([180, 0, 90]) {

					translate([-23, -2, 0]) {
						translate([11, -7, 0])
						text(text = "GND ORIDE", font = font, size = 3);

					}

					translate([-56, -2, 0]) {
						translate([11, -7, 0])
						text(text = "A/S", font = font, size = 3);

					}
				}
			}
		}

		// arm button marking
		translate([20, 52.7, 0.5])
		difference() {
			cube([32, 32, 0.5], center=true);
			translate([0, 0, -1])
			cube([30, 30, 5], center=true);

		}

		// ground overwrite button marking
		translate([20, 146 - 52.3, 0.5])
		difference() {
			cube([32, 32, 0.5], center=true);
			translate([0, 0, -1])
			cube([30, 30, 5], center=true);

		}
	}
}

// boxInsert
difference() {
	boxInsert(width = 55, length = 146);
	translate([8.25, 40, 0]) buttonBaseHole(type = "korry");

	translate([8.25, 146-40-25, 0]) buttonBaseHole(type = "korry");
}
