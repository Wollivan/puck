include <qr.scad>
puckRadius = 35 / 2;
translate([0,0,0])
  scale(puckRadius/100)
    mirror([1,0,0])
      qr("https://puck.wollivan.dev", center=true);