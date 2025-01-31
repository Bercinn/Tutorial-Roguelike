persistent = true;

cam = view_camera[0];

view_enabled = true;
view_visible[0] = true;

display_width = 1920;
display_height = 1080;

scales = {
    cam : 4,
    win : 3,
    gui : 1,
    appsurf : 2
};

cam_w = display_width / scales.cam;
cam_h = display_height / scales.cam;

camera_set_view_size(cam, cam_w, cam_h);
display_set_gui_size(cam_w * scales.gui, cam_h * scales.gui);
surface_resize(application_surface, cam_w * scales.appsurf, cam_h * scales.appsurf);
window_set_size(cam_w * scales.win, cam_h * scales.win);
window_center();
