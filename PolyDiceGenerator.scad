//------------------------------------------
// PolyDiceGenerator v0.25.0
//   A customizable Polyhedral Dice Generator for OpenSCAD.
//   https://github.com/charmaur/PolyDiceGenerator
//
// Requirements
//   OpenSCAD http://www.openscad.org
//   The BOSL2 library https://github.com/revarbat/BOSL2
//
//   *Note due to recent BOSL2 updates v2.0.402 is currently required. It can be found here:
//    https://github.com/revarbat/BOSL2/tree/e56f953c1cd8db7e7e198e6d7d49650f133ab92a
//------------------------------------------

include <BOSL2/std.scad>
include <BOSL2/polyhedra.scad>
assert(bosl_version()==[2,0,402], "BOSL2 v2.0.402 is required.");
$fn=$preview ? 30 : 100;

//------------------------------------------
// Configuration
//------------------------------------------

/* [Fonts] */
number_font="LiberationSerif:style=Bold";
underscore_font="LiberationSerif:style=Bold";
symbol_font="SWAstro";

/* [Dice to Draw] */
d4=true;
d4c=true;
d6=true;
d8=true;
d10=true;
d00=true;
d12=true;
d20=true;

/* [Dice Size] */
d4_size=20;
d4c_size=13;
d6_size=15;
d8_size=15;
d10_size=16;
d00_size=16;
d12_size=18;
d20_size=20;

/* [Number Depth] */
number_depth=0.6;

/* [Rounding] */
edge_rounding=0;
d6_corner_rounding=29; //set to 0 to disable

/* [d4 Tetrahedron] */
d4_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d4_number_size=34;
d4_number_v_push=30;
d4_number_h_push=0;
d4_number_4_h_push=-3; //horizontal adjustment for #4s
d4_custom_dist=["3","4","3","3","2","2","4","4","1","1","1","2"];
d4_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d4_symbol_size=34;
d4_symbol_v_push=0;
d4_symbol_h_push=0;
d4_custom_rotate=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];

/* [d4c Crystal] */
d4c_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d4c_number_size=72;
d4c_number_v_push=0;
d4c_number_h_push=0;
d4c_number_4_h_push=-3; //horizontal adjustment for #4s
d4c_body_length=1.2;
d4c_point_length=0.6;
d4c_custom_dist=["1","2"," "," ","3","4"];
d4c_symbols=[undef,undef,undef,undef,undef,undef];
d4c_symbol_size=72;
d4c_symbol_v_push=0;
d4c_symbol_h_push=0;
d4c_custom_rotate=[0,0,0,0,0,0];

/* [d6 Cube] */
d6_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d6_number_size=62;
d6_number_v_push=0;
d6_number_h_push=0;
d6_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d6_number_4_h_push=-3; //horizontal adjustment for #4s
d6_angle_numbers=false; //angle d6 text
d6_custom_dist=["1","3","5","2","4","6"];
d6_symbols=[undef,undef,undef,undef,undef,undef];
d6_symbol_size=62;
d6_symbol_v_push=0;
d6_symbol_h_push=0;
d6_custom_under=[" "," "," "," "," ","_"];
d6_under_size=48;
d6_under_push=32;
d6_custom_rotate=[0,0,0,0,0,0];
d6_pip_dist=[" "," "," "," "," "," "];
d6_pip_size=20;
d6_pip_offset=2.5;
d6_pip_symbol_dist=["1","3","5","2","4","6"];
d6_pip_symbols=[undef,undef,undef,undef,undef,undef]; //symbols for pips

/* [d8 Octahedron] */
d8_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d8_number_size=55;
d8_number_v_push=2;
d8_number_h_push=0;
d8_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d8_number_4_h_push=-3; //horizontal adjustment for #4s
d8_custom_dist=["1","4","3","2","6","7","5","8"];
d8_symbols=[undef,undef,undef,undef,undef,undef,undef,undef];
d8_symbol_size=55;
d8_symbol_v_push=0;
d8_symbol_h_push=0;
d8_custom_under=[" "," "," "," ","_"," "," "," "];
d8_under_size=42;
d8_under_push=26;
d8_custom_rotate=[0,0,0,0,0,0,0,0];

/* [d10 Trapezohedron] */
d10_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d10_number_size=48;
d10_number_v_push=7.5;
d10_number_h_push=0;
d10_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d10_number_4_h_push=-3; //horizontal adjustment for #4s
d10_length_mod=0;
d10_custom_dist=["9","1","7","5","3","6","2","4","0","8"];
d10_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d10_symbol_size=48;
d10_symbol_v_push=0;
d10_symbol_h_push=0;
d10_custom_under=["_"," "," "," "," ","_"," "," "," "," "];
d10_under_size=37;
d10_under_push=17;
d10_custom_rotate=[0,0,0,0,0,0,0,0,0,0];

/* [d00 Trapezohedron] */
d00_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d00_number_size=48;
d00_number_v_push=0;
d00_number_h_push=-4;
d00_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d00_length_mod=0;
d00_angle_numbers=true; //angle d00 text
d00_0_size=65; //"0" undersize if d00_angle_numbers=true
d00_0_padding=50; //"0" padding if d00_angle_numbers=true
d00_custom_dist=["90","10","70","50","30","60","20","40","00","80"];
d00_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d00_symbol_size=48;
d00_symbol_v_push=0;
d00_symbol_h_push=0;
d00_custom_rotate=[0,0,0,0,0,0,0,0,0,0];

/* [d12 Dodecahedron] */
d12_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d12_number_size=36;
d12_number_v_push=0;
d12_number_h_push=0;
d12_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d12_number_4_h_push=-3; //horizontal adjustment for #4s
d12_custom_dist=["1","4","2","6","8","10","3","5","11","7","12","9"];
d12_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d12_symbol_size=36;
d12_symbol_v_push=0;
d12_symbol_h_push=0;
d12_custom_under=[" "," "," ","_"," "," "," "," "," "," "," ","_"];
d12_under_size=28;
d12_under_push=19;
d12_custom_rotate=[0,0,0,0,0,0,0,0,0,0,0,0];

/* [d20 Icosahedron] */
d20_distribution=1; //[1:Standard N+1,2:DiceLab,3:Custom]
d20_number_size=23;
d20_number_v_push=0;
d20_number_h_push=0;
d20_number_spacing=0.99; //decimal, default value of 1 (0.99 for customizer)
d20_number_4_h_push=-3; //horizontal adjustment for #4s
d20_custom_dist=["1","5","13","11","7","15","19","6","9","18","4","14","17","16","3","12","2","20","8","10"];
d20_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d20_symbol_size=23;
d20_symbol_v_push=0;
d20_symbol_h_push=0;
d20_custom_under=[" "," "," "," "," "," "," ","_","_"," "," "," "," "," "," "," "," "," "," "," "];
d20_under_size=18;
d20_under_push=12;
d20_custom_rotate=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

//------------------------------------------
// Hidden variables
//------------------------------------------

/* [Hidden] */
//d4
d4_std_dist=["3","4","3","3","2","2","4","4","1","1","1","2"];
d4_std_rotate=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];
d4_dl_dist=["1","4","1","1","2","2","4","4","3","3","3","2"];
d4_dl_rotate=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];

//d4c
d4c_std_dist=["1","2"," "," ","3","4"];
d4c_std_rotate=[0,0,0,0,0,0];
d4c_dl_dist=["1","2"," "," ","3","4"];
d4c_dl_rotate=[0,0,0,0,0,0];

//d6
d6_std_dist=["1","3","5","2","4","6"];
d6_std_under=[" "," "," "," "," ","_"];
d6_std_rotate=[0,0,0,0,0,0];
d6_dl_dist=["1","2","3","4","5","6"];
d6_dl_under=[" "," "," "," "," ","_"];
d6_dl_rotate=[0,180,90,0,-90,90];

//d8
d8_std_dist=["1","4","3","2","6","7","5","8"];
d8_std_under=[" "," "," "," ","_"," "," "," "];
d8_std_rotate=[0,0,0,0,0,0,0,0];
d8_dl_dist=["1","6","7","4","2","5","3","8"];
d8_dl_under=[" ","_"," "," "," "," "," "," "];
d8_dl_rotate=[0,0,0,0,0,0,0,0];

//d10
d10_std_dist=["9","1","7","5","3","6","2","4","0","8"];
d10_std_under=["_"," "," "," "," ","_"," "," "," "," "];
d10_std_rotate=[0,0,0,0,0,0,0,0,0,0];
d10_dl_dist=["9","1","6","2","5","4","3","7","0","8"];
d10_dl_under=["_"," ","_"," "," "," "," "," "," "," "];
d10_dl_rotate=[0,0,0,0,0,0,0,0,0,0];

//d00
d00_std_dist=["90","10","70","50","30","60","20","40","00","80"];
d00_std_rotate=[0,0,0,0,0,0,0,0,0,0];
d00_dl_dist=["90","10","60","20","50","40","30","70","00","80"];
d00_dl_rotate=[0,0,0,0,0,0,0,0,0,0];

//d12
d12_std_dist=["1","4","2","6","8","10","3","5","11","7","12","9"];
d12_std_under=[" "," "," ","_"," "," "," "," "," "," "," ","_"];
d12_std_rotate=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_dl_dist=["1","10","7","9","5","11","2","8","6","4","12","3"];
d12_dl_under=[" "," "," ","_"," "," "," "," ","_"," "," "," "];
d12_dl_rotate=[-144,144,-144,0,36,72,72,-72,-72,144,-72,0];

//d20
d20_std_dist=["1","5","13","11","7","15","19","6","9","18","4","14","17","16","3","12","2","20","8","10"];
d20_std_under=[" "," "," "," "," "," "," ","_","_"," "," "," "," "," "," "," "," "," "," "," "];
d20_std_rotate=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_dl_dist=["1","12","11","19","15","13","5","8","17","7","3","6","18","9","14","4","16","20","10","2"];
d20_dl_under=[" "," "," "," "," "," "," "," "," "," "," ","_"," ","_"," "," "," "," "," "," "];
d20_dl_rotate=[0,-120,0,120,-120,0,120,0,0,-120,120,120,-120,120,120,0,-120,0,0,-120];

//------------------------------------------
// Generation, functions, modules
//------------------------------------------

spacing=d10_size;
if(d4) fwd(d4_size/2+spacing) drawd4();
if(d4c) move(x=-d4c_size/2-spacing,y=-d4c_size/2-d4c_point_length*d4c_size-spacing) drawd4c();
if(d6) drawd6();
if(d8) back(d8_size/2+spacing) drawd8();
if(d10) move(x=-d10_size/2-spacing,y=d10_size/2+spacing) drawd10();
if(d00) left(d00_size/2+spacing) drawd00();
if(d12) move(x=d12_size/2+spacing,y=d12_size/2+spacing) drawd12();
if(d20) right(d20_size/2+spacing) drawd20();

//function build_undrescore(dist_list)=[for (i=dist_list) if(i=="6" || i=="9") "_" else ""];

function fix_undef(x)=[for (i=x) if(i=="undef" || i==undef) undef else i];

function merge_symbols(dist,sym)=[for (a=[0:len(dist)-1]) if(sym[a]=="undef" || sym[a]==undef) dist[a] else [sym[a]]];

module drawd4(){
    d4_dist=d4_distribution==1 ? d4_std_dist : d4_distribution==2 ? d4_dl_dist : d4_custom_dist;
    d4_rotate=d4_distribution==1 ? d4_std_rotate : d4_distribution==2 ? d4_dl_rotate : d4_custom_rotate;
    d4_symbols=fix_undef(d4_symbols);
    d4_merged=merge_symbols(d4_dist,d4_symbols);
    num_mult=d4_number_size*d4_size/100;
    sym_mult=d4_symbol_size*d4_size/100;
    base_rotate=[-15,15,15,15,105,255,255,135,225,135,135,255];

    difference(){
        //render tetrahedron
        regular_polyhedron("tetrahedron",side=sqrt(3/2)*(d4_size+edge_rounding),facedown=true,anchor=BOTTOM,rounding=edge_rounding);
        
        //render numbers
        for(i=[0,1,2])
            regular_polyhedron("tetrahedron",side=sqrt(3/2)*(d4_size+edge_rounding),facedown=true,anchor=BOTTOM,draw=false)
            zrot(d4_rotate[$faceindex+i*4]+base_rotate[$faceindex+i*4])
            down(number_depth) linear_extrude(height=2*number_depth)
            move(x=d4_number_h_push*d4_size/100,y=d4_number_v_push*d4_size/100)
            if(is_list(d4_merged[$faceindex+i*4])) //a symbol
                move(x=d4_symbol_h_push*d4_size/100,y=d4_symbol_v_push*d4_size/100)
                text(d4_merged[$faceindex+i*4][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
            else if(d4_merged[$faceindex+i*4]=="4") //a number 4
                right(d4_number_4_h_push*d4_size/100)
                text(d4_merged[$faceindex+i*4],size=num_mult,font=number_font,halign="center",valign="center");
            else //a number thats's not 4
                text(d4_merged[$faceindex+i*4],size=num_mult,font=number_font,halign="center",valign="center");
    }
}

module drawd4c(){
    d4c_dist=d4c_distribution==1 ? d4c_std_dist : d4c_distribution==2 ? d4c_dl_dist : d4c_custom_dist;
    d4c_rotate=d4c_distribution==1 ? d4c_std_rotate : d4c_distribution==2 ? d4c_dl_rotate : d4c_custom_rotate;
    d4c_symbols=fix_undef(d4c_symbols);
    d4c_merged=merge_symbols(d4c_dist,d4c_symbols);
    num_mult=d4c_number_size*d4c_size/100;
    sym_mult=d4c_symbol_size*d4c_size/100;
    base_rotate=[180,180,180,180,180,180];

    difference(){
        //render cube 
        d4cbase(d4c_size);
        
        //render numbers
        regular_polyhedron("cube",side=d4c_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d4c_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d4c_number_h_push*d4c_size/100,y=d4c_number_v_push*d4c_size/100)
        if(is_list(d4c_merged[$faceindex])) //a symbol
            move(x=d4c_symbol_h_push*d4c_size/100,y=d4c_symbol_v_push*d4c_size/100)
            text(d4c_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else if(d4c_merged[$faceindex]=="4") //a number 4
            right(d4c_number_4_h_push*d4c_size/100)
            text(d4c_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else //a number thats's not 4
            text(d4c_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
    }
}

module d4cbase(d4c_size){
    up(edge_rounding)
    minkowski(){
        d4c_body_length=d4c_body_length*d4c_size;
        d4c_point_length=d4c_point_length*d4c_size;
        scale((d4c_size-2*edge_rounding)/d4c_size){
            cuboid([d4c_size,d4c_body_length,d4c_size],anchor=BOTTOM);
            translate([0,-d4c_body_length/2,d4c_size/2])
            rotate([90,90,0])
            prismoid([d4c_size,d4c_size],[0,0],h=d4c_point_length);
            mirror([1,0,0])
            translate([0,d4c_body_length/2,d4c_size/2])
            rotate([-90,-90,0])
            prismoid([d4c_size,d4c_size],[0,0],h=d4c_point_length);
        }
        if(edge_rounding>0) sphere(r=edge_rounding);
    }
}

module drawd6(){
    d6_dist=d6_distribution==1 ? d6_std_dist : d6_distribution==2 ? d6_dl_dist : d6_custom_dist;
    d6_rotate=d6_distribution==1 ? d6_std_rotate : d6_distribution==2 ? d6_dl_rotate : d6_custom_rotate;
    d6_under=d6_distribution==1 ? d6_std_under : d6_distribution==2 ? d6_dl_under : d6_custom_under;
    d6_symbols=fix_undef(d6_symbols);
    d6_merged=merge_symbols(d6_dist,d6_symbols);
    num_mult=d6_number_size*d6_size/100;
    sym_mult=d6_symbol_size*d6_size/100;
    under_mult=d6_under_size*d6_size/100;
    space_mult=d6_number_spacing>1 ? (d6_number_spacing-1)*num_mult/3.15 : d6_number_spacing<1 ? (-1+d6_number_spacing)*num_mult/2.8 : 0;
    corner_mult=d6_corner_rounding*d6_size/100;
    base_rotate=[0,-90,0,-90,180,90];
    rotate_mod=d6_angle_numbers ? 45 : 0;
    
    intersection(){
        if(d6_corner_rounding>0)
            translate([0,0,d6_size/2]) sphere(r=d6_size-corner_mult,$fn=100);

        difference(){
            //render cube
            regular_polyhedron("cube",side=d6_size,facedown=true,anchor=BOTTOM,rounding=edge_rounding);

            //render numbers
            regular_polyhedron("cube",side=d6_size,facedown=true,anchor=BOTTOM,draw=false)
            zrot(d6_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
            down(number_depth) linear_extrude(height=2*number_depth)
            move(x=d6_number_h_push*d6_size/100,y=d6_number_v_push*d6_size/100)
            if(is_list(d6_merged[$faceindex])) //a symbol
                move(x=d6_symbol_h_push*d6_size/100,y=d6_symbol_v_push*d6_size/100)
                text(d6_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
            else if(d6_merged[$faceindex]=="4") //a number 4
                right(d6_number_4_h_push*d6_size/100)
                text(d6_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
            else if(len(d6_merged[$faceindex])==1) //a single digit number that's not 4
                text(d6_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
            else //a double digit number
                right(space_mult)
                text(d6_merged[$faceindex],size=num_mult,font=number_font,spacing=d6_number_spacing,halign="center",valign="center");
            
            //render underscore
            regular_polyhedron("cube",side=d6_size,facedown=true,anchor=BOTTOM,draw=false)
            zrot(d6_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
            down(number_depth) linear_extrude(height=2*number_depth)
            fwd(d6_under_push*d6_size/100)
            text(d6_under[$faceindex],size=under_mult,font=underscore_font,halign="center",valign="center");

            //render pips
            regular_polyhedron("cube",side=d6_size,facedown=true,anchor=BOTTOM,draw=false)
            zrot(d6_rotate[$faceindex]+base_rotate[$faceindex])
            d6drwapips(d6_pip_dist[$faceindex]);

            //render pip symbols
            d6_pip_symbols=fix_undef(d6_pip_symbols);
            regular_polyhedron("cube",side=d6_size,facedown=true,anchor=BOTTOM,draw=false)
            zrot(d6_rotate[$faceindex]+base_rotate[$faceindex])
            d6drwapipsymbols(d6_pip_symbol_dist[$faceindex],d6_pip_symbols[$faceindex]);
        }
    }
}

module d6drwapips(num){
    pip_mult=d6_pip_size*d6_size/100;
    pipr=pip_mult/2;
    
    if(num=="1") {
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
    }
    if(num=="2") {
        translate([-pipr*d6_pip_offset,pipr*d6_pip_offset,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
        translate([pipr*d6_pip_offset,-pipr*d6_pip_offset,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
    }
    if(num=="3") {
        d6drwapips("1");
        d6drwapips("2");
    }
    if(num=="4") {
        d6drwapips("2");
        translate([pipr*d6_pip_offset,pipr*d6_pip_offset,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
        translate([-pipr*d6_pip_offset,-pipr*d6_pip_offset,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
    }
    if(num=="5") {
        d6drwapips("1");
        d6drwapips("4");
    }
    if(num=="6") {
        d6drwapips("4");
        translate([pipr*d6_pip_offset,0,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
        translate([-pipr*d6_pip_offset,0,0])
        down(number_depth) cylinder(r=pipr,h=2*number_depth);
    }
}

module d6drwapipsymbols(num,pipsymbol){
    pip_mult=d6_pip_size*d6_size/100;
    pipr=pip_mult/2;
    
    if(num=="1") {
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
    }
    if(num=="2") {
        translate([-pipr*d6_pip_offset,pipr*d6_pip_offset,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
        translate([pipr*d6_pip_offset,-pipr*d6_pip_offset,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
    }
    if(num=="3") {
        d6drwapipsymbols("1",pipsymbol);
        d6drwapipsymbols("2",pipsymbol);
    }
    if(num=="4") {
        d6drwapipsymbols("2",pipsymbol);
        translate([pipr*d6_pip_offset,pipr*d6_pip_offset,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
        translate([-pipr*d6_pip_offset,-pipr*d6_pip_offset,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
    }
    if(num=="5") {
        d6drwapipsymbols("1",pipsymbol);
        d6drwapipsymbols("4",pipsymbol);
    }
    if(num=="6") {
        d6drwapipsymbols("4",pipsymbol);
        translate([pipr*d6_pip_offset,0,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
        translate([-pipr*d6_pip_offset,0,0])
        down(number_depth) linear_extrude(height=2*number_depth)
        text(pipsymbol,size=pip_mult,font=symbol_font,halign="center",valign="center");
    }
}

module drawd8(){
    d8_dist=d8_distribution==1 ? d8_std_dist : d8_distribution==2 ? d8_dl_dist : d8_custom_dist;
    d8_rotate=d8_distribution==1 ? d8_std_rotate : d8_distribution==2 ? d8_dl_rotate : d8_custom_rotate;
    d8_under=d8_distribution==1 ? d8_std_under : d8_distribution==2 ? d8_dl_under : d8_custom_under;
    d8_symbols=fix_undef(d8_symbols);
    d8_merged=merge_symbols(d8_dist,d8_symbols);
    num_mult=d8_number_size*d8_size/100;
    sym_mult=d8_symbol_size*d8_size/100;
    under_mult=d8_under_size*d8_size/100;
    space_mult=d8_number_spacing>1 ? (d8_number_spacing-1)*num_mult/3.15 : d8_number_spacing<1 ? (-1+d8_number_spacing)*num_mult/2.8 : 0;
    base_rotate=[345,15,15,135,255,15,15,195];
    
    difference(){
        //render octahedron
        regular_polyhedron("octahedron",side=sqrt(3/2)*d8_size,facedown=true,anchor=BOTTOM,rounding=edge_rounding);
        
        //render numbers
        regular_polyhedron("octahedron",side=sqrt(3/2)*d8_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d8_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d8_number_h_push*d8_size/100,y=d8_number_v_push*d8_size/100)
        if(is_list(d8_merged[$faceindex])) //a symbol
            move(x=d8_symbol_h_push*d8_size/100,y=d8_symbol_v_push*d8_size/100)
            text(d8_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else if(d8_merged[$faceindex]=="4") //a number 4
            right(d8_number_4_h_push*d8_size/100)
            text(d8_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else if(len(d8_merged[$faceindex])==1) //a single digit number that's not 4
            text(d8_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            text(d8_merged[$faceindex],size=num_mult,font=number_font,spacing=d8_number_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("octahedron",side=sqrt(3/2)*d8_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d8_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        fwd(d8_under_push*d8_size/100)
        text(d8_under[$faceindex],size=under_mult,font=underscore_font,halign="center",valign="center");
    }
}

module drawd10(){
    d10_dist=d10_distribution==1 ? d10_std_dist : d10_distribution==2 ? d10_dl_dist : d10_custom_dist;
    d10_rotate=d10_distribution==1 ? d10_std_rotate : d10_distribution==2 ? d10_dl_rotate : d10_custom_rotate;
    d10_under=d10_distribution==1 ? d10_std_under : d10_distribution==2 ? d10_dl_under : d10_custom_under;
    d10_symbols=fix_undef(d10_symbols);
    d10_merged=merge_symbols(d10_dist,d10_symbols);
    num_mult=d10_number_size*d10_size/100;
    sym_mult=d10_symbol_size*d10_size/100;
    under_mult=d10_under_size*d10_size/100;
    space_mult=d10_number_spacing>1 ? (d10_number_spacing-1)*num_mult/3.15 : d10_number_spacing<1 ? (-1+d10_number_spacing)*num_mult/2.8 : 0;
    base_rotate=[54.25,306.25,306.25,306.25,306.25,254.25,357.75,177.75,126.25,74.25];
    
    difference(){
        //render trapezohedron 
        up(edge_rounding)
        minkowski(){
            scale((d10_size-2*edge_rounding)/d10_size)
            regular_polyhedron("trapezohedron",faces=10,side=0.4857*d10_size-d10_length_mod/d10_size,longside=d10_size,facedown=true,anchor=BOTTOM);
            if(edge_rounding>0) sphere(r=edge_rounding);
        }
        
        //render numbers
        regular_polyhedron("trapezohedron",faces=10,side=0.4857*d10_size-d10_length_mod/d10_size,longside=d10_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d10_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d10_number_h_push*d10_size/100,y=d10_number_v_push*d10_size/100)
        if(is_list(d10_merged[$faceindex])) //a symbol
            move(x=d10_symbol_h_push*d10_size/100,y=d10_symbol_v_push*d10_size/100)
            text(d10_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else if(d10_merged[$faceindex]=="4") //a number 4
            right(d10_number_4_h_push*d10_size/100)
            text(d10_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else if(len(d10_merged[$faceindex])==1) //a single digit number that's not 4
            text(d10_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            text(d10_merged[$faceindex],size=num_mult,font=number_font,spacing=d10_number_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("trapezohedron",faces=10,side=0.4857*d10_size-d10_length_mod/d10_size,longside=d10_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d10_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        fwd(d10_under_push*d10_size/100)
        text(d10_under[$faceindex],size=under_mult,font=underscore_font,halign="center",valign="center");
    }
}

module drawd00(){
    d00_dist=d00_distribution==1 ? d00_std_dist : d00_distribution==2 ? d00_dl_dist : d00_custom_dist;
    d00_rotate=d00_distribution==1 ? d00_std_rotate : d00_distribution==2 ? d00_dl_rotate : d00_custom_rotate;
    d00_symbols=fix_undef(d00_symbols);
    d00_merged=merge_symbols(d00_dist,d00_symbols);
    num_mult=d00_number_size*d00_size/100;
    sym_mult=d00_symbol_size*d00_size/100;
    space_mult=d00_number_spacing>1 ? (d00_number_spacing-1)*num_mult/3.15 : d00_number_spacing<1 ? (-1+d00_number_spacing)*num_mult/2.8 : 0;
    base_rotate=[54.25,306.25,306.25,306.25,306.25,254.25,357.75,177.75,126.25,74.25];
    rotate_mod=d00_angle_numbers ? 90 : 0;
    
    difference(){
        //render trapezohedron 
        up(edge_rounding)
        minkowski(){
            scale((d00_size-2*edge_rounding)/d00_size)
            regular_polyhedron("trapezohedron",faces=10,side=0.4857*d00_size-d00_length_mod/d00_size,longside=d00_size,facedown=true,anchor=BOTTOM);
            if(edge_rounding>0) sphere(r=edge_rounding);
        }
        
        //render numbers
        regular_polyhedron("trapezohedron",faces=10,side=0.4857*d00_size-d00_length_mod/d00_size,longside=d00_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d00_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d00_number_h_push*d00_size/100,y=d00_number_v_push*d00_size/100)
        if(is_list(d00_merged[$faceindex])) //a symbol
            move(x=d00_symbol_h_push*d00_size/100,y=d00_symbol_v_push*d00_size/100)
            text(d00_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else //a double digit number
            if(d00_angle_numbers) { //downsize "0" if text is angled
                text(d00_merged[$faceindex][0],size=num_mult,font=number_font,halign="center",valign="center");
                right(num_mult*d00_0_padding/100)
                text(" 0",size=num_mult*d00_0_size/100,font=number_font,halign="center",valign="center");
            } else {
                right(space_mult)
                text(d00_merged[$faceindex],size=num_mult,font=number_font,spacing=d00_number_spacing,halign="center",valign="center");
            }
    }
}

module drawd12(){
    d12_dist=d12_distribution==1 ? d12_std_dist : d12_distribution==2 ? d12_dl_dist : d12_custom_dist;
    d12_rotate=d12_distribution==1 ? d12_std_rotate : d12_distribution==2 ? d12_dl_rotate : d12_custom_rotate;
    d12_under=d12_distribution==1 ? d12_std_under : d12_distribution==2 ? d12_dl_under : d12_custom_under;
    d12_symbols=fix_undef(d12_symbols);
    d12_merged=merge_symbols(d12_dist,d12_symbols);
    num_mult=d12_number_size*d12_size/100;
    sym_mult=d12_symbol_size*d12_size/100;
    under_mult=d12_under_size*d12_size/100;
    space_mult=d12_number_spacing>1 ? (d12_number_spacing-1)*num_mult/3.15 : d12_number_spacing<1 ? (-1+d12_number_spacing)*num_mult/2.8 : 0;
    base_rotate=[270,90,18,162,234,306,306,234,18,162,270,90];

    difference(){
        //render dodecahedron
        regular_polyhedron("dodecahedron",ir=0.5*d12_size,facedown=true,anchor=BOTTOM,rounding=edge_rounding);
    
        //render numbers
        regular_polyhedron("dodecahedron",ir=0.5*d12_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d12_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d12_number_h_push*d12_size/100,y=d12_number_v_push*d12_size/100)
        if(is_list(d12_merged[$faceindex])) //a symbol
            move(x=d12_symbol_h_push*d12_size/100,y=d12_symbol_v_push*d12_size/100)
            text(d12_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else if(d12_merged[$faceindex]=="4") //a number 4
            right(d12_number_4_h_push*d12_size/100)
            text(d12_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else if(len(d12_merged[$faceindex])==1) //a single digit number that's not 4
            text(d12_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            text(d12_merged[$faceindex],size=num_mult,font=number_font,spacing=d12_number_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("dodecahedron",ir=0.5*d12_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d12_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        fwd(d12_under_push*d12_size/100)
        text(d12_under[$faceindex],size=under_mult,font=underscore_font,halign="center",valign="center");
    }
}

module drawd20(){
    d20_dist=d20_distribution==1 ? d20_std_dist : d20_distribution==2 ? d20_dl_dist : d20_custom_dist;
    d20_rotate=d20_distribution==1 ? d20_std_rotate : d20_distribution==2 ? d20_dl_rotate : d20_custom_rotate;
    d20_under=d20_distribution==1 ? d20_std_under : d20_distribution==2 ? d20_dl_under : d20_custom_under;
    d20_symbols=fix_undef(d20_symbols);
    d20_merged=merge_symbols(d20_dist,d20_symbols);
    num_mult=d20_number_size*d20_size/100;
    sym_mult=d20_symbol_size*d20_size/100;
    under_mult=d20_under_size*d20_size/100;
    space_mult=d20_number_spacing>1 ? (d20_number_spacing-1)*num_mult/3.15 : d20_number_spacing<1 ? (-1+d20_number_spacing)*num_mult/2.8 : 0;
    base_rotate=[20.9,339.1,339.1,-20.9,99.1,99.1,219.1,23.6,219.1,143.6,174.6,99.1,99.1,54.6,219.1,294.6,219.1,159.1,339.1,263.6];

    difference(){
        //render icosahedron
        regular_polyhedron("icosahedron",ir=0.5*d20_size,facedown=true,anchor=BOTTOM,rounding=edge_rounding);
        
        //render numbers
        regular_polyhedron("icosahedron",ir=0.5*d20_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d20_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        move(x=d20_number_h_push*d20_size/100,y=d20_number_v_push*d20_size/100)
        if(is_list(d20_merged[$faceindex])) //a symbol
            move(x=d20_symbol_h_push*d20_size/100,y=d20_symbol_v_push*d20_size/100)
            text(d20_merged[$faceindex][0],size=sym_mult,font=symbol_font,halign="center",valign="center");
        else if(d20_merged[$faceindex]=="4") //a number 4
            right(d20_number_4_h_push*d20_size/100)
            text(d20_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else if(len(d20_merged[$faceindex])==1) //a single digit number that's not 4
            text(d20_merged[$faceindex],size=num_mult,font=number_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            text(d20_merged[$faceindex],size=num_mult,font=number_font,spacing=d20_number_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("icosahedron",ir=0.5*d20_size,facedown=true,anchor=BOTTOM,draw=false)
        zrot(d20_rotate[$faceindex]+base_rotate[$faceindex])
        down(number_depth) linear_extrude(height=2*number_depth)
        fwd(d20_under_push*d20_size/100)
        text(d20_under[$faceindex],size=under_mult,font=underscore_font,halign="center",valign="center");
    }
}