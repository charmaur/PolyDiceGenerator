include <BOSL2/std.scad>
include <BOSL2/polyhedra.scad>

dice_size  = 20;      // [10:10:100]

bevel_edge = false;
bevel_vertex = false;

edge_size  = 1;       // [0:None, 1:Small, 3:Large]
number_depth = 0.6;   // [0.2:0.2:4]

primary_fontface   = "DejaVu Sans:style=Condensed Bold";
primary_text       = ["1","A","B","C","D","E","","","","","","","","","","","","","",""];
secondary_fontface = "DejaVu Sans:style=Condensed Bold";
secondary_text     = ["undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef","undef",];

calculated_edge = dice_size/10*edge_size;
face_size = regular_polyhedron_info("edge length", "icosahedron", facedown=false, mr=dice_size, anchor=CENTER);
font_size = 200/face_size;

difference() {
  // Outer hull
  minkowski () {
    regular_polyhedron(name="icosahedron", facedown=false, mr=dice_size-(calculated_edge), anchor=CENTER);

    if (true == bevel_edge) {
      hull () {
        rotate([90,0,0]) regular_polyhedron(name="truncated dodecahedron", facedown=false, mr=calculated_edge, anchor=CENTER);

        if (false == bevel_vertex) {
          regular_polyhedron(name="icosahedron", facedown=false, mr=calculated_edge, anchor=CENTER);
        }
      }
    } else { //sharp edge
      if (true == bevel_vertex) {
        regular_polyhedron(name="truncated icosahedron", facedown=false, mr=calculated_edge, anchor=CENTER);
      } else {
        regular_polyhedron(name="icosahedron", facedown=false, mr=calculated_edge, anchor=CENTER);
      }
    }
  }

  // Numbers
  regular_polyhedron(name="icosahedron", facedown=false, mr=dice_size, anchor=CENTER, draw=false)
     down(number_depth) linear_extrude(height=number_depth*2) {
       echo ($face);
        text(str(primary_text[$faceindex]),halign="center",valign="center", size=200/face_size, font=primary_fontface);
     }
}