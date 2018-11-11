//定义变量
dovetail_base=44;
dovetail_top=32;
dovetail_height=15;
dual_arms_gap=160;
dual_arms_connector=125;
dual_arm_counterweight=75+15;
dual_arm_dovetail=80+15;
dual_arm_append_thickness=10;
 //望远镜底座：25毫米，3/8，1/4，1/4

Dovetail_CubePoints = [
  [  0,  0,  0 ],  //0
  [ dual_arm_dovetail,  0,  0 ],  //1
  [ dual_arm_dovetail,  dovetail_base,  0 ],  //2
  [  0,  dovetail_base,  0 ],  //3

  [  0,  (dovetail_base-dovetail_top)/2,  dovetail_height ],  //4
  [ dual_arm_dovetail,  (dovetail_base-dovetail_top)/2,  dovetail_height ],  //5
  [ dual_arm_dovetail,  dovetail_base-(dovetail_base-dovetail_top)/2,  dovetail_height ],  //6
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
 union(){

cube([dovetail_height,dovetail_base,dual_arms_connector]);


translate([0,-50,dual_arms_connector-75-dovetail_base/2])
{cube([dovetail_height,50,dovetail_base]);}
}

//望远镜固定螺孔1
rotate([90,0,90]){
translate([dovetail_base/2,dual_arms_connector-75 ,-10]){
cylinder(dovetail_height*6,4,4);}}

//望远镜固定螺孔2
rotate([90,0,90]){
translate([dovetail_base/2-25,dual_arms_connector-75 ,-10]){
cylinder(dovetail_height*6,4,4);}}

//望远镜固定螺孔3
rotate([90,0,90]){
translate([dovetail_base/2-25-25,dual_arms_connector-75 ,-10]){
cylinder(dovetail_height*6,5.5,5.5);}}
}
 
//鸠尾板
translate([0,0,dual_arms_connector-dovetail_height]){
polyhedron( Dovetail_CubePoints, Dovetail_CubeFaces );
}

translate([0,(dovetail_base-dovetail_top)/2,dual_arms_connector]){
cube([dual_arm_dovetail,dovetail_top,dual_arm_append_thickness+dovetail_height]);}


//重锤连接杆支撑臂
difference(){
union(){
translate([0,0,0]){
cube([dual_arm_counterweight,dovetail_base/2,dovetail_height]);}
translate([0,dovetail_base/2,0]){
cube([dual_arm_counterweight-20,dovetail_base/2,dovetail_height]);
}

translate([0,0,-dual_arm_append_thickness]){
cube([dual_arm_counterweight,dovetail_base/2,dual_arm_append_thickness]);

translate([0,dovetail_base/2,0]){cube([dual_arm_counterweight-20,dovetail_base/2,dual_arm_append_thickness]);}

}

translate([dual_arm_counterweight-dovetail_base/2,dovetail_base/2,-dual_arm_append_thickness]){
cylinder(dovetail_height+dual_arm_append_thickness,dovetail_base/2,dovetail_base/2);}
}
translate([dual_arm_counterweight-dovetail_base/2,dovetail_base/2,0]){
cylinder(dovetail_height*4,6.5,6.5,center=true);}

}



//外接重锤平台
difference(){
translate([dual_arm_counterweight-dovetail_base,-dovetail_base-dovetail_height-dual_arm_append_thickness,-dual_arm_append_thickness]){cube([dovetail_base,dovetail_height+dual_arm_append_thickness,dual_arm_append_thickness*2+dovetail_height+dual_arms_connector]);}

rotate([90,0,90]){
translate([-dovetail_base-0.5*(dovetail_height+dual_arm_append_thickness),dual_arms_connector-75 ,0]){
cylinder(dovetail_height*7,6.5,6.5);}}

rotate([90,0,90]){
translate([-dovetail_base-0.5*(dovetail_height+dual_arm_append_thickness),dual_arms_connector-75+30 ,0]){
cylinder(dovetail_height*7,6.5,6.5);}}

rotate([90,0,90]){
translate([-dovetail_base-0.5*(dovetail_height+dual_arm_append_thickness),dual_arms_connector-75+60 ,0]){
cylinder(dovetail_height*7,6.5,6.5);}}

}

 

//重锤杆端连接件
translate([dual_arm_counterweight-dovetail_base,-dovetail_base,-dual_arm_append_thickness]){cube([dovetail_base,dovetail_base,dual_arm_append_thickness+dovetail_height]);}

//鸠尾板端连接件
translate([dual_arm_counterweight-dovetail_base,-dovetail_base,dual_arms_connector]){cube([dovetail_base,dovetail_base*2,dual_arm_append_thickness+dovetail_height]);}

