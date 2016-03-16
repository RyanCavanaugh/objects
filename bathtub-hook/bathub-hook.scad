$fn = 120;

top_hook_depth = 24;
top_hook_gap = 19;
bottom_hook_gap = 6;
bottom_hook_depth = 8;

height = 54;
width = 20;

thickness = 4;

main_bar_length = height - bottom_hook_depth + thickness;

// Top bar
color("red")
translate([-(top_hook_gap + thickness), 0, 0])
cube([thickness * 2 + top_hook_gap, thickness, width]);

// Top hook
color("green")
translate([-(top_hook_gap + thickness), -top_hook_depth, 0])
cube([thickness, thickness + top_hook_depth, width]);

// Main bar
color("blue")
translate([0, -(main_bar_length - thickness), 0])
cube([thickness, main_bar_length, width]);

// Bottom hook
color("yellow")
translate([bottom_hook_gap + thickness, -main_bar_length + thickness, 0])
linear_extrude(width) {
  minkowski() {
    intersection() {
        difference() {
            scale([bottom_hook_gap * 2 + thickness, bottom_hook_depth * 2 + thickness, 1]) {
                circle(d = 1);
            };
            scale([bottom_hook_gap * 2 + thickness, bottom_hook_depth * 2 + thickness, 1]) {
                circle(d = 0.99);
            };
        };
        translate([-50, -100])
        square([100, 100]);
    }
    circle(r = thickness / 2);
  }
};

/*
// Bottom hook
translate([thickness, -height + bottom_hook_gap, 0])
intersection() {
    scale([1, -1, 1])
    cube([bottom_hook_gap * 2, bottom_hook_gap * 2, width]);
    difference() {
        cylinder(r = bottom_hook_gap + thickness, h = width);
        cylinder(r = bottom_hook_gap, h = width);
    }
}
*/
