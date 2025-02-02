function StateMachine(_state_arr) constructor{
    current_state = undefined;
    
    for(var i = 0; i < array_length(_state_arr); i++){
        var _state = _state_arr[i];
        var _state_name = _state.name;
        self[$ _state_name] = _state;
    }
    
    static Update = function(){
        if(current_state != undefined){
            if(current_state.update != undefined){
                current_state.update();
            }
        }
    }
    
    static SetState = function(_new_state){
        var _new = self[$ _new_state];
        if(current_state != _new){
            current_state = _new;
        }
    }
}

function State(_name, _update) constructor{
    name = _name;
    update = _update;
}

function NewAnim(_sprite){
    if(sprite_index != _sprite){
        sprite_index = _sprite;
    }
}
