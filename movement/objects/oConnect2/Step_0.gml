// only check if first controller is connected
// check if gamepad is connected
get_menu_controls(i);
if oConnect1.connected == true {
	if connected == false {
		for (i=0;i<12;i++) {
			if (i != oConnect1.i) {
				connected = gamepad_is_connected(i);
				if connected == true {
					gamepad_val = i;
					break;
				}
			}
		}
	}
}

// check if gamepad is disconnected
if connected == true {
	connected = gamepad_is_connected(i);
	if connected == false {
		sprite_index = sConnected;
		ready = false;
	} else {
		sprite_index = sConnected1;
		if start_key {
			if ready == false {
				ready = true;
				oReadyCheck2.sprite_index = sReady;
			} else if ready == true {
				ready = false;
				oReadyCheck2.sprite_index = sNotReady;
			}
		}
	}
}




