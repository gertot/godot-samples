extends Node

#calculate the boundings of a tilemap
func calculate_tilemap_size(tilemap):
	# Get list of all positions where there is a tile
	var used_cells = tilemap.get_used_cells()
	var tilesize = tilemap.get_cell_size()
	
	# If there are none, return null result
	if used_cells.size() == 0:
	    return {x=0, y=0, width=0, height=0}
	
	# Take first cell as reference
	var min_x = used_cells[0].x
	var min_y = used_cells[0].y
	var max_x = min_x
	var max_y = min_y
	
	# Find bounds
	for i in range(1, used_cells.size()):
	    var pos = used_cells[i]
	    if pos.x < min_x:
	        min_x = pos.x
	    elif pos.x > max_x:
	        max_x = pos.x
	
	    if pos.y < min_y:
	        min_y = pos.y
	    elif pos.y > max_y:
	        max_y = pos.y
	
	# Return resulting bounds
	return {
	    x = min_x * tilesize.x,
	    y = min_y * tilesize.y,
	    width = (max_x - min_x + 1) * tilesize.x,
	    height = (max_y - min_y + 1) * tilesize.y
	}


func _ready():
	pass
