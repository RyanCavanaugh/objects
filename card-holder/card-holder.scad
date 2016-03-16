width = 85.6 + 1;     // 85.6 plus some margin
height = 53.98 * 3/5; // height reduced to a majority

// e.g. this is two sections of 8 cards and two of 6 cards
sections = [12, 12, 12, 12, 12];

// Cards with raised lettering are about 1.3mm thick
// Cards without are about 0.8mm thick
// Average out to 1.1 or so
card_thickness = 1.1;

wall_thickness = 2.6;
floor_thickness = 1;

total_width = wall_thickness * 2 + width;
total_height = floor_thickness + height;

function sumof(v, i = 0) = i == -1 ? 0 : v[i] + sumof(v, i - 1);

for(i = [0 : len(sections) - 1]) {
    translate([0, sumof(sections, i - 1) * card_thickness + wall_thickness * i, 0])
    difference() {
        cube([total_width, card_thickness * sections[i] + wall_thickness * 2, total_height]);
        translate([wall_thickness, wall_thickness, floor_thickness])
        cube([width, card_thickness * sections[i], height]);
    }
}
