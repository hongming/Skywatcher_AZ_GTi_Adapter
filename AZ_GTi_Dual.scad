//定义变量
dovetail_base=44;
dovetail_top=32;
dovetail_height=15;
dovetail_length=124;
dual_arms_gap=160;
 //望远镜底座：25毫米，3/8，1/4，1/4

Dovetail_CubePoints = [
  [  0,  0,  0 ],  //0
  [ dovetail_length,  0,  0 ],  //1
  [ dovetail_length,  dovetail_base,  0 ],  //2
  [  0,  dovetail_base,  0 ],  //3

  [  0,  (dovetail_base-dovetail_top)/2,  dovetail_height ],  //4
  [ dovetail_length,  (dovetail_base-dovetail_top)/2,  dovetail_height ],  //5
  [ dovetail_length,  dovetail_base-(dovetail_base-dovetail_top)/2,  dovetail_height ],  //6
  [  0,  dovetail_base-(dovetail_base-dovetail_top)/2,  dovetail_height ]]; //7
  
Dovetail_CubeFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  




//U型框架区域

//置物平板
difference(){
translate([-15,0,0]){
 cube([dovetail_height,dovetail_base,dual_arms_gap+15]);
}

translate([0,dovetail_base/2,(dual_arms_gap+dovetail_height)/2]){
rotate([0,90,0]){
cylinder(dovetail_height*6,4,4,center=true);}
}
}

difference(){
translate([-dovetail_height,-80+dovetail_base/2,dual_arms_gap/2-dovetail_height]){cube([dovetail_height,80,45]);}
translate([0,dovetail_base/2,(dual_arms_gap+dovetail_height)/2]){rotate([0,90,0]){cylinder(dovetail_height*6,4,4,center=true);}}
rotate([0,90,0]){translate([-(dual_arms_gap+dovetail_height)/2,-10,-dovetail_height]){
cylinder(dovetail_height*6,4,4,center=true);
translate([0,-25,0]){cylinder(dovetail_height*6,5.5,5.5,center=true);}}}


}
difference(){
polyhedron( Dovetail_CubePoints, Dovetail_CubeFaces );
translate([50,dovetail_base/2,0]){
cylinder(dovetail_height*4,6.5,6.5,center=true);}

translate([dovetail_length-dovetail_base/4,dovetail_base/2 ,0]){
cylinder(dovetail_height*4,4,4,center=true);}

translate([dovetail_length-3*dovetail_base/4,dovetail_base/2 ,0]){
cylinder(dovetail_height*4,4,4,center=true);}
///////////////////////

 
}

translate([0,0,dual_arms_gap+dovetail_height]){
mirror([0,0,1]){
difference(){
polyhedron( Dovetail_CubePoints, Dovetail_CubeFaces );
translate([50,dovetail_base/2,0]){
cylinder(dovetail_height*4,6.5,6.5,center=true);
}
translate([dovetail_length-dovetail_base/4,dovetail_base/2 ,0]){
cylinder(dovetail_height*4,4,4,center=true);}

translate([dovetail_length-3*dovetail_base/4,dovetail_base/2 ,0]){
cylinder(dovetail_height*4,4,4,center=true);}
}
}
}


//底部重锤杆连接区

translate([ 80 ,-dovetail_base/2-70,dovetail_height]){
//横向平板
difference(){
cube([dovetail_height*3,dovetail_base,dual_arms_gap-dovetail_height]);
rotate([90,0,90]){
translate([dovetail_base/2,dual_arms_gap/2-dovetail_height/2 ,dovetail_height/2]){
cylinder(dovetail_height*6,6.5,6.5,center=true);}
}
rotate([90,0,90]){
translate([dovetail_base/2,dual_arms_gap/2-dovetail_height/2+30 ,dovetail_height/2]){
cylinder(dovetail_height*6,6.5,6.5,center=true);}
}
rotate([90,0,90]){
translate([dovetail_base/2,dual_arms_gap/2-dovetail_height/2-30 ,dovetail_height/2]){
cylinder(dovetail_height*6,6.5,6.5,center=true);}
}
}
 
////平板转接-正向右侧
translate([0,0,0]){
cube([dovetail_height*3,dovetail_base/2+70+dovetail_base,dovetail_height]);
}

//打孔
translate([ dovetail_base/4,80+3*dovetail_base/4  ,0]){
cylinder(dovetail_height*4,4,4,center=true);}
translate([ 3*dovetail_base/4,dovetail_base/2 ,0]){
cylinder(dovetail_height*4,4,4,center=true);}

//平板转接-正向左侧
translate([0,0,dual_arms_gap-dovetail_height*2]){
cube([dovetail_height*3,dovetail_base/2+70+dovetail_base,dovetail_height]);
}}
