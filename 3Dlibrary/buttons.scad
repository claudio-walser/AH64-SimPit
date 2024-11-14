// types = {
//    default
//    button-adafruit-1119
//    button-adafruit-1009
//    switch-submini
// }

module boxScrewHoles(width = 50, length = 200, overlap = 6) {
    diameter = 3.2;
    overlapTranslation = (overlap - diameter) / 2 + diameter / 2;
    borderDistance = 10;

    translate([borderDistance, overlapTranslation, -10]) cylinder(d=diameter, h=20, $fn=100);
    translate([width - borderDistance, overlapTranslation, -10]) cylinder(d=diameter, h=20, $fn=100);

    translate([borderDistance, length - overlapTranslation, -10]) cylinder(d=diameter, h=20, $fn=100);
    translate([width - borderDistance, length - overlapTranslation, -10]) cylinder(d=diameter, h=20, $fn=100);
}

module boxFaceplate(width = 50, length = 200) {
    thickness = 1;
    overlap = 8;

    difference() {
        cube(size = [width, length, thickness], center = false);
        boxScrewHoles(width, length, overlap);
    }
}

module boxInsert(width = 50, length = 200) {
    thickness = 2;
    overlap = 8;
    riftThickness = 3;
    riftHeight = 6;

    difference() {
        union() {
            cube(size = [width, length, thickness], center = false);

            // rifts
            translate([overlap, overlap, thickness]) cube(size = [width - (overlap * 2), riftThickness, riftHeight], center = false);
            translate([overlap, length - riftThickness - overlap, thickness]) cube(size = [width - (overlap * 2), riftThickness, riftHeight], center = false);

            translate([overlap, overlap, thickness]) cube(size = [riftThickness, length - (overlap * 2), riftHeight], center = false);
            translate([width - overlap - riftThickness, overlap, thickness]) cube(size = [riftThickness, length - (overlap * 2), riftHeight], center = false);
        }

        boxScrewHoles(width, length, overlap);
    }
}

module ledHole(type="small") {
    if (type == "small") {
        translate([0, 0, -1]) cylinder(d = 3.4, h = 20, $fn = 100);
    } else {
        cylinder(d = 5.1, h = 10, $fn = 100);
    }
}

module buttonCoverHole(type = "default") {
    translate([0, 0, -1])
    if (type == "button-adafruit-1009") {
        cylinder(d = 11.6, h = 10, $fn = 100);
    } else if (type == "button-adafruit-1119") {
        cylinder(d = 6.8, h = 10, $fn = 100);
    } else if (type == "switch-submini") {
        cylinder(d = 4.9, h = 10, $fn = 100);
    } else if (type == "switch-mini") {
        translate([0, 0, -7]) cylinder(d = 5.9, h = 10, $fn = 100);
    } else {
        cylinder(d = 6.8, h = 10, $fn = 100);
    }
}

module buttonBaseHole(type = "default", socketHoles = false) {
    if (type == "button-adafruit-1009") {
       translate([0, 0, -5]) cylinder(d = 13.1, h = 10, $fn = 100);
       cube(size = [14, 11.9, 16], center = true);
    } else if (type == "button-adafruit-1119") {
       cube(size = [14, 11.9, 7], center = true);
    } else if (type == "switch-submini") {
        translate([0, 0, -7]) cylinder(d = 4.9, h = 10, $fn = 100);
    } else if (type == "switch-mini") {
        translate([0, 0, -7]) cylinder(d = 5.9, h = 10, $fn = 100);
    } else {
        translate([0, 0, -7]) cylinder(d = 6.8, h = 10, $fn = 100);
    }

    if (socketHoles == true) {
       translate([0, 4.5, -5]) cylinder(d = 1.5, h = 30, $fn = 100);
       translate([0, -4.5, -5]) cylinder(d = 1.5, h = 30, $fn = 100);
    }
}

module buttonBasePocket(type = "default") {
    if (type == "button-adafruit-1009") {
        translate([0, 0, 6.5]) cube(size = [12, 16, 9], center = true);
    } else if (type == "button-adafruit-1119") {
        translate([0, 0, 4]) cube(size = [12, 16, 4], center = true);
    } else {
        // no pocket at all
    }

}