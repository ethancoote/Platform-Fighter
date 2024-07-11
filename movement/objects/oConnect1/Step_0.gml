// check if gamepad is connected

if connected == false {
	for (i=0;i<12;i++) {
		connected = gamepad_is_connected(i);
		if connected == true {
			gamepad_val = i;
			break;
		}
	}
}

if connected == true {
	connected = gamepad_is_connected(i);
	if connected == false {
		show_debug_message("disconnected");
	} else {
		show_debug_message("connected");
	}
	
	
}




