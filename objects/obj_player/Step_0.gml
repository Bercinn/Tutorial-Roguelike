center_y = y - sprite_get_height(spr_player) / 2;
mouse_dir = point_direction(x, center_y, mouse_x, mouse_y);

inputs[$ "up"]      = keyboard_check(ord("W"));
inputs[$ "left"]    = keyboard_check(ord("A"));
inputs[$ "down"]    = keyboard_check(ord("S"));
inputs[$ "right"]   = keyboard_check(ord("D"));

state_machine.Update();

if((inputs.right xor inputs.left) || (inputs.up xor inputs.down)){
    moving = true;
    move_dir = point_direction(0, 0, inputs.right-inputs.left, inputs.down-inputs.up);
}else{
    moving = false;
}

var _hmove = lengthdir_x(moving * move_speed, move_dir);
var _vmove = lengthdir_y(moving * move_speed, move_dir);

hor_speed = _hmove;
ver_speed = _vmove;

if(hor_speed != 0){
    image_xscale = sign(hor_speed);
}

var _colx = instance_place(x+hor_speed, y, obj_solid);
if(_colx){
    if(hor_speed > 0){
        x = _colx.bbox_left + (x - bbox_right);
    }
    if(hor_speed < 0){
        x = _colx.bbox_right + (x - bbox_left);
    }
    hor_speed = 0;
}
x += hor_speed;

var _coly = instance_place(x, y+ver_speed, obj_solid);
if(_coly){
    if(ver_speed > 0){
        y = _coly.bbox_top + (y - bbox_bottom);
    }
    if(ver_speed < 0){
        y = _coly.bbox_bottom + (y - bbox_top);
    }
    ver_speed = 0;
}
y += ver_speed;

ward_pos_x = x + lengthdir_x(sprite_height, mouse_dir);
ward_pos_y = center_y + lengthdir_y(sprite_height, mouse_dir);
ward_angle = mouse_dir;
