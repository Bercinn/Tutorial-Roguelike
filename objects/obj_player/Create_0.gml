hor_speed = 0;
ver_speed = 0;
move_speed = 2;
moving = false;
move_dir = 0;

enum faces{
    down,
    down_right,
    down_left,
    up,
    up_right,
    up_left,
    right,
    left
}

face = faces.down;
sprites                       = [];
sprites[faces.down]           = spr_player_down;
sprites[faces.down_right]     = spr_player_down_right;
sprites[faces.down_left]      = spr_player_down_left;
sprites[faces.up]             = spr_player_up;
sprites[faces.up_right]       = spr_player_up_right;
sprites[faces.up_left]        = spr_player_up_left;
sprites[faces.right]          = spr_player_right;
sprites[faces.left]           = spr_player_left;

xscale = 1;
yscale = 1;

inputs = {};
