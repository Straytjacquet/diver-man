if (instance_exists(player) and place_meeting(x,y,player) and player.groundY < y+z) 
//or (instance_exists(player) and player.falling) 
{
	if player.map != id {
		depth = player.depth - 1
		drawSurface = true
		player.visible = false
		drawNearbyMaps()
	}
}

if !foundNearbyMaps findNearbyMaps()