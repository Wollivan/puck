use <../assets/AmaticSC.ttf>

difference() {
  color("#333")cylinder(h=13, d=35, $fn=300);

  color("#000")translate([0, 0, 12.5])
    linear_extrude(height=1)
      text(text="WTP", size=10, halign="center", valign="center", font="AmaticSC");

}
