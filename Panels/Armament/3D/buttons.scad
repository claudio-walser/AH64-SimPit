include <../../KorrySwitch/3D/korry.scad>

width = 22;
height = 12;
thickness = 1.5;
chamfer = 0.1;
buttonSpace = .2;
lidThickness = 2;

lidWidth = width - thickness * 2 - buttonSpace / 2;

font = "Liberation Sans";


// ARM Button
translate([- thickness - buttonSpace, - thickness - buttonSpace, 6])
korryBaseFixation(width, height, thickness, chamfer);

korryBase(width, height, thickness, chamfer);

translate([thickness + buttonSpace / 2, thickness + buttonSpace / 2, -lidThickness -buttonSpace-4])
color("blue") korryButton(width, height, thickness, middle = true);


rotate([180,0,0])
translate([thickness * 2, -lidWidth - thickness * 2, height-thickness])
difference() {
	color("green")buttonLid(width, thickness);

	translate([4.7, lidWidth-5, 1.05]) linear_extrude(height = 1) {
		text(text = "ARM", font = font, size = 3.2);
	}

	translate([3.8, 2, 1.05]) linear_extrude(height = 1) {
		text(text = "SAFE", font = font, size = 3.2);
	}

}

// GND Overwrite Button
translate([60, 0, 0]) {
	translate([- thickness - buttonSpace, - thickness - buttonSpace, 6])
	korryBaseFixation(width, height, thickness, chamfer);

	korryBase(width, height, thickness, chamfer);

	translate([thickness + buttonSpace / 2, thickness + buttonSpace / 2, -lidThickness -buttonSpace-4])
	color("blue") korryButton(width, height, thickness);


	rotate([180,0,0])
	translate([thickness * 2, -lidWidth - thickness * 2, height-thickness])
	difference() {
		color("green")buttonLid(width, thickness);

		translate([4.0, lidWidth/2 - 3.6/2, 1.05]) linear_extrude(height = 1) {
			text(text = "ON", font = font, size = 5.2);
		}
	}
}
