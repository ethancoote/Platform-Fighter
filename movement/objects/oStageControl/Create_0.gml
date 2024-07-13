player1_control = oGlobal.player1_control;
player2_control = oGlobal.player2_control;
p1_spawn = [352, 160];
p2_spawn = [608, 160];

var _player1 = instance_create_depth(p1_spawn[0], p1_spawn[1], 0, oChar1);
var _player2 = instance_create_depth(p2_spawn[0], p2_spawn[1], 0, oChar1);

with (_player1){
	i = oStageControl.player1_control;
	sprite_index = sChar1;
	player = _player1;
	enemy = _player2;
	player_num = 1;
}
with (_player2){
	i = oStageControl.player2_control;
	sprite_index = sChar2;
	player = _player2;
	enemy = _player1;
	player_num = 2;
}


