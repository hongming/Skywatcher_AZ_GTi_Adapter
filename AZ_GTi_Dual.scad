//定义变量
dovetail_base=44;
dovetail_top=32;
dovetail_height=15;
dovetail_length=200;
dual_arms_gap=200;
 

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
  
polyhedron( Dovetail_CubePoints, Dovetail_CubeFaces );
translate([0,0,dual_arms_gap]){
polyhedron( Dovetail_CubePoints, Dovetail_CubeFaces );
}

translate([-15,0,0]){
cube([dovetail_height,dovetail_base,215]);
}

translate([0,dovetail_base/2,0]){
cylinder(10,40,40);
}