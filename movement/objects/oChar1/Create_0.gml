// Controls
controls_setup();

// Moving
move_dir = 0;
move_spd = 2;
x_spd = 0;
y_spd = 0;

// Jumping
grav = .4;
term_vel = 4;
jump_speed = -6;
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames = 18;
grounded = true;

// Gamepad
gamepad_set_axis_deadzone(4, 0.4);