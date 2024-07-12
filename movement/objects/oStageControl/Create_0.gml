player1_control = oGlobal.player1_control;
player2_control = oGlobal.player2_control;

var _player1 = instance_create_depth(112, 32, 0, oChar1);
var _player2 = instance_create_depth(368, 32, 0, oChar1);

with (_player1){
	i = oStageControl.player1_control;
	sprite_index = sChar1;
}
with (_player2){
	i = oStageControl.player2_control;
	sprite_index = sChar2;
}



