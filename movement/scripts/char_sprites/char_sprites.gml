// populate 2d arrays of character sprites
function populate_char_sprites_array_brawl() {
	sprite_array = []; 
	
	// player 1 sprites
	sprite_array[1][0] = sBrawlIdle1;
	sprite_array[1][1] = sBrawlDash1;
	sprite_array[1][2] = sBrawlJump1;
	sprite_array[1][3] = sBrawlJump1_1;
	sprite_array[1][4] = sBrawlJump1_2;
	sprite_array[1][5] = sBrawlJump1_3;
	sprite_array[1][6] = sBrawlPunch1;
	
	// player 2 sprites
	sprite_array[2][0] = sBrawlIdle2;
	sprite_array[2][1] = sBrawlDash2;
	sprite_array[2][2] = sBrawlJump2;
	sprite_array[2][3] = sBrawlJump2_1;
	sprite_array[2][4] = sBrawlJump2_2;
	sprite_array[2][5] = sBrawlJump2_3
	
	return sprite_array;
}