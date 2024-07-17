// Controls
controls_setup();
sprites = populate_char_sprites_array_brawl();

// Moving
move_dir = 0;
move_spd = 3;
air_spd = 2;
walk_spd = 1;
x_spd = 0;
y_spd = 0;
face = 1;
i = -1;

// Jumping
set_grav = .55;
grav = set_grav;
term_vel = 5;
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

// misc
last_frame_y = y;
last_move_dir = 1;
player = noone;
enemy = noone;
hit_speed = [0, 0];
falloff = [0, 0];
player_num = 0;
on_plat = false;
invol_buffer = 3;
invol_timer = 0;
damage_mult = 0;

// status info
damage = 0;
respawns = 3;

// attack controls
//// big attack 1
big_attack1_active_frames = 5;
big_attack1_start_frames = 10;
big_attack1_end_frames = 20;
big_attack1_timer = 0;
big_attack1_strength = 30;
big_attack1_launch_angle = [0.2, -0.2];
big_attack1_hit_pause = 10;

// active move
move_strenth = 0;
launch_angle = [0, 0];
attack_instance = noone;

// lag constants
endlag = 0;
active = 0;
startup = 0;
hitpause = 0;
hitstun = 0;

// Sprite Controls
squash_timer = 0;
squash_frames = 5;
draw_xscale = 1;
draw_yscale = 1;
draw_xpos = x;
draw_ypos = y;
draw_angle = 0;