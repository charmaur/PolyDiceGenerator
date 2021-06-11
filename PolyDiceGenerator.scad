//------------------------------------------
// PolyDiceGenerator v0.27.4
//   A customizable Polyhedral Dice Generator for OpenSCAD.
//   https://github.com/charmaur/PolyDiceGenerator
//   Please support PolyDiceGenerator https://ko-fi.com/charmaur
//
// Requirements
//   OpenSCAD http://www.openscad.org
//   BOSL2 library https://github.com/revarbat/BOSL2
//      included with PolyDiceGenerator
//
// PolyDiceGenerator and the included BOSL2 library
//   are licensed under the BSD 2-Clause License
//------------------------------------------

echo(pdg_version="0.27.4");
include <BOSL2/std.scad>
include <BOSL2/polyhedra.scad>
echo(bosl_version=bosl_version_str());
bosl_required("2.0.525");
$fa=$preview ? 5 : 2;
$fs=$preview ? 0.5 : 0.2;

//------------------------------------------
// Configuration
//------------------------------------------

/* [Fonts] */
text_font="LiberationSerif:style=Bold";
underscore_font="LiberationSerif:style=Bold";
symbol_font="SWAstro";

/* [Dice to Draw] */
d2=true;
d3=true;
d4=true;
d4c=true;
d4i=true;
d4p=true;
d6=true;
d8=true;
d10=true;
d00=true;
d12=true;
d12r=true;
d20=true;

/* [Dice Size] */
d2_size=24;
d3_size=16;
d4_size=20;
d4c_size=13;
d4i_size=14;
d4p_size=14;
d6_size=15;
d8_size=15;
d10_size=16;
d00_size=16;
d12_size=18;
d12r_size=18;
d20_size=20;

/* [Depth, Stroke, and Bumpers] */
text_depth=0.6;
text_stroke=0; //[0:0.01:0.08]
symbol_stroke=0; //[0:0.01:0.08]
add_bumpers=false;
bumper_size=0.3;

/* [Rounding] */
edge_rounding=0;   //[0:0.1:3]
corner_rounding=0; //[0:1:60]
corner_clipping=0; //[0:1:60]

/* [d2 Coin] */
d2_sides=10; //[0,3,4,5,6,8,10,12]
d2_height=3;
d2_text_size=45;
d2_text_v_push=0;
d2_text_h_push=0;
d2_text=["1","2"];
d2_symbols=[undef,undef];
d2_symbol_size=34;
d2_symbol_v_push=0;
d2_symbol_h_push=0;
d2_rotate=[0,0];
d2_adj_size=[0,0];
d2_adj_v_push=[0,0];
d2_adj_h_push=[0,0];
d2_adj_depth=[0,0];

/* [d3 Rounded Triangular Prism] */
d3_text_size=36;
d3_text_v_push=30;
d3_text_h_push=0;
d3_text=["1","2","3","1","2","3"];
d3_symbols=[undef,undef,undef,undef,undef,undef];
d3_symbol_size=36;
d3_symbol_v_push=0;
d3_symbol_h_push=0;
d3_rotate=[0,0,0,0,0,0];
d3_adj_size=[0,0,0,0,0,0];
d3_adj_v_push=[0,0,0,0,0,0];
d3_adj_h_push=[0,0,0,0,0,0];
d3_adj_depth=[0,0,0,0,0,0];

/* [d4 Tetrahedron] */
d4_text_size=34;
d4_text_v_push=30;
d4_text_h_push=0;
d4_num_4_h_push=-3; //horizontal adjustment for #4s
d4_text=["3","4","3","3","2","2","4","4","1","1","1","2"];
d4_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d4_symbol_size=34;
d4_symbol_v_push=0;
d4_symbol_h_push=0;
d4_bumpers=[true,true,true,false];
d4_rotate=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];
d4_adj_size=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];
d4_adj_v_push=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];
d4_adj_h_push=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];
d4_adj_depth=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];

/* [d4c Crystal] */
d4c_text_size=72;
d4c_text_v_push=0;
d4c_text_h_push=0;
d4c_num_4_h_push=-3;
d4c_body_length=1.4;
d4c_point_length=0.4;
d4c_text=["1","2"," "," ","3","4"];
d4c_symbols=[undef,undef,undef,undef,undef,undef];
d4c_symbol_size=72;
d4c_symbol_v_push=0;
d4c_symbol_h_push=0;
d4c_rotate=[0,0,0,0,0,0];
d4c_pips=[" "," "," "," "," "," "];
d4c_pip_sides=6; //[0,3,4,5,6,8,10,12]
d4c_pip_size=20;
d4c_pip_offset=2.5;
d4c_pip_symbol_pos=["1","2"," "," ","3","4"];
d4c_pip_symbols=[undef,undef,undef,undef,undef,undef]; //symbols for pips
d4c_pip_symbol_rotate=[0,0,0,0,0,0];
d4c_adj_size=[0,0,0,0,0,0];
d4c_adj_v_push=[0,0,0,0,0,0];
d4c_adj_h_push=[0,0,0,0,0,0];
d4c_adj_depth=[0,0,0,0,0,0];

/* [d4i Infinity] */
d4i_text_size=70;
d4i_text_v_push=10;
d4i_text_h_push=0;
d4i_num_4_h_push=-3;
d4i_body_length=1.4;
d4i_text=["1","2"," "," ","3","4"];
d4i_symbols=[undef,undef,undef,undef,undef,undef];
d4i_symbol_size=72;
d4i_symbol_v_push=0;
d4i_symbol_h_push=0;
d4i_rotate=[0,0,0,0,0,0];
d4i_pips=[" "," "," "," "," "," "];
d4i_pip_sides=6; //[0,3,4,5,6,8,10,12]
d4i_pip_size=20;
d4i_pip_offset=2.5;
d4i_pip_symbol_pos=["1","2"," "," ","3","4"];
d4i_pip_symbols=[undef,undef,undef,undef,undef,undef]; //symbols for pips
d4i_pip_symbol_rotate=[0,0,0,0,0,0];
d4i_adj_size=[0,0,0,0,0,0];
d4i_adj_v_push=[0,0,0,0,0,0];
d4i_adj_h_push=[0,0,0,0,0,0];
d4i_adj_depth=[0,0,0,0,0,0];

/* [d4p Pyramid] */
d4p_text_size=55;
d4p_text_v_push=48;
d4p_text_h_push=0;
d4p_num_4_h_push=-3;
d4p_body_length=17.5;
d4p_base_length=4.8;
d4p_text=["3","4","2","1"];
d4p_symbols=[undef,undef,undef,undef];
d4p_symbol_size=55;
d4p_symbol_v_push=0;
d4p_symbol_h_push=0;
d4p_rotate=[0,0,0,0];
d4p_adj_size=[0,0,0,0];
d4p_adj_v_push=[0,0,0,0];
d4p_adj_h_push=[0,0,0,0];
d4p_adj_depth=[0,0,0,0];

/* [d6 Cube] */
d6_text_size=62;
d6_text_v_push=0;
d6_text_h_push=0;
d6_text_spacing=1; //[0.5:0.02:1.5]
d6_num_4_h_push=-3;
d6_angle_text=false; //angle d6 text
d6_text=["1","3","5","2","4","6"];
d6_symbols=[undef,undef,undef,undef,undef,undef];
d6_symbol_size=62;
d6_symbol_v_push=0;
d6_symbol_h_push=0;
d6_underscores=[" "," "," "," "," ","_"];
d6_underscore_size=48;
d6_underscore_v_push=-32;
d6_underscore_h_push=0;
d6_bumpers=[false,true,true,false,false,true];
d6_rotate=[0,0,0,0,0,0];
d6_pips=[" "," "," "," "," "," "];
d6_pip_sides=6; //[0,3,4,5,6,8,10,12]
d6_pip_size=20;
d6_pip_offset=2.5;
d6_pip_symbol_pos=["1","3","5","2","4","6"];
d6_pip_symbols=[undef,undef,undef,undef,undef,undef]; //symbols for pips
d6_pip_symbol_rotate=[0,0,0,0,0,0];
d6_adj_size=[0,0,0,0,0,0];
d6_adj_v_push=[0,0,0,0,0,0];
d6_adj_h_push=[0,0,0,0,0,0];
d6_adj_depth=[0,0,0,0,0,0];

/* [d8 Octahedron] */
d8_text_size=55;
d8_text_v_push=2;
d8_text_h_push=0;
d8_text_spacing=1; //[0.5:0.02:1.5]
d8_num_4_h_push=-3;
d8_text=["1","4","3","2","6","7","5","8"];
d8_symbols=[undef,undef,undef,undef,undef,undef,undef,undef];
d8_symbol_size=55;
d8_symbol_v_push=0;
d8_symbol_h_push=0;
d8_underscores=[" "," "," "," ","_"," "," "," "];
d8_underscore_size=42;
d8_underscore_v_push=-26;
d8_underscore_h_push=0;
d8_bumpers=[false,false,false,false,true,true,true,true];
d8_rotate=[0,0,0,0,0,0,0,0];
d8_adj_size=[0,0,0,0,0,0,0,0];
d8_adj_v_push=[0,0,0,0,0,0,0,0];
d8_adj_h_push=[0,0,0,0,0,0,0,0];
d8_adj_depth=[0,0,0,0,0,0,0,0];

/* [d10 Trapezohedron] */
d10_text_size=48;
d10_text_v_push=7.5;
d10_text_h_push=0;
d10_text_spacing=1; //[0.5:0.02:1.5]
d10_num_4_h_push=-3;
d10_length_mod=0;
d10_text=["9","1","7","5","3","6","2","4","0","8"];
d10_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d10_symbol_size=48;
d10_symbol_v_push=0;
d10_symbol_h_push=0;
d10_underscores=["_"," "," "," "," ","_"," "," "," "," "];
d10_underscore_size=37;
d10_underscore_v_push=-17;
d10_underscore_h_push=0;
d10_bumpers=[true,true,true,true,true,false,false,false,false,false];
d10_rotate=[0,0,0,0,0,0,0,0,0,0];
d10_adj_size=[0,0,0,0,0,0,0,0,0,0];
d10_adj_v_push=[0,0,0,0,0,0,0,0,0,0];
d10_adj_h_push=[0,0,0,0,0,0,0,0,0,0];
d10_adj_spacing=[0,0,0,0,0,0,0,0,0,0];
d10_adj_depth=[0,0,0,0,0,0,0,0,0,0];

/* [d00 Trapezohedron] */
d00_text_size=48;
d00_text_v_push=0;
d00_text_h_push=-4;
d00_text_spacing=1; //[0.5:0.02:1.5]
d00_length_mod=0;
d00_angle_text=true; //angle d00 text
d00_0_size=65; //"0" undersize if d00_angle_text=true
d00_0_padding=60; //"0" padding if d00_angle_text=true
d00_10_h_push=2; //horizontal push for "10" if d00_angle_text=true
d00_10_0_padding=52; //"0" padding for "10" if d00_angle_text=true
d00_text=["90","10","70","50","30","60","20","40","00","80"];
d00_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d00_symbol_size=48;
d00_symbol_v_push=0;
d00_symbol_h_push=0;
d00_bumpers=[true,true,true,true,true,false,false,false,false,false];
d00_rotate=[0,0,0,0,0,0,0,0,0,0];
d00_adj_size=[0,0,0,0,0,0,0,0,0,0];
d00_adj_v_push=[0,0,0,0,0,0,0,0,0,0];
d00_adj_h_push=[0,0,0,0,0,0,0,0,0,0];
d00_adj_spacing=[0,0,0,0,0,0,0,0,0,0];
d00_adj_depth=[0,0,0,0,0,0,0,0,0,0];

/* [d12 Dodecahedron] */
d12_text_size=36;
d12_text_v_push=0;
d12_text_h_push=0;
d12_text_spacing=1; //[0.5:0.02:1.5]
d12_num_4_h_push=-3;
d12_text=["1","4","2","6","8","10","3","5","11","7","12","9"];
d12_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d12_symbol_size=36;
d12_symbol_v_push=0;
d12_symbol_h_push=0;
d12_underscores=[" "," "," ","_"," "," "," "," "," "," "," ","_"];
d12_underscore_size=28;
d12_underscore_v_push=-19;
d12_underscore_h_push=0;
d12_bumpers=[true,true,false,true,false,false,false,false,false,false,false,false];
d12_rotate=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_adj_size=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_adj_v_push=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_adj_h_push=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_adj_spacing=[0,0,0,0,0,0,0,0,0,0,0,0];
d12_adj_depth=[0,0,0,0,0,0,0,0,0,0,0,0];

/* [d12r Rhombic Dodecahedron] */
d12r_text_size=34;
d12r_text_v_push=0;
d12r_text_h_push=0;
d12r_text_spacing=1; //[0.5:0.02:1.5]
d12r_num_4_h_push=-3;
d12r_text=["1","4","2","8","3","7","6","10","11","5","12","9"];
d12r_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d12r_symbol_size=34;
d12r_symbol_v_push=0;
d12r_symbol_h_push=0;
d12r_underscores=[" "," "," "," "," "," ","_"," "," "," "," ","_"];
d12r_underscore_size=28;
d12r_underscore_v_push=-19;
d12r_underscore_h_push=0;
d12r_bumpers=[true,false,false,false,true,false,true,false,false,true,false,false];
d12r_rotate=[0,0,0,0,0,0,0,0,0,0,0,0];
d12r_adj_size=[0,0,0,0,0,0,0,0,0,0,0,0];
d12r_adj_v_push=[0,0,0,0,0,0,0,0,0,0,0,0];
d12r_adj_h_push=[0,0,0,0,0,0,0,0,0,0,0,0];
d12r_adj_spacing=[0,0,0,0,0,0,0,0,0,0,0,0];
d12r_adj_depth=[0,0,0,0,0,0,0,0,0,0,0,0];

/* [d20 Icosahedron] */
d20_text_size=23;
d20_text_v_push=0;
d20_text_h_push=0;
d20_text_spacing=1; //[0.5:0.02:1.5]
d20_num_4_h_push=-3;
d20_text=["1","5","13","11","7","15","19","6","9","18","4","14","17","16","3","12","2","20","8","10"];
d20_symbols=[undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef];
d20_symbol_size=23;
d20_symbol_v_push=0;
d20_symbol_h_push=0;
d20_underscores=[" "," "," "," "," "," "," ","_","_"," "," "," "," "," "," "," "," "," "," "," "];
d20_underscore_size=18;
d20_underscore_v_push=-12;
d20_underscore_h_push=0;
d20_bumpers=[true,true,true,false,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
d20_rotate=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_adj_size=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_adj_v_push=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_adj_h_push=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_adj_spacing=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
d20_adj_depth=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

/* [Please Support PolyDiceGenerator] */
Go_to="https://ko-fi.com/charmaur";

//------------------------------------------
// Hidden variables
//------------------------------------------

/* [Hidden] */
//d4
d4_dl_text=["1","4","1","1","2","2","4","4","3","3","3","2"];
d4_dl_rotate=[0,0,0,0 ,0,0,0,0 ,0,0,0,0];

//d4c
d4c_dl_text=["1","2"," "," ","3","4"];
d4c_dl_rotate=[0,0,0,0,0,0];

//d4i
d4i_dl_text=["1","2"," "," ","3","4"];
d4i_dl_rotate=[0,0,0,0,0,0];

//d4p
d4p_dl_text=["3","4","2","1"];
d4p_dl_rotate=[0,0,0,0];

//d6
d6_dl_text=["1","2","3","4","5","6"];
d6_dl_under=[" "," "," "," "," ","_"];
d6_dl_rotate=[0,180,90,0,-90,90];

//d8
d8_dl_text=["1","6","7","4","2","5","3","8"];
d8_dl_under=[" ","_"," "," "," "," "," "," "];
d8_dl_rotate=[0,0,0,0,0,0,0,0];

//d10
d10_dl_text=["9","1","6","2","5","4","3","7","0","8"];
d10_dl_under=["_"," ","_"," "," "," "," "," "," "," "];
d10_dl_rotate=[0,0,0,0,0,0,0,0,0,0];

//d00
d00_dl_text=["90","10","60","20","50","40","30","70","00","80"];
d00_dl_rotate=[0,0,0,0,0,0,0,0,0,0];

//d12
d12_dl_text=["1","10","7","9","5","11","2","8","6","4","12","3"];
d12_dl_under=[" "," "," ","_"," "," "," "," ","_"," "," "," "];
d12_dl_rotate=[-144,144,-144,0,36,72,72,-72,-72,144,-72,0];

d12r_dl_text=["1","4","2","8","3","7","6","10","11","5","12","9"];
d20r_dl_under=[" "," "," "," "," "," ","_"," "," "," "," ","_"];
d12r_dl_rotate=[0,180,180,180,180,-70.53,180,70.53,70.53,0,0,-70.53];

//d20
d20_dl_text=["1","12","11","19","15","13","5","8","17","7","3","6","18","9","14","4","16","20","10","2"];
d20_dl_under=[" "," "," "," "," "," "," "," "," "," "," ","_"," ","_"," "," "," "," "," "," "];
d20_dl_rotate=[0,-120,0,120,-120,0,120,0,0,-120,120,120,-120,120,120,0,-120,0,0,-120];

//------------------------------------------
// Generation, functions, modules
//------------------------------------------

spacing=d20_size*1.5;

if(d2) move(x=spacing,y=-spacing) drawd2();
if(d3) move(x=-spacing,y=-spacing*2) drawd3();
if(d4) fwd(spacing) drawd4();
if(d4c) move(x=-spacing,y=-spacing) drawd4c();
if(d4i) move(x=spacing,y=-spacing*2) drawd4i();
if(d4p) fwd(spacing*2) drawd4p();
if(d6) drawd6();
if(d8) back(spacing) drawd8();
if(d10) move(x=-spacing,y=spacing) drawd10();
if(d00) left(spacing) drawd00();
if(d12) move(x=spacing,y=spacing) drawd12();
if(d12r) back(spacing*2) drawd12r();
if(d20) right(spacing) drawd20();

txt_font=str_strip(text_font,"\"");
under_font=str_strip(underscore_font,"\"");
sym_font=str_strip(symbol_font,"\"");

function fix_quotes(x)=[for (i=x) if(i=="undef" || i==undef) undef else if (i=="true" || i==true) true else if (i=="false" || i==false) false else i];

function merge_txt(dist,sym)=[for (a=[0:len(dist)-1]) if(sym[a]=="undef" || sym[a]==undef) dist[a] else [sym[a]]];

function adj_list(list,val)=[for (a=[0:len(list)-1]) list[a]*val];
    
module drawd2(){
    txt_merged=merge_txt(d2_text,fix_quotes(d2_symbols));
    txt_mult=d2_text_size*d2_size/100;
    adj_txt=adj_list(d2_adj_size,d2_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d2_symbol_size*d2_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    base_rotate=[180,180];
    d2_fn=d2_sides==0 ? 128 : d2_sides;
    
    difference()
    {
        //render cylinder
        up(edge_rounding)
        minkowski()
        {
            scale((d2_size-2*edge_rounding)/d2_size)
            {
                linear_extrude(height=d2_height)
                circle(d=d2_size,$fn=d2_fn);
            }
            if(edge_rounding>0) sphere(r=edge_rounding);
        }
        
        //render numbers & symbols
        for(i=[0,1])
            rotate([180,0,0]) rotate([180*i,0,0])
            translate([0,0,d2_height*i+edge_rounding*2*i])
            down(text_depth+d2_adj_depth[i])
            linear_extrude(height=2*text_depth+d2_adj_depth[i])
            move(x=(d2_text_h_push+d2_adj_h_push[i])*d2_size/100,y=(d2_text_v_push+d2_adj_v_push[i])*d2_size/100)
            if(is_list(txt_merged[i])) //a symbol
                move(x=d2_symbol_h_push*d2_size/100,y=d2_symbol_v_push*d2_size/100)
                zrot(d2_rotate[i]+base_rotate[i])
                offset(delta=sym_stroke)
                text(txt_merged[i][0],size=sym_mult,font=sym_font,halign="center",valign="center");
            else //a number
                zrot(d2_rotate[i]+base_rotate[i])
                offset(delta=txt_stroke)
                text(txt_merged[i],size=txt_mult+adj_txt[i],font=txt_font,halign="center",valign="center");
    }
}

module drawd3(){
    txt_merged=merge_txt(d3_text,fix_quotes(d3_symbols));
    txt_mult=d3_text_size*d3_size/100;
    adj_txt=adj_list(d3_adj_size,d3_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d3_symbol_size*d3_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    base_rotate=[0,180,0,180,0,180];
    d3_side=d3_size*2/sqrt(3);
    d3_circum_rad=d3_side*sqrt(3)/3;
    
    difference()
    {   
        //render prism
        up(edge_rounding)
        minkowski()
        {
            scale((d3_size-2*edge_rounding)/d3_size)
            {
                intersection()
                {
                    translate([0,0,d3_circum_rad/2])
                    sphere(r=d3_circum_rad);
                    translate([0,0,0]) rotate([0,0,90])
                    prismoid(size1=[d3_side,d3_side*1.4],size2=[0,d3_side*1.4],h=d3_size);
                }
            }
            if(edge_rounding>0) sphere(r=edge_rounding);
        }
        
        //render numbers & symbols
        for(j=[0:2])
            translate([0,0,d3_circum_rad/2])
        for(i=[0:1])
            rotate([120*j,0,0])
            translate([0,0,-d3_circum_rad/2])
            rotate([0,180,0])
            zrot(d3_rotate[j*2+i]+base_rotate[j*2+i])
            down(text_depth+d3_adj_depth[j*2+i])
            linear_extrude(height=2*text_depth+d3_adj_depth[j*2+i])
            move(x=(d3_text_h_push+d3_adj_h_push[j*2+i])*d3_size/100,y=(d3_text_v_push+d3_adj_v_push[j*2+i])*d3_size/100)
            if(is_list(txt_merged[j*2+i])) //a symbol
                move(x=d3_symbol_h_push*d3_size/100,y=d3_symbol_v_push*d3_size/100)
                offset(delta=sym_stroke)
                text(txt_merged[j*2+i][0],size=sym_mult,font=sym_font,halign="center",valign="center");
            else //a number
                offset(delta=txt_stroke)
                text(txt_merged[j*2+i],size=txt_mult+adj_txt[j*2+i],font=txt_font,halign="center",valign="center");
    }
}
    
module drawd4(){
    txt_merged=merge_txt(d4_text,fix_quotes(d4_symbols));
    txt_mult=d4_text_size*d4_size/100;
    adj_txt=adj_list(d4_adj_size,d4_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d4_symbol_size*d4_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d4_bumpers);
    base_rotate=[-15,15,15,15,105,255,255,135,225,135,135,255];
    d4_side=d4_size/sqrt(2/3);
    circumsphere_dia=d4_side*sqrt(3/8)*2;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100);
    dual_mult=d4_side*3;
    corner_clip_mult=dual_mult-(corner_clipping*dual_mult/100);
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("tetrahedron",side=d4_side,anchor=BOTTOM);
                regular_polyhedron("tetrahedron",side=d4_side,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("tetrahedron",side=d4_side,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d4_size/4])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d4_size/4])
                    rotate([0,180,-30])
                    regular_polyhedron("tetrahedron",side=corner_clip_mult);
            }
        else
            //render tetrahedron
            regular_polyhedron("tetrahedron",side=d4_side,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        for(i=[0,1,2])
            regular_polyhedron("tetrahedron",side=d4_side,anchor=BOTTOM,draw=false)
            zrot(d4_rotate[$faceindex+i*4]+base_rotate[$faceindex+i*4])
            down(text_depth+d4_adj_depth[$faceindex+i*4])
            linear_extrude(height=2*text_depth+d4_adj_depth[$faceindex+i*4])
            move(x=(d4_text_h_push+d4_adj_h_push[$faceindex+i*4])*d4_size/100,y=(d4_text_v_push+d4_adj_v_push[$faceindex+i*4])*d4_size/100)
            if(is_list(txt_merged[$faceindex+i*4])) //a symbol
                move(x=d4_symbol_h_push*d4_size/100,y=d4_symbol_v_push*d4_size/100)
                offset(delta=sym_stroke)
                text(txt_merged[$faceindex+i*4][0],size=sym_mult,font=sym_font,halign="center",valign="center");
            else if(txt_merged[$faceindex+i*4]=="4") //a number 4
                right(d4_num_4_h_push*d4_size/100)
                offset(delta=txt_stroke)
                text(txt_merged[$faceindex+i*4],size=txt_mult+adj_txt[$faceindex+i*4],font=txt_font,halign="center",valign="center");
            else //a number thats's not 4
                offset(delta=txt_stroke)
                text(txt_merged[$faceindex+i*4],size=txt_mult+adj_txt[$faceindex+i*4],font=txt_font,halign="center",valign="center");
    }
}

module drawd4c(){
    txt_merged=merge_txt(d4c_text,fix_quotes(d4c_symbols));
    txt_mult=d4c_text_size*d4c_size/100;
    adj_txt=adj_list(d4c_adj_size,d4c_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d4c_symbol_size*d4c_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    base_rotate=[180,180,180,180,180,180];
    d4c_pip_fn=d4c_pip_sides==0 ? 128 : d4c_pip_sides;
    d4c_body_length=d4c_body_length*d4c_size;
    d4c_point_length=d4c_point_length*d4c_size;
    circumsphere_dia=d4c_body_length+d4c_point_length*2;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.9;
    corner_clip_mult=circumsphere_dia-(corner_clipping*circumsphere_dia/100)/1.9;
    
    difference()
    {
        intersection()
        {
            //render clipping objects
            if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0)) {
                if(corner_rounding>0)
                    translate([0,0,d4c_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d4c_size/2])
                    cube(corner_clip_mult,center=true);
            }
            
            //render cube 
            up(edge_rounding)
            minkowski()
            {
                scale((d4c_size-2*edge_rounding)/d4c_size)
                {
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
        
        //render numbers & symbols
        regular_polyhedron("cube",side=d4c_size,anchor=BOTTOM,draw=false)
        zrot(d4c_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d4c_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d4c_adj_depth[$faceindex])
        move(x=(d4c_text_h_push+d4c_adj_h_push[$faceindex])*d4c_size/100,y=(d4c_text_v_push+d4c_adj_v_push[$faceindex])*d4c_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d4c_symbol_h_push*d4c_size/100,y=d4c_symbol_v_push*d4c_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d4c_num_4_h_push*d4c_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a number thats's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        
        //render pips
        regular_polyhedron("cube",side=d4c_size,anchor=BOTTOM,draw=false)
        zrot(d4c_rotate[$faceindex]+base_rotate[$faceindex])
        drwapips("d4c",d4c_pips[$faceindex],d4c_adj_depth[$faceindex],d4c_pip_fn);
        
        //render pip symbols
        d4c_pip_symbols=fix_quotes(d4c_pip_symbols);
        regular_polyhedron("cube",side=d4c_size,anchor=BOTTOM,draw=false)
        zrot(d4c_rotate[$faceindex]+base_rotate[$faceindex])
        drwapipsymbols("d4c",d4c_pip_symbol_pos[$faceindex],d4c_pip_symbols[$faceindex],d4c_pip_symbol_rotate[$faceindex],d4c_adj_depth[$faceindex]);
    }
}

module drawd4i(){
    txt_merged=merge_txt(d4i_text,fix_quotes(d4i_symbols));
    txt_mult=d4i_text_size*d4i_size/100;
    adj_txt=adj_list(d4i_adj_size,d4i_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d4i_symbol_size*d4i_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    base_rotate=[0,180,180,180,180,0];
    d4i_pip_fn=d4i_pip_sides==0 ? 128 : d4i_pip_sides;
    d4i_body_length=d4i_body_length*d4i_size;
    
    difference()
    {
        //render cube 
        up(edge_rounding)
        minkowski()
        {
            scale((d4i_size-2*edge_rounding)/d4i_size)
            {
                difference()
                {
                    cuboid([d4i_size,d4i_body_length,d4i_size],anchor=BOTTOM);
                    translate([d4i_size/2,d4i_body_length/2,0])
                    rounding_mask_z(l=d4i_size, r=d4i_size/2, anchor=BOTTOM);
                    translate([-d4i_size/2,d4i_body_length/2,0])
                    rounding_mask_z(l=d4i_size, r=d4i_size/2, anchor=BOTTOM);
                    translate([-d4i_size/2,-d4i_body_length/2,0])
                    rotate([0,90,0])
                    rounding_mask_z(l=d4i_size, r=d4i_size/2, anchor=BOTTOM);
                    translate([-d4i_size/2,-d4i_body_length/2,d4i_size])
                    rotate([0,90,0])
                    rounding_mask_z(l=d4i_size, r=d4i_size/2, anchor=BOTTOM);
                }
            }
            if(edge_rounding>0) sphere(r=edge_rounding);
        }
        
        //render numbers & symbols
        regular_polyhedron("cube",side=d4i_size,anchor=BOTTOM,draw=false)
        zrot(d4i_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d4i_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d4i_adj_depth[$faceindex])
        move(x=(d4i_text_h_push+d4i_adj_h_push[$faceindex])*d4i_size/100,y=(d4i_text_v_push+d4i_adj_v_push[$faceindex])*d4i_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d4i_symbol_h_push*d4i_size/100,y=d4i_symbol_v_push*d4i_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d4i_num_4_h_push*d4i_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a number thats's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        
        //render pips
        regular_polyhedron("cube",side=d4i_size,anchor=BOTTOM,draw=false)
        zrot(d4i_rotate[$faceindex]+base_rotate[$faceindex])
        drwapips("d4i",d4i_pips[$faceindex],d4i_adj_depth[$faceindex],d4i_pip_fn);
        
        //render pip symbols
        d4i_pip_symbols=fix_quotes(d4i_pip_symbols);
        regular_polyhedron("cube",side=d4i_size,anchor=BOTTOM,draw=false)
        zrot(d4i_rotate[$faceindex]+base_rotate[$faceindex])
        drwapipsymbols("d4i",d4i_pip_symbol_pos[$faceindex],d4i_pip_symbols[$faceindex],d4i_pip_symbol_rotate[$faceindex],d4i_adj_depth[$faceindex]);
    }
}

module drawd4p(){
    txt_merged=merge_txt(d4p_text,fix_quotes(d4p_symbols));
    txt_mult=d4p_text_size*d4p_size/100;
    adj_txt=adj_list(d4p_adj_size,d4p_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d4p_symbol_size*d4p_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    base_rotate=[180,180,180,180];
    d4p_body_length=d4p_body_length*d4p_size/10;
    d4p_base_length=d4p_base_length*d4p_size/10;
    circumsphere_dia=d4p_body_length+d4p_base_length;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.9;
    corner_clip_mult=circumsphere_dia-(corner_clipping*circumsphere_dia/100)/1.9;
    d4p_diag=d4p_size*sqrt(2);
    diag_clip_mult=d4p_diag-(corner_clipping*d4p_diag/100)/1.9;
    d4p_side_length=sqrt(sqr(d4p_size/2)+sqr(d4p_body_length));
    d4p_face_angle=atan(d4p_body_length/(d4p_size/2));
    d4p_up_length=d4p_size/2*cos(90-d4p_face_angle);
    d4p_up_rounding=edge_rounding*cos(90-d4p_face_angle);
    
    //position die on face
    translate([0,0,d4p_up_length])
    rotate([180-d4p_face_angle,0,0])
    
    difference()
    {
        intersection()
        {
            //render clipping objects
            if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0)) {
                if(corner_rounding>0)
                    translate([0,0,d4p_body_length/2+d4p_base_length/2-d4p_base_length])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    rotate([0,0,45])
                    translate([0,0,d4p_body_length/2+d4p_base_length/2-d4p_base_length])
                    cuboid([diag_clip_mult,diag_clip_mult,corner_clip_mult]);
            }

            //render prismoid
            minkowski()
            {
                scale((d4p_size-2*edge_rounding)/d4p_size)
                {
                    prismoid([d4p_size,d4p_size],[0,0],h=d4p_body_length,anchor=BOTTOM);
                    prismoid([0,0],[d4p_size,d4p_size],h=d4p_base_length,anchor=TOP);
                }
                if(edge_rounding>0) sphere(r=edge_rounding);
            }
        }
            
        //render numbers & symbols
        for(i=[0:3])
            rotate([90,0,0]) rotate([0,90*i,0])  
            translate([d4p_size/2,0,0])
            rotate([0,90,90-d4p_face_angle])
            move(x=(d4p_text_h_push+d4p_adj_h_push[i])*d4p_size/100,y=(d4p_text_v_push+d4p_adj_v_push[i])*d4p_size/100)
            zrot(d4p_rotate[i]+base_rotate[i])
            down(text_depth+d4p_adj_depth[i])
            linear_extrude(height=2*text_depth+d4p_adj_depth[i])
            if(is_list(txt_merged[i])) //a symbol
                move(x=d4p_symbol_h_push*d4p_size/100,y=d4p_symbol_v_push*d4p_size/100)
                offset(delta=sym_stroke)
                text(txt_merged[i][0],size=sym_mult,font=sym_font,halign="center",valign="center");
            else if(txt_merged[i]=="4") //a number 4
                right(d4p_num_4_h_push*d4p_size/100)
                offset(delta=txt_stroke)
                text(txt_merged[i],size=txt_mult+adj_txt[i],font=txt_font,halign="center",valign="center");
            else //a number thats's not 4
                offset(delta=txt_stroke)
                text(txt_merged[i],size=txt_mult+adj_txt[i],font=txt_font,halign="center",valign="center");
    }
}

module drawd6(){
    txt_merged=merge_txt(d6_text,fix_quotes(d6_symbols));
    txt_mult=d6_text_size*d6_size/100;
    adj_txt=adj_list(d6_adj_size,d6_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d6_symbol_size*d6_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d6_bumpers);
    under_mult=d6_underscore_size*d6_size/100;
    space_mult=d6_text_spacing>1 ? (d6_text_spacing-1)*txt_mult/3.15 : d6_text_spacing<1 ? (-1+d6_text_spacing)*txt_mult/2.8 : 0;
    rotate_mod=d6_angle_text ? 45 : 0;
    base_rotate=[0,-90,0,-90,180,90];
    d6_pip_fn=d6_pip_sides==0 ? 128 : d6_pip_sides;
    circumsphere_dia=d6_size*sqrt(3);
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.8;
    dual_mult=d6_size*(3*sqrt(2)/2);
    corner_clip_mult=dual_mult-(corner_clipping*dual_mult/100)/1.8;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("cube",side=d6_size,anchor=BOTTOM);
                regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("cube",side=d6_size,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d6_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d6_size/2])
                    regular_polyhedron("octahedron",side=corner_clip_mult,facedown=false);
            }
        else
            //render cube
            regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,rounding=edge_rounding);
        
        //render numbers & symbols
        regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,draw=false)
        zrot(d6_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
        down(text_depth+d6_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d6_adj_depth[$faceindex])
        move(x=(d6_text_h_push+d6_adj_h_push[$faceindex])*d6_size/100,y=(d6_text_v_push+d6_adj_v_push[$faceindex])*d6_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d6_symbol_h_push*d6_size/100,y=d6_symbol_v_push*d6_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d6_num_4_h_push*d6_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d6_text_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,draw=false)
        zrot(d6_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
        down(text_depth+d6_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d6_adj_depth[$faceindex])
        move(x=d6_underscore_h_push*d6_size/100,y=d6_underscore_v_push*d6_size/100)
        offset(delta=txt_stroke)
        text(d6_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
        
        //render pips
        regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,draw=false)
        zrot(d6_rotate[$faceindex]+base_rotate[$faceindex])
        drwapips("d6",d6_pips[$faceindex],d6_adj_depth[$faceindex],d6_pip_fn);
        
        //render pip symbols
        d6_pip_symbols=fix_quotes(d6_pip_symbols);
        regular_polyhedron("cube",side=d6_size,anchor=BOTTOM,draw=false)
        zrot(d6_rotate[$faceindex]+base_rotate[$faceindex])
        drwapipsymbols("d6",d6_pip_symbol_pos[$faceindex],d6_pip_symbols[$faceindex],d6_pip_symbol_rotate[$faceindex],d6_adj_depth[$faceindex]);
    }
}

module drawd8(){
    txt_merged=merge_txt(d8_text,fix_quotes(d8_symbols));
    txt_mult=d8_text_size*d8_size/100;
    adj_txt=adj_list(d8_adj_size,d8_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d8_symbol_size*d8_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d8_bumpers);
    under_mult=d8_underscore_size*d8_size/100;
    space_mult=d8_text_spacing>1 ? (d8_text_spacing-1)*txt_mult/3.15 : d8_text_spacing<1 ? (-1+d8_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[345,15,15,135,255,15,15,195];
    d8_side=sqrt(3/2)*d8_size;
    circumsphere_dia=d8_side*sqrt(2);
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.4;
    corner_clip_mult=circumsphere_dia-(corner_clipping*circumsphere_dia/100)/1.4;

    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM);
                regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d8_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d8_size/2])
                    rotate([45,35,-15])
                    cube(corner_clip_mult,center=true);
            }
        else
            //render octahedron
            regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM,draw=false)
        zrot(d8_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d8_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d8_adj_depth[$faceindex])
        move(x=(d8_text_h_push+d8_adj_h_push[$faceindex])*d8_size/100,y=(d8_text_v_push+d8_adj_v_push[$faceindex])*d8_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d8_symbol_h_push*d8_size/100,y=d8_symbol_v_push*d8_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d8_num_4_h_push*d8_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d8_text_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("octahedron",side=d8_side,anchor=BOTTOM,draw=false)
        zrot(d8_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d8_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d8_adj_depth[$faceindex])
        move(x=d8_underscore_h_push*d8_size/100,y=d8_underscore_v_push*d8_size/100)
        offset(delta=txt_stroke)
        text(d8_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
    }
}

module drawd10(){
    txt_merged=merge_txt(d10_text,fix_quotes(d10_symbols));
    txt_mult=d10_text_size*d10_size/100;
    adj_txt=adj_list(d10_adj_size,d10_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d10_symbol_size*d10_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d10_bumpers);
    under_mult=d10_underscore_size*d10_size/100;
    space_mult=d10_text_spacing>1 ? (d10_text_spacing-1)*txt_mult/3.15 : d10_text_spacing<1 ? (-1+d10_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[54.25,306.25,306.25,306.25,306.25,254.25,357.75,177.75,126.25,74.25];
    d10_sside=sqrt(sqrt(5)-2)*d10_size-d10_length_mod/d10_size;
    separation=2*sqr(sin(90/5))*sqrt((sqr(d10_sside)+2*sqr(d10_size)*(cos(180/5)-1))/(cos(180/5)-1)/(cos(180/5)+cos(360/5)));
    circumsphere_dia=separation/sqr(tan(90/5));
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.6;
    corner_clip_mult=d10_size-(corner_clipping*d10_size/100)/1.2;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM);
                regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d10_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d10_size/2])
                    rotate([0,-48,36]) rotate([0,0,54])
                    pentagonal_antiprism(corner_clip_mult);
            }
        else
            //render trapezohedron 
            regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM,draw=false)
        zrot(d10_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d10_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d10_adj_depth[$faceindex])
        move(x=(d10_text_h_push+d10_adj_h_push[$faceindex])*d10_size/100,y=(d10_text_v_push+d10_adj_v_push[$faceindex])*d10_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d10_symbol_h_push*d10_size/100,y=d10_symbol_v_push*d10_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d10_num_4_h_push*d10_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d10_text_spacing,halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("trapezohedron",faces=10,side=d10_sside,longside=d10_size,anchor=BOTTOM,draw=false)
        zrot(d10_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d10_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d10_adj_depth[$faceindex])
        move(x=d10_underscore_h_push*d10_size/100,y=d10_underscore_v_push*d10_size/100)
        offset(delta=txt_stroke)
        text(d10_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
        
    }
}

module drawd00(){
    txt_merged=merge_txt(d00_text,fix_quotes(d00_symbols));
    txt_mult=d00_text_size*d00_size/100;
    adj_txt=adj_list(d00_adj_size,d00_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d00_symbol_size*d00_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d00_bumpers);
    space_mult=d00_text_spacing>1 ? (d00_text_spacing-1)*txt_mult/3.15 : d00_text_spacing<1 ? (-1+d00_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[54.25,306.25,306.25,306.25,306.25,254.25,357.75,177.75,126.25,74.25];
    rotate_mod=d00_angle_text ? 90 : 0;
    d00_sside=sqrt(sqrt(5)-2)*d00_size-d00_length_mod/d00_size;
    separation=2*sqr(sin(90/5))*sqrt((sqr(d00_sside)+2*sqr(d00_size)*(cos(180/5)-1))/(cos(180/5)-1)/(cos(180/5)+cos(360/5)));
    circumsphere_dia=separation/sqr(tan(90/5));
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/1.6;
    corner_clip_mult=d00_size-(corner_clipping*d00_size/100)/1.2;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("trapezohedron",faces=10,side=d00_sside,longside=d00_size,anchor=BOTTOM);
                regular_polyhedron("trapezohedron",faces=10,side=d00_sside,longside=d00_size,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("trapezohedron",faces=10,side=d00_sside,longside=d00_size,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d00_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d00_size/2])
                    rotate([0,-48,36]) rotate([0,0,54])
                    pentagonal_antiprism(corner_clip_mult);
            }
        else
            //render trapezohedron
            regular_polyhedron("trapezohedron",faces=10,side=d00_sside,longside=d00_size,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("trapezohedron",faces=10,side=d00_sside,longside=d00_size,anchor=BOTTOM,draw=false)
        zrot(d00_rotate[$faceindex]+base_rotate[$faceindex]+rotate_mod)
        down(text_depth+d00_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d00_adj_depth[$faceindex])
        move(x=(d00_text_h_push+d00_adj_h_push[$faceindex])*d00_size/100,y=(d00_text_v_push+d00_adj_v_push[$faceindex])*d00_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d00_symbol_h_push*d00_size/100,y=d00_symbol_v_push*d00_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else //a double digit number
            if(d00_angle_text) { //downsize "0" if text is angled
                if(txt_merged[$faceindex]=="10") {
                    right(d00_10_h_push*d00_size/100)
                    offset(delta=txt_stroke)
                    text(txt_merged[$faceindex][0],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
                    right(txt_mult*d00_10_0_padding/100)
                    offset(delta=txt_stroke)
                    text(txt_merged[$faceindex][1],size=txt_mult*d00_0_size/100,font=txt_font,halign="center",valign="center");
                } else {
                    offset(delta=txt_stroke)
                    text(txt_merged[$faceindex][0],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
                    right(txt_mult*d00_0_padding/100)
                    offset(delta=txt_stroke)
                    text(txt_merged[$faceindex][1],size=txt_mult*d00_0_size/100,font=txt_font,spacing=d00_text_spacing-d00_adj_spacing[$faceindex],halign="center",valign="center");
                }
            } else {
                right(space_mult)
                offset(delta=txt_stroke)
                text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d00_text_spacing+d00_adj_spacing[$faceindex],halign="center",valign="center");
            }
    }
}

module drawd12(){
    txt_merged=merge_txt(d12_text,fix_quotes(d12_symbols));
    txt_mult=d12_text_size*d12_size/100;
    adj_txt=adj_list(d12_adj_size,d12_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d12_symbol_size*d12_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d12_bumpers);
    under_mult=d12_underscore_size*d12_size/100;
    space_mult=d12_text_spacing>1 ? (d12_text_spacing-1)*txt_mult/3.15 : d12_text_spacing<1 ? (-1+d12_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[270,90,18,162,234,306,306,234,18,162,270,90];
    d12_side=d12_size/2*20/sqrt(250+110*sqrt(5));
    circumsphere_dia=d12_side*sqrt(3)/4*(1+sqrt(5))*2;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/3.2;
    corner_clip_mult=circumsphere_dia/2-(corner_clipping*circumsphere_dia/100/2)/3.2;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM);
                regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d12_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d12_size/2])
                    rotate([6.9,-36.8,24.6])
                    regular_polyhedron("icosahedron",ir=corner_clip_mult);
            }
        else
            //render dodecahedron
            regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM,draw=false)
        zrot(d12_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d12_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d12_adj_depth[$faceindex])
        move(x=(d12_text_h_push+d12_adj_h_push[$faceindex])*d12_size/100,y=(d12_text_v_push+d12_adj_v_push[$faceindex])*d12_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d12_symbol_h_push*d12_size/100,y=d12_symbol_v_push*d12_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d12_num_4_h_push*d12_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d12_text_spacing+d12_adj_spacing[$faceindex],halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("dodecahedron",ir=d12_size/2,anchor=BOTTOM,draw=false)
        zrot(d12_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d12_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d12_adj_depth[$faceindex])
        move(x=d12_underscore_h_push*d12_size/100,y=d12_underscore_v_push*d12_size/100)
        offset(delta=txt_stroke)
        text(d12_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
    }
}

module drawd12r(){
    txt_merged=merge_txt(d12r_text,fix_quotes(d12r_symbols));
    txt_mult=d12r_text_size*d12r_size/100;
    adj_txt=adj_list(d12r_adj_size,d12r_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d12r_symbol_size*d12r_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d12r_bumpers);
    under_mult=d12r_underscore_size*d12r_size/100;
    space_mult=d12r_text_spacing>1 ? (d12r_text_spacing-1)*txt_mult/3.15 : d12r_text_spacing<1 ? (-1+d12r_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[0,180,180,180,180,-70.53,180,70.53,70.53,0,0,-70.53];
    circumsphere_dia=d12r_size*(1/sqrt(2))*2;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/2;
    corner_clip_mult=circumsphere_dia/2-(corner_clipping*circumsphere_dia/100/2)/2;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM);
                regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d12r_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d12r_size/2])
                    rotate([0,45,0])
                    regular_polyhedron("cuboctahedron",ir=corner_clip_mult);
            }
        else
            //render dodecahedron
            regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM,draw=false)
        zrot(d12r_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d12r_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d12r_adj_depth[$faceindex])
        move(x=(d12r_text_h_push+d12r_adj_h_push[$faceindex])*d12r_size/100,y=(d12r_text_v_push+d12r_adj_v_push[$faceindex])*d12r_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d12r_symbol_h_push*d12r_size/100,y=d12r_symbol_v_push*d12r_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d12r_num_4_h_push*d12r_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d12r_text_spacing+d12r_adj_spacing[$faceindex],halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("rhombic dodecahedron",ir=d12r_size/2,anchor=BOTTOM,draw=false)
        zrot(d12r_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d12r_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d12r_adj_depth[$faceindex])
        move(x=d12r_underscore_h_push*d12r_size/100,y=d12r_underscore_v_push*d12r_size/100)
        offset(delta=txt_stroke)
        text(d12r_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
        
    }
}

module drawd20(){
    txt_merged=merge_txt(d20_text,fix_quotes(d20_symbols));
    txt_mult=d20_text_size*d20_size/100;
    adj_txt=adj_list(d20_adj_size,d20_size/100);
    txt_stroke=text_stroke*txt_mult;
    sym_mult=d20_symbol_size*d20_size/100;
    sym_stroke=symbol_stroke*sym_mult;
    bumpers=fix_quotes(d20_bumpers);
    under_mult=d20_underscore_size*d20_size/100;
    space_mult=d20_text_spacing>1 ? (d20_text_spacing-1)*txt_mult/3.15 : d20_text_spacing<1 ? (-1+d20_text_spacing)*txt_mult/2.8 : 0;
    base_rotate=[20.9,339.1,339.1,-20.9,99.1,99.1,219.1,23.6,219.1,143.6,174.6,99.1,99.1,54.6,219.1,294.6,219.1,159.1,339.1,263.6];
    d20_side=d20_size/2*12/(sqrt(3)*(3+sqrt(5)));
    circumsphere_dia=d20_side*sin(72)*2;
    corner_round_mult=circumsphere_dia-(corner_rounding*circumsphere_dia/100)/2.5;
    corner_clip_mult=circumsphere_dia/2-(corner_clipping*circumsphere_dia/100/2)/2.5;
    
    difference()
    {
        if(add_bumpers && edge_rounding==0 && corner_rounding==0 && corner_clipping==0)
            //render bumpers
            union()
            {
                regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM);
                regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM,rotate_children=false,draw=false)
                if(bumpers[$faceindex]) stroke($face,width=bumper_size,closed=true);
            }
        else if(edge_rounding==0 && (corner_rounding>0 || corner_clipping>0))
            //render clipping objects
            intersection()
            {
                regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM);
                if(corner_rounding>0)
                    translate([0,0,d20_size/2])
                    sphere(d=corner_round_mult);
                else if(corner_clipping>0)
                    translate([0,0,d20_size/2])
                    rotate([36,-10.81,-6.42])
                    regular_polyhedron("dodecahedron",ir=corner_clip_mult);
            }
        else
            //render icosahedron
            regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM,rounding=edge_rounding);

        //render numbers & symbols
        regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM,draw=false)
        zrot(d20_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d20_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d20_adj_depth[$faceindex])
        move(x=(d20_text_h_push+d20_adj_h_push[$faceindex])*d20_size/100,y=(d20_text_v_push+d20_adj_v_push[$faceindex])*d20_size/100)
        if(is_list(txt_merged[$faceindex])) //a symbol
            move(x=d20_symbol_h_push*d20_size/100,y=d20_symbol_v_push*d20_size/100)
            offset(delta=sym_stroke)
            text(txt_merged[$faceindex][0],size=sym_mult,font=sym_font,halign="center",valign="center");
        else if(txt_merged[$faceindex]=="4") //a number 4
            right(d20_num_4_h_push*d20_size/100)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else if(len(txt_merged[$faceindex])==1) //a single digit number that's not 4
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,halign="center",valign="center");
        else //a double digit number
            right(space_mult)
            offset(delta=txt_stroke)
            text(txt_merged[$faceindex],size=txt_mult+adj_txt[$faceindex],font=txt_font,spacing=d20_text_spacing+d20_adj_spacing[$faceindex],halign="center",valign="center");
        
        //render underscore
        regular_polyhedron("icosahedron",ir=d20_size/2,anchor=BOTTOM,draw=false)
        zrot(d20_rotate[$faceindex]+base_rotate[$faceindex])
        down(text_depth+d20_adj_depth[$faceindex])
        linear_extrude(height=2*text_depth+d20_adj_depth[$faceindex])
        move(x=d20_underscore_h_push*d20_size/100,y=d20_underscore_v_push*d20_size/100)
        offset(delta=txt_stroke)
        text(d20_underscores[$faceindex],size=under_mult,font=under_font,halign="center",valign="center");
    }
}

module drwapips(die,num,adj_depth,pip_fn){
    pip_mult=die=="d4c" ? d4c_pip_size*d4c_size/100 : die=="d4i" ? d4i_pip_size*d4i_size/100 : d6_pip_size*d6_size/100;
    pipr=pip_mult/2;
    pip_offset=die=="d4c" ? d4c_pip_offset : die=="d4i" ? d4i_pip_offset : d6_pip_offset;

    if(num=="1"){
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
    }
    if(num=="2"){
        translate([-pipr*pip_offset,pipr*pip_offset,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
        translate([pipr*pip_offset,-pipr*pip_offset,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
    }
    if(num=="3"){
        drwapips(die,"1",adj_depth,pip_fn);
        drwapips(die,"2",adj_depth,pip_fn);
    }
    if(num=="4"){
        drwapips(die,"2",adj_depth,pip_fn);
        translate([pipr*pip_offset,pipr*pip_offset,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
        translate([-pipr*pip_offset,-pipr*pip_offset,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
    }
    if(num=="5" && die=="d6"){
        drwapips(die,"1",adj_depth,pip_fn);
        drwapips(die,"4",adj_depth,pip_fn);
    }
    if(num=="6" && die=="d6"){
        drwapips(die,"4",adj_depth,pip_fn);
        translate([pipr*pip_offset,0,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
        translate([-pipr*pip_offset,0,0])
        down(text_depth+adj_depth) cylinder(r=pipr,h=2*text_depth+adj_depth,$fn=pip_fn);
    }
}

module drwapipsymbols(die,num,pipsymbol,rot,adj_depth){
    pip_mult=die=="d4c" ? d4c_pip_size*d4c_size/100 : die=="d4i" ? d4i_pip_size*d4i_size/100 : d6_pip_size*d6_size/100;
    sym_stroke=symbol_stroke*pip_mult;
    pipr=pip_mult/2;
    pip_offset=die=="d4c" ? d4c_pip_offset : die=="d4i" ? d4i_pip_offset : d6_pip_offset;

    if(num=="1"){
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
    }
    if(num=="2"){
        translate([-pipr*pip_offset,pipr*pip_offset,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
        translate([pipr*pip_offset,-pipr*pip_offset,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
    }
    if(num=="3"){
        drwapipsymbols(die,"1",pipsymbol,rot,adj_depth);
        drwapipsymbols(die,"2",pipsymbol,rot,adj_depth);
    }
    if(num=="4"){
        drwapipsymbols(die,"2",pipsymbol,rot,adj_depth);
        translate([pipr*pip_offset,pipr*pip_offset,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
        translate([-pipr*pip_offset,-pipr*pip_offset,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
    }
    if(num=="5" && die=="d6"){
        drwapipsymbols(die,"1",pipsymbol,rot,adj_depth);
        drwapipsymbols(die,"4",pipsymbol,rot,adj_depth);
    }
    if(num=="6" && die=="d6"){
        drwapipsymbols(die,"4",pipsymbol,rot,adj_depth);
        translate([pipr*pip_offset,0,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
        translate([-pipr*pip_offset,0,0])
        zrot(rot) down(text_depth+adj_depth) linear_extrude(height=2*text_depth+adj_depth)
        offset(delta=sym_stroke)
        text(pipsymbol,size=pip_mult,font=sym_font,halign="center",valign="center");
    }
}

module pentagonal_antiprism(size){
    C0=(1+sqrt(5))/4; //midradius ≈0.80901699437
    C1=sqrt(5*(5+2*sqrt(5)))/10; //inradius ≈0.68819096024
    C2=sqrt((5-sqrt(5))/40); //≈0.26286555606
    P0=sqrt(10*(5+sqrt(5)))/20; //pentagon center radius ≈0.42532540418
    
    scale([size,size,size*1.8])
    polyhedron(
        points=[
            [ -C0,   -C2, -P0],
            [ -C0,    C2,  P0],
            [-0.5,   -C1,  P0],
            [-0.5,    C1, -P0],
            [   0, -P0*2, -P0],
            [   0,  P0*2,  P0],
            [ 0.5,   -C1,  P0],
            [ 0.5,    C1, -P0],
            [  C0,   -C2, -P0],
            [  C0,    C2,  P0]],
        faces=[
            [4, 8, 7], [3, 4, 7],
            [4, 3, 0], [6, 2, 1],
            [5, 6, 1], [6, 5, 9],
            [3, 5, 1], [3, 1, 0],
            [0, 1, 2], [0, 2, 4],
            [4, 2, 6], [4, 6, 8],
            [8, 6, 9], [8, 9, 7],
            [7, 9, 5], [7, 5, 3]]
    );
}