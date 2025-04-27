persistent = true;

shader = shd_two_pass_blur;
u_blur_steps = shader_get_uniform(shader, "blur_steps");
u_sigma = shader_get_uniform(shader, "sigma");
u_texel_size = shader_get_uniform(shader, "texel_size");
u_blur_vector = shader_get_uniform(shader, "blur_vector");

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

texel_w = 1 / gui_w;
texel_h = 1 / gui_h;

surf_ping = -1;

application_surface_draw_enable(false);
