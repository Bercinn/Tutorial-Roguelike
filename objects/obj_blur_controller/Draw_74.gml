var _blur_steps_d = round(0.18 * 40) + 1;
var _blur_steps = ceil(_blur_steps_d/2);

var _kernel_d = 2 * _blur_steps_d + 1;
var _kernel = 2 * _blur_steps + 1;

var _sigma_d = max(0.16, 0.0001);
var _sigma = _sigma_d * _kernel_d / _kernel;

if(!surface_exists(surf_ping)){
    surf_ping = surface_create(gui_w, gui_h);
}

if(global.use_blur){
    
    gpu_set_tex_filter(true);
    
    shader_set(shader);
    
    shader_set_uniform_f(u_blur_steps, _blur_steps);
    shader_set_uniform_f(u_texel_size, texel_w, texel_h);
    shader_set_uniform_f(u_sigma, _sigma);
    
    //Horizontal blur
    shader_set_uniform_f(u_blur_vector, 1, 0);
    surface_set_target(surf_ping);
        draw_surface(application_surface, 0, 0);
    surface_reset_target();
    
    //Vertical blur
    shader_set_uniform_f(u_blur_vector, 0, 1);
    draw_surface(surf_ping, 0, 0);
       
    shader_reset();
    
    gpu_set_tex_filter(false);
}else{
    gpu_set_tex_filter(false);
    
    draw_surface(application_surface, 0, 0);
}
    