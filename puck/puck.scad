use <../assets/AmaticSC.ttf>
use <../assets/AmaticSC-Bold.ttf>
$fn = 80;
puckHeight = 13;
puckRadius = 35 / 2;
stext = "1 Spin  2 Catch w ith thum bs  3 Shoot at fin ger goal  ";
chars = len( stext );
rulesTextHeight= puckHeight/2.2;

// module to run separately to create the qr.stl
module qrGen() {
  translate([0,0,0])
    scale(puckRadius/100)
      mirror([1,0,0])
        qr("https://puck.wollivan.dev", center=true);
}

module roundText(textArr) {
  for(i=[0:1:chars]){
  rotate([0,0,i*360/chars]){
    translate( [puckRadius*.9,0,0])
      rotate([90,0,90])
        linear_extrude(2)
          text(textArr[i],size=rulesTextHeight, font="AmaticSC-Bold");
    }
  }
}

module roundedCyl() {
  union(){
    rotate_extrude(angle=360)
        offset(r=2) offset(r=-2)
            square([puckRadius,puckHeight]);

    cylinder(h=puckHeight, r=puckRadius/2); // because otherwise there is a divet in the center
  }
}

module sideBottomDesign() {
  // qr
  scale([1,1,2])
    import("../assets/qr.stl");

  // rules text
  translate([0,0,puckHeight/3.75])
    roundText(stext);
}

module topDesign() {
  // top text
  translate([0, -6, puckHeight-1])
    linear_extrude(height=2)
      text(text="PUCK", size=10, halign="center", valign="center", font="AmaticSC");
  // top image
  translate([0,7,puckHeight-1])
    linear_extrude(height = 1) {
        scale(0.023)
            import("../assets/fingergoal.svg", center=true);
    }
}

module puck() {
  difference() {
    roundedCyl();

    // simple version
    topDesign();

    // full version
    sideBottomDesign();

  }
}

puck();

// What the Puck?
