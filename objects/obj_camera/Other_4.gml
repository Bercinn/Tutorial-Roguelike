cam = view_camera[0];

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(cam, cam_w, cam_h);
display_set_gui_size(cam_w * scales.gui, cam_h * scales.gui);
