// check if gamepad is connected
get_menu_controls(i);
if connected == false {
	for (i=0;i<12;i++) {
		connected = gamepad_is_connected(i);
		if connected == true {
			gamepad_val = i;
			break;
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
				oReadyCheck1.sprite_index = sReady;
			} else if ready == true {
				ready = false;
				oReadyCheck1.sprite_index = sNotReady;
			}
		}
	}
}

if ready == true && oConnect2.ready == true {
	oGlobal.player1_control = i;
	oGlobal.player2_control = oConnect2.i;
	room_goto(1);
}


