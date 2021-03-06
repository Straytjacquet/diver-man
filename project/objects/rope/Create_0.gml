anchorX = x
anchorY = y

cranking = true
crankSpeed = 5
crank = 0

ropeTension = 0
ropeLength = 0
ropeLengthMin = 25
ropeMaxSegments = 20
ropeLengthMax = ropeLengthMin * ropeMaxSegments

vertices = ds_list_create()

verticeCount = 0

reel = 0

function create_vertex_struct(_x, _y) constructor {
	x = _x
	y = _y
	z = 0
	xOld = _x + irandom_range(-2,2)
	yOld = _y + irandom_range(-2,2)
	calculate = true
}

function create_vertex(x, y) {
	var vertex = new create_vertex_struct(x, y)
	ds_list_add(vertices, vertex)
	verticeCount++
}
	
function delete_vertex(index) {
	ds_list_delete(vertices, index)
	verticeCount--
}

function update_vertices(vertex, nextVertex) {
	//	Update our vertices
	var pX = vertex.x
	var pY = vertex.y
	var vX = pX - vertex.xOld
	var vY = pY - vertex.yOld
	var drag = 0.8
	var fric = 0.5
		
	//	x movements
	vertex.xOld = vertex.x
	pX += vX * drag
		
	//	Keep the point in the room
	//if pX > room_width {
	//	pX = room_width
	//	vertex.xOld = vertex.x + (vX * fric)
	//}
	//else if pX < 0 {
	//	pX = 0
	//	vertex.xOld = vertex.x + (vX * fric)
	//}
		
	vertex.x = pX
		
	//	y movements
	vertex.yOld = vertex.y
	pY += vY * drag
		
	if pY > room_height or pY < 0 {
		//delete_vertex()
		//pY = room_height
		//vertex.yOld = vertex.y + (vY * fric)
	}
	else if pY < 0 {
		//pY = 0 
		//vertex.yOld = vertex.y + (vY * fric)
	}
		
	vertex.y = pY	
}

function update_sticks(vertex, nextVertex) {
	//	Update sticks
	var dx = vertex.x - nextVertex.x
	var dy = vertex.y - nextVertex.y
	var d2 = sqrt((dx * dx) + (dy * dy))
	var diff = d2 - ropeLengthMin
	var percent = (diff/d2)/2
	var offX = dx*percent
	var offY = dy*percent
		
	//	Update the next stick
	nextVertex.x += offX
	vertex.x -= offX
	nextVertex.y += offY
	vertex.y -= offY
}

function collision_check_stick(vertex, nextVertex) {
	////	Collision checking the stick
	//var ID = collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
	//if ID
    //{
	//	var attempts = 0
    //    while collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
    //    {
	//		var X = sign(vertex.x - ID.centerX)
	//		var Y = sign(vertex.y - ID.centerY)
	//		vertex.x += X
    //        vertex.y += Y
			
	//		var X = sign(nextVertex.x - ID.centerX)
	//		var Y = sign(nextVertex.y - ID.centerY)
	//		nextVertex.x += X
    //        nextVertex.y += Y
	//		attempts++
	//		if attempts >= 100 {
	//			exit	
	//		}
    //    }
    //}
	
	////	Collision checking the stick
	//var ID = collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collisionMap,false,false)
	//if ID
    //{
	//	var attempts = 0
	//	//	If we're behind this collisionMap
	//	if vertex.z < ID.z and vertex.y < ID.bbox_bottom - ID.width {
	//		//exit	
	//	}
	//	else if vertex.z < ID.z and nextVertex.z < vertex.z {
	//        while collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collisionMap,false,false)
	//        {
	//			var X = sign(vertex.x - ID.centerX)
	//			var Y = sign(vertex.y - ID.centerY)
	//			vertex.x += X
	//            vertex.y += Y
			
	//			var X = sign(nextVertex.x - ID.centerX)
	//			var Y = sign(nextVertex.y - ID.centerY)
	//			nextVertex.x += X
	//            nextVertex.y += Y
	//			attempts++
	//			if attempts >= 100 {
	//				exit	
	//			}
	//        }
	//	}
    //}
	
}

create_vertex(x, y)
create_vertex(x, y)
create_vertex(x, y)