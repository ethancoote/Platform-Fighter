// Controls
controls_setup();

// Moving
move_dir = 0;
move_spd = 3;
air_spd = 2;
walk_spd = 1;
x_spd = 0;
y_spd = 0;
face = 1;

// Jumping
set_grav = .7;
grav = .7;
term_vel = 7;
jump_speed = -6;
jump_max = 2;
jump_count = 0;
grounded = true;

// SH vs FH
jump_hold_timer = 0;
jump_hold_frames_full = 5;
jump_hold_frames_short = 4;
jump_short_buffer = 9;
jump_hold_frame_count = 0;

// Jump Squat
jump_squat_frames = 5;
jump_squat_count = 0;

// Coyote Time
coyote_frames = 3;
coyote_timer = 0;

// Air Dash
dash_max = 1;
dash_count = 0;
dash_speed = 6;
dash_speed_dir = dash_speed;
dash_frames = 10;
dash_hang_time = 5;
hang_move_speed = 0.3;
dash_timer = 0;

// Initial Dash
init_dash_timer = 0;
init_dash_frames = 5;
init_dash_speed = 5;
init_dash_max = 1;
init_dash_count = 0;
init_dash_active = false;
init_dash_speed_dir = init_dash_speed;

// frame tracking
last_frame_y = y;

// Sprite Controls
squash_timer = 0;
squash_frames = 5;
draw_xscale = 1;
draw_yscale = 1;
draw_xpos = x;
draw_ypos = y;
draw_angle = 0;

// Gamepad
gamepad_set_axis_deadzone(4, 0.3);