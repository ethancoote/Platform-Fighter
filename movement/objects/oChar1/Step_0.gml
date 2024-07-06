// Get inputs
right_key = keyboard_check( vk_right );
left_key = keyboard_check( vk_left );
jump_key_pressed = keyboard_check_pressed( vk_space );
jump_key = keyboard_check( vk_space );

// X Movement
move_dir = right_key - left_key;
x_spd = move_dir * move_spd;

// X Collision
var _sub_pixel = .5;
if place_meeting(x + x_spd, y, oWall)
{
	var _pixel_check = _sub_pixel * sign(x_spd);
	while !place_meeting(x + _pixel_check, y, oWall)
	{
		x += _pixel_check;
	}
	x_spd = 0;
}

// Y Movement
y_spd += grav;

if y_spd > term_vel 
{
	y_spd = term_vel;
}

// Jump
if jump_key_pressed && place_meeting( x, y+1, oWall )
{
	y_spd = jump_speed;
}

// Y Collision
if place_meeting(x, y + y_spd, oWall)
{
	var _pixel_check = _sub_pixel * sign(y_spd);
	while !place_meeting(x, y + _pixel_check, oWall) 
	{
		y += _pixel_check;
	}
	
	y_spd = 0;
}



// Move
x += x_spd;
y += y_spd;
