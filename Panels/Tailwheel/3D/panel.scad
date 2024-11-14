include <../../../3Dlibrary/buttons.scad>


// faceplate
translate([60, 0, 0])
difference() {
	boxFaceplate(width = 50, length = 200);
    translate([25, 30, 0]) buttonCoverHole(type = "button-adafruit-1009");
    translate([15, 30, 0]) ledHole(type = "small");
	translate([25, 200-35, 0]) buttonCoverHole(type = "switch-mini");

}

// boxInsert
difference() {
	union() {
		boxInsert(width = 50, length = 200);
		translate([25, 30, 0]) buttonBasePocket(type = "button-adafruit-1009");
	}
	translate([25, 30, 0]) buttonBaseHole(type = "button-adafruit-1009", socketHoles = true);
	translate([15, 30, 0]) ledHole(type = "small");

	translate([25, 200-35, 0]) buttonBaseHole(type = "switch-mini");

}
