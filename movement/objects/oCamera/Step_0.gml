// Get cam size

var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

// get cam target coords
player1_x_pos = player_instance1.x - _cam_width / 2;
player1_y_pos = player_instance1.y - _cam_height / 2;
player2_x_pos = player_instance2.x - _cam_width / 2;
player2_y_pos = player_instance2.y - _cam_height / 2;

var _x_dif = abs(player1_x_pos - player2_x_pos);
var _y_dif = abs(player1_y_pos - player2_y_pos);

if player1_x_pos < player2_x_pos {
	cam_x = player1_x_pos + (_x_dif/2);
} else {
	cam_x = player2_x_pos + (_x_dif/2);
}

if player1_y_pos < player2_y_pos {
	cam_y = player1_y_pos + (_y_dif/2) -15;
} else {
	cam_y = player2_y_pos + (_y_dif/2) - 15;
}

cam_size_x = (_x_dif/2) + 300;
cam_size_y = cam_size_x * (9/16);

// set cam position
camera_set_view_pos(view_camera[0], cam_x, cam_y);
camera_set_view_size(view_camera[0], cam_size_x, cam_size_y);



