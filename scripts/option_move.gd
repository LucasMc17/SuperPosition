extends Option


func Enter():
	default()
	var head_coord : Vector2 = unit.current_coords[0]
	var moves = []
	
	for i in range(unit.current_momentum):
		var to_apply = i + 1
		if (unit.direction == unit.directions.UP or unit.direction == unit.directions.OMNI):
			moves.append(Vector2(head_coord.x, head_coord.y - to_apply))
		if (unit.direction == unit.directions.RIGHT or unit.direction == unit.directions.OMNI):
			moves.append(Vector2(head_coord.x + to_apply, head_coord.y))
		if (unit.direction == unit.directions.DOWN or unit.direction == unit.directions.OMNI):
			moves.append(Vector2(head_coord.x, head_coord.y + to_apply))
		if (unit.direction == unit.directions.LEFT or unit.direction == unit.directions.OMNI):
			moves.append(Vector2(head_coord.x - to_apply, head_coord.y))
	
	#unit.available_moves = moves
	
	EventBus.show_move_options.emit(moves)
