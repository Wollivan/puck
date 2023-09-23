use <../assets/AmaticSC.ttf>
$fn = 300;
puckHeight = 13;
puckDiameter = 35;

puck();

module puck() {
  difference() {
    cylinder(h=puckHeight, d=puckDiameter);

    translate([0, 0, 12.5])
      linear_extrude(height=1)
        text(text="WTP", size=10, halign="center", valign="center", font="AmaticSC");
  }
}