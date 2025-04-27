inputs[$ "up"]       = keyboard_check(ord("W"));
inputs[$ "left"]     = keyboard_check(ord("A"));
inputs[$ "down"]     = keyboard_check(ord("S"));
inputs[$ "right"]    = keyboard_check(ord("D"));

if(inputs.down) face = faces.down;    
if(inputs.up) face = faces.up;
if(inputs.right) face = faces.right;
if(inputs.left) face = faces.left;
if(inputs.down && inputs.right) face = faces.down_right;
if(inputs.down && inputs.left) face = faces.down_left;
if(inputs.up && inputs.right) face = faces.up_right;
if(inputs.up && inputs.left) face = faces.up_left;

if((inputs.right ^^ inputs.left) || (inputs.up ^^ inputs.down)){
    var _hdir = (inputs.right - inputs.left);
    var _vdir = (inputs.down - inputs.up);
    
    moving = true;
    move_dir = point_direction(0, 0, _hdir, _vdir);
}else{
    moving = false;
}

sprite_index = sprites[face];
if(moving){
    image_speed = 1;
}else{
    image_speed = 0;
    image_index = 0;
}

var _hmove = lengthdir_x(moving * move_speed, move_dir);
var _vmove = lengthdir_y(moving * move_speed, move_dir);

hor_speed = lerp(hor_speed, _hmove, 0.2);
ver_speed = lerp(ver_speed, _vmove, 0.2);

move_and_collide(hor_speed, ver_speed, all);
