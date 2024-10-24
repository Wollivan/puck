use <../assets/AmaticSC.ttf>
$fn = 100;
puckHeight = 13;
puckRadius = 35 / 2;
stext = "1.Spin puck 2.Opp catch with thumbs 3.Shoot at a finger goal from edge of table";
stext2 = "Advantage rule: If it spins off the table spin again catcher gets free miss";;
chars = len( stext );
rulesTextHeight= puckHeight/3.25;

module roundText(textArr) {
  for(i=[0:1:chars]){
  rotate([0,0,i*4.5]){
    translate( [puckRadius*.95,0,0])
      rotate([90,0,90])
        linear_extrude(1)
          text(textArr[i],size=rulesTextHeight,valign="center",halign="center", font="AmaticSC");
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

module puck() {
  difference() {
    color("#333333") roundedCyl();

    // top text
    translate([0, 0, puckHeight-1])
      linear_extrude(height=2)
        text(text="PUCK", size=12, halign="center", valign="center", font="AmaticSC");
    // rules text
    translate([0,0,rulesTextHeight*2.2])
      roundText(stext);
    translate([0,0,rulesTextHeight])
      roundText(stext2);
    // bottom image
    translate([0,6,0])
      linear_extrude(height = 1) {
          scale(0.023)
              import("../assets/fingergoal.svg", center=true);
    }
    // bottom text
    translate([0, -3, 1])
      rotate([0,180,0])
        linear_extrude(height=2)
          text(text="puck.wollivan.dev", size=4, halign="center", valign="center", font="AmaticSC");
  }
}

puck();

// What the Puck?
