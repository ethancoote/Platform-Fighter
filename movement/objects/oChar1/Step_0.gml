// Get inputs
get_controls(i);

// X Movement
move_dir = right_key - left_key;

// Air vs ground speed
if grounded {
	x_spd = move_dir * move_spd;
} else {
	x_spd = move_dir * air_spd;
}

y_spd += grav;
if endlag > 0 {
	move_dir = last_move_dir;
}
if move_dir == 0 {
	move_dir = right_key_walk - left_key_walk;
	x_spd = move_dir * walk_spd;
	init_dash_count = 0;
	init_dash_active = false;
	if move_dir == 0 || endlag > 0 {
		face = last_move_dir;
	} else {
		face = move_dir;
	}
	
} else {
	init_dash_active = true;
	face = move_dir;
}

// Grounded Dash Init
if init_dash_count < init_dash_max && grounded && init_dash_active {
	if x_spd > 0 {
		init_dash_speed_dir = init_dash_speed;
	} else {
		init_dash_speed_dir = -init_dash_speed;
	}
	init_dash_timer = init_dash_frames;
	init_dash_count += 1;
}

// Grounded Dash
if init_dash_timer > 0 {
	x_spd = init_dash_speed_dir;
	init_dash_timer--;
}

// Air Dash Init
if  dash_key && x_spd != 0 && grounded == false && dash_count < dash_max && hitstun == 0 && endlag == 0{
	dash_timer = dash_frames + dash_hang_time;
	if x_spd < 0 {
		dash_speed_dir = -dash_speed;
	} else {
		dash_speed_dir = dash_speed;
	}
	dash_count++;
}

//Air Dash
if dash_timer > 0 {
	if dash_timer > (dash_hang_time) {
		x_spd = dash_speed_dir;
	} else {
		x_spd = dash_speed_dir * hang_move_speed;
	}
	y_spd = 0;
	dash_timer--;
} 

if y_spd > term_vel {
	y_spd = term_vel;
}

// init jump
if jump_key_buffered && jump_count < jump_max && hitstun == 0 && endlag == 0{
	jump_key_buffered = false;
	jump_key_buffer_time = 0;
	jump_count++;
	jump_hold_timer = jump_hold_frames_short;
	jump_squat_count = 0;
	if !grounded {
		jump_hold_timer += jump_hold_frames_full;
	}
	
}
// jump height
if jump_hold_timer > 0 {
	if jump_squat_count >= jump_squat_frames && dash_timer == 0{
		y_spd = jump_speed;
		jump_hold_timer--;
	} else if jump_squat_count >= jump_squat_frames {
		jump_hold_timer--;
	}
	jump_squat_count += 1;
}

// SH vs FH
if jump_key && jump_count < jump_max{
	jump_hold_frame_count += 1;
} else {
	jump_hold_frame_count = 0;
}

if jump_hold_frame_count == jump_short_buffer && !grounded {
	jump_hold_timer += jump_hold_frames_full;
}

last_move_dir = face;

// Attacks
// big attack 1
if big_attack_key && grounded && endlag == 0 && hitstun == 0{
	endlag = big_attack1_end_frames;
	startup = big_attack1_start_frames;
	active = big_attack1_active_frames;
	big_attack1_timer = endlag + startup + active;
}

if big_attack1_timer > 0 {
	if startup > 0 {
		sprite_index = sprites[player_num][6];
		startup--;
	} else if active > 0 {
		if attack_instance == noone {
			if last_move_dir > 0 {
				attack_instance = instance_create_depth(x+15, y-5, -1, oBrawlBig1);
				launch_angle = big_attack1_launch_angle;
			} else if last_move_dir < 0 {
				attack_instance = instance_create_depth(x-15, y-5, -1, oBrawlBig1);
				attack_instance.image_xscale = attack_instance.image_xscale * -1;
				launch_angle = [-big_attack1_launch_angle[0], big_attack1_launch_angle[1]];
			}
			move_strenth = big_attack1_strength;
		}
		if enemy.hitpause == 0 {
			image_speed = 1;
			active--;
		} else {
			image_speed = 0;
		}
	} else if endlag > 0 {
		if attack_instance != noone {
			instance_destroy(attack_instance);
			attack_instance = noone;
		} 
		endlag--;
	}
	x_spd = 0;
	y_spd = 0;
	if enemy.hitpause == 0 {
		big_attack1_timer--;
	}
	
}

// Got Hit
if enemy.attack_instance != noone && invol_timer == 0 {
	if place_meeting(x, y, enemy.attack_instance) {
		hitstun = round(enemy.move_strenth / 1.5);
		hit_speed = [enemy.move_strenth * enemy.launch_angle[0], enemy.move_strenth * enemy.launch_angle[1]];
		falloff = [hit_speed[0]/hitstun, hit_speed[1]/hitstun];
		hitpause = round(enemy.move_strenth / 2);
		invol_timer = invol_buffer;
		damage += hitpause;
		if enemy.x > x {
			face = 1;
		} else {
			face = -1;
		}
		last_move_dir = face;
	}
}

if hitpause > 0 {
	x_spd = 0;
	y_spd = 0;
	hitpause--;
} else if hitstun > 0 {
	if invol_timer > 0 {
		invol_timer--;
	}
	damage_mult = (damage / 50) + 1;
	x_spd = falloff[0] * hitstun * damage_mult;
	y_spd = falloff[1] * hitstun * damage_mult;
	hitstun--;
}

// death
if place_meeting(x, y, oBlastZone) {
	respawns -= 1;
	damage = 0;
	if respawns == 0 {
		show_debug_message("game end");
		room_goto(0);
	} else if player_num == 1 {
		x = oStageControl.p1_spawn[0];
		y = oStageControl.p1_spawn[1];
		oP1Lives.life_count -= 1;
	} else if player_num == 2 {
		x = oStageControl.p2_spawn[0];
		y = oStageControl.p2_spawn[1];
		oP2Lives.life_count -= 1;
	}
}

//////////////////////// Sprite Control

// jump
draw_xscale = 1;
draw_yscale = 1;
draw_xpos = x;
draw_ypos = y;
draw_angle = 0;
if endlag == 0 {
	sprite_index = sprites[player_num][0];
}


if jump_hold_timer > 0 && jump_squat_count < jump_squat_frames && hitstun == 0 {
	sprite_index = sprites[player_num][3];
} else if (y_spd < -3 || y_spd == term_vel) && hitstun == 0 {
	sprite_index = sprites[player_num][4];
} else if (y_spd < -2 || y_spd >= (term_vel+1)) && hitstun == 0 {
	sprite_index = sprites[player_num][5];
}

if squash_timer > 3 && grounded{
	sprite_index = sprites[player_num][3];
	squash_timer--;
} else if squash_timer > 0 && grounded {
	sprite_index = sprites[player_num][2];
	squash_timer--;
}

// dash
if (x_spd >= dash_speed || x_spd <= -dash_speed) && !grounded && hitstun == 0{
	if x_spd > 0 || x_spd < 0{
		sprite_index = sprites[player_num][1];
		
	}
} else if (x_spd >= move_spd || x_spd <= -move_spd) && grounded && hitstun == 0{
	draw_ypos = y - 2;
	if x_spd > 0 {
		draw_xpos = x - 5;
		draw_angle = 20;
	} else if x_spd < 0 {
		draw_xpos = x + 5;
		draw_angle = -20;
	}	
}

// crouch
if crouch_key && grounded && x_spd >= -walk_spd && x_spd <= walk_spd {
	sprite_index = sprites[player_num][3];
}
///////////////////////////////////////

// Y Collision
var _sub_pixel = .5;

if place_meeting(x, y + y_spd, oWall) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, oWall) {
		y += _pixel_check;
	}
	
	if y_spd < 0 {
		jump_hold_timer = 0;
	} 
	
	if y_spd > grav {
		squash_timer = squash_frames;
	}
	on_plat = false;
	y_spd = 0;
} else if place_meeting(x, y + y_spd, oPlat) && last_frame_y <= (oPlat.y + _sub_pixel) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, oPlat) {
		y += _pixel_check;
	}
	
	if crouch_key && x_spd == 0{
		y += 1;
	}
	
	if y_spd < 0 {
		jump_hold_timer = 0;
	} 
	
	if y_spd > grav {
		squash_timer = squash_frames;
	}
	on_plat = true;
	y_spd = 0;
} else {
	on_plat = false;
}

y += y_spd;

// X Collision
if place_meeting(x + x_spd, y, oWall) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, oWall) {
		x += _pixel_check;
	}
	
	x_spd = 0;
}

x += x_spd;

// Set grounded
if (y_spd >= 0 && place_meeting(x, y+1, oWall)) || (y_spd >= 0 && on_plat) {
	grounded = true;
	coyote_timer = coyote_frames;
	jump_count = 0;
	dash_count = 0;
} else {
	grounded = false;
	coyote_timer += 1;
	if jump_count == 0 && coyote_timer >= coyote_frames {
		jump_count = 1;
	}
}

last_frame_y = y;


