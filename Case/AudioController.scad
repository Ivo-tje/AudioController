knob_size = 25; // size of the knob on rotary decoder in mm to make led hole underneath
button_size = 12;

module Base(){
    difference(){
        union(){
            // Botten with screw poles
            difference(){
                cube([100,70,90]);
                translate([2,2,2])
                cube([96,66,48]);
                translate([-1,0,20])
                    rotate([10,0,0])
                        cube([102,100,90]);
            }
            translate([5,5,0])
                difference(){
                    cylinder(d=5,h=12,$fn=25);
                    cylinder(d=2.5,h=12,$fn=25);
                }
            translate([95,5,0])
                difference(){
                    cylinder(d=5,h=12,$fn=25);
                    cylinder(d=2.5,h=12,$fn=25);
                }
            translate([95,65,0])
                difference(){
                    cylinder(d=5,h=25,$fn=25);
                    cylinder(d=2.5,h=25,$fn=25);
                }
            translate([5,65,0])
                difference(){
                    cylinder(d=5,h=25,$fn=25);
                    cylinder(d=2.5,h=25,$fn=25);
                }
            translate([36,35,2])
                cube([1,35,3]);
            translate([63,35,2])
                cube([1,35,3]);
            translate([36,35,2])
                cube([28,1,3]);
            }
        // Edge for TopPlate
        translate([1,1,19])
        rotate([10,0,0])
            cube([98,69,25]);
        // USB-C port    
        hull() {
            translate([46.25,68,3.5])
              rotate([270,0,0])
                cylinder(d=3,h=2,$fn=25);
            translate([52.75,68,3.5])
              rotate([270,0,0])
                cylinder(d=3,h=2,$fn=25);
        }
    }
}
    
    // Cover
module TopPlate(){
    rotate([0,0,0])
        union(){
            difference(){
                rotate([-10,0,0])
                    difference(){   
                        translate([1,1,8])
                            rotate([10,0,0])
                                cube([98,69,2]);
                        translate([5,5,8])
                            cylinder(d=2.5,h=8,$fn=25);
                        translate([95,5,8])
                            cylinder(d=2.5,h=8,$fn=25);
                        translate([5,65,1])
                            cylinder(d=2.5,h=25,$fn=25);
                        translate([95,65,7])
                            cylinder(d=2.5,h=100,$fn=25);
                    }
                    // Rotary decoder hole
                    translate([49,19.5,-6.5])
                        cylinder(d=6.1,h=33,$fn=50);
                    translate([49,19.5,-7.5])
                        cylinder(d=7.1,h=16,$fn=50);
                    
                    // LED
                    translate([49,30,7.3])
                        cylinder(d=10,h=2,$fn=25);
                    intersection(){
                    translate([49,30,8])
                        cylinder(d=10,h=2,$fn=25);
                    translate([49,19.5,8])
                        cylinder(d=knob_size-0.1,h=10,$fn=50);
                    }
                    // Prev button hole
                    translate([25,19.5,7.5])
                        cylinder(d=button_size+0.1,h=3,$fn=50);
                    // next button hole
                    translate([73,19.5,7.5])
                        cylinder(d=button_size+0.1,h=3,$fn=50);
                }
            difference(){
                // Rotary decoder spacer
                translate([49,19.5,1.8])
                    cylinder(d=9,h=6,$fn=50);
               translate([49,19.5,-6.5])
                    cylinder(d=7.1,h=33,$fn=50);
            }
            // poles for keeping the rotary pcb in place.
            translate([57,14,-8.2])
                cylinder(d=2,h=16,$fn=25);
            translate([57,14,-4.2])
                cylinder(d=4,h=12,$fn=25);
            translate([57,27.5,-8.2])
                cylinder(d=2,h=16,$fn=25);
            translate([57,27.5,-4.2])
                cylinder(d=4,h=12,$fn=25);
            
            // Poles for PN532 PCB
            translate([35,36.5,-4.2])
                cylinder(d=3,h=12,$fn=25);
            translate([35,36.5,2.8])
                cylinder(d=5,h=5,$fn=25);
            translate([63,62.5,-4.2])
                cylinder(d=3,h=12,$fn=25);
            translate([63,62.5,2.8])
                cylinder(d=5,h=5,$fn=25);
            // Anti tipping PN532
            translate([63,36.5,2.8])
                cylinder(d=5,h=5,$fn=25);
            translate([35,62.5,2.8])
                cylinder(d=5,h=5,$fn=25);
            }
}
    
    //Base();
    translate([0,0,10])
        TopPlate();