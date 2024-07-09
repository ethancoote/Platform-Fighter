function controls_setup(){
	buffer_time = 5;
	jump_key_buffered = 0;
	jump_key_buffer_time = 0;
}

function get_controls(){
	// dir inputs
	right_key = keyboard_check( vk_right ) || (gamepad_axis_value(4, gp_axislh) > 0.8);
	left_key = keyboard_check( vk_left ) || (gamepad_axis_value(4, gp_axislh) < -0.8);
	right_key_walk = (gamepad_axis_value(4, gp_axislh) > 0) && (gamepad_axis_value(4, gp_axislh) < 0.8);
	left_key_walk = (gamepad_axis_value(4, gp_axislh) < 0) && (gamepad_axis_value(4, gp_axislh) > -0.8);
	
	// action inputs
	jump_key_pressed = keyboard_check_pressed( vk_space ) || gamepad_button_check_pressed(4, gp_face1);
	jump_key = keyboard_check( vk_space ) || gamepad_button_check(4, gp_face1);
	dash_key =  keyboard_check( vk_control ) || gamepad_button_check(4, gp_shoulderl);
	
	// jump buffer
	if jump_key_pressed {
		jump_key_buffer_time = buffer_time;
	}
	
	if jump_key_buffer_time > 0 {
		jump_key_buffered = 1;
		jump_key_buffer_time--;
	} else {
		jump_key_buffered = 0;
	}
}