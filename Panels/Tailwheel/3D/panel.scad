include <../../../3Dlibrary/buttons.scad>


// faceplate
!translate([60, 0, 0]) {
	difference() {
		color("black") boxFaceplate(width = 55, length = 146);
	    translate([12.25, 20, 0]) buttonCoverHole(type = "korry");
		translate([25, 146-35, 0]) buttonCoverHole(type = "switch-mini");

	}
	translate([0, 0, -0.5])
	color("white") {
		linear_extrude(1) {

			font = "Monospace";
			translate([47, 13.5, 0]) {
				// title tailwheel
				rotate([180, 0, 90]) {
					text(text = "TAIL WHEEL", font = font, size = 5);
					translate([-5, -5, 0])
					text(text = "+", font = font, size = 3);
				}
			}

			translate([47, 95, 0]) {
				rotate([180, 0, 90]) {
					// title nvs
					text(text = "NVS Mode", font = font, size = 5);

					translate([0, -4, 0]) {
						translate([11, -7, 0])
						text(text = "FIXED", font = font, size = 3);

						translate([12.5, -31, 0])
						text(text = "OFF", font = font, size = 3);

						translate([27, -13, 0])
						text(text = "N", font = font, size = 3);
						translate([27, -17, 0])
						text(text = "O", font = font, size = 3);
						translate([27, -21, 0])
						text(text = "R", font = font, size = 3);
						translate([27, -25, 0])
						text(text = "M", font = font, size = 3);
					}
				}
			}
		}


		// nvs circle
		translate([25, 146-35, 0])
		difference() {
			cylinder(d=17, h=0.5, $fn = 144);
			translate([0, 0, -1])
			cylinder(d=15, h=5, $fn = 144);
		}

		translate([25, 33, 0.5])
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
	translate([12.25, 20, 0]) buttonBaseHole(type = "korry");

	translate([25, 146-35, 0]) buttonBaseHole(type = "switch-mini");
}
