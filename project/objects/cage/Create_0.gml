event_inherited()

shadowEllipse = false

z = 360

//startingGame = false
lowered = false
inUse = true
liftDirection = down
filled = true
function lift(up_or_down) {
	
	if filled {
		player.muted = true
		player.x = x
		player.y = y-z
		player.groundX = x
		player.groundY = y-z
	}
	
	var Z = 0
	switch(up_or_down)
	{
		case up:
			Z = 2	
		break
		
		case down:
			Z = -2
		break
	}
	
	if !app.paused z += Z
	
	if lowered and z >= 360 {
		debug.log("Cage has been lifted")	
		inUse = false
		lowered = false
		
		liftDirection = down
	}
	else if !lowered and z <= 0 {
		debug.log("Cage has been lowered")
		inUse = false
		lowered = true
		z = 0
		
		if filled {
			player.muted = false
			player.groundX = x
			player.groundY = y
		}
		
		//liftDirection = up
		
	}
	
	////	Assemble the pieces to the cage (plus the player!)
	draw_sprite(s_cage_floor,0,x,y-z)
	
	if filled draw_sprite_ext(player.sprite_index,player.image_index, x,y-z, player.image_xscale,player.image_yscale,player.image_angle,player.image_blend,player.image_alpha)
	
	draw_sprite(s_cage_roof,0,x,y-z)
	draw_sprite(s_cage_bars,0,x,y-z)
	
}