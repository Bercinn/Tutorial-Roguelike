inputs[$ "up"]      = keyboard_check(ord("W"));
inputs[$ "left"]    = keyboard_check(ord("A"));
inputs[$ "down"]    = keyboard_check(ord("S"));
inputs[$ "right"]   = keyboard_check(ord("D"));

if((inputs.right xor inputs.left) || (inputs.up xor inputs.down)){
    moving = true;
    move_dir = point_direction(0, 0, inputs.right-inputs.left, inputs.down-inputs.up);
}else{
    moving = false;
}

var _hmove = lengthdir_x(moving * move_speed, move_dir);
var _vmove = lengthdir_y(moving * move_speed, move_dir);

hor_speed = lerp(hor_speed, _hmove, 0.1);
ver_speed = lerp(ver_speed, _vmove, 0.1);

if(hor_speed != 0){
    image_xscale = sign(hor_speed);
}

x += hor_speed;
y += ver_speed;
