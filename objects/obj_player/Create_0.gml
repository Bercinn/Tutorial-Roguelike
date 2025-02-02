hor_speed = 0;
ver_speed = 0;
move_speed = 2;

moving = false;
move_dir = 0;

inputs = {};

state_machine = new StateMachine([
    new State("idle", function(){
        NewAnim(spr_player_idle);
        
        if(moving){
            state_machine.SetState("run");
        }
    }),

    new State("run", function(){
        NewAnim(spr_player_run);
        
        if(!moving){
            state_machine.SetState("idle");
        }
    })
]);
state_machine.SetState("idle");

ward_pos_x = 0;
ward_pos_y = 0;
ward_angle = 0;

center_y = 0;
mouse_dir = 0;

with(instance_create_depth(x, y, depth-1, obj_ward)){
    par = other;
}
