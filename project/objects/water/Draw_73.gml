if on {
	var surface = surface_create(room_width,room_height)
	surface_set_target(surface)
	draw_clear_alpha(c_black, 0)
	
	draw_set_alpha(1)
	draw_set_color(c_blue)
	//draw_set_color(make_color_rgb(90,196,231))
	//draw_set_color(make_color_rgb(55,30,111))
	draw_rectangle(0,0,room_width,room_height,false)
	
	//	Room transition
	if app.roomTransitionStage > -1 and buffer_exists(app.roomTransitionBuffer) {
		draw_set_alpha(1)
		var Surface = surface_create(display_get_gui_width(),display_get_gui_height())
		buffer_set_surface(app.roomTransitionBuffer,Surface, 0)
		
		//debug.log("surface_width: "+string(surface_get_width(Surface)))
		//debug.log("surface_height: "+string(surface_get_height(Surface)))
		
		gpu_set_blendmode(bm_subtract)
		draw_surface(Surface,camera_get_view_x(app.camera),app.camera_get_view_y(app.camera))
		gpu_set_blendmode(bm_normal)
		surface_free(Surface)
	}
	
	surface_reset_target()
	
	draw_set_alpha(0.25)
	
	draw_surface(surface,0,0)
	
	draw_reset()
	
	surface_free(surface)
}