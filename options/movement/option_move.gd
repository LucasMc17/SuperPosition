extends Option

const ICON = preload('res://assets/sprites/move_option.png')

func Enter():
	clear()
	var head_coord : Vector2 = unit.current_coords[0]
	var moves = []
	
	for i in range(unit.remaining_movement_points):
		var to_apply = i + 1
		if (unit.direction == unit.directions.UP or unit.direction == unit.directions.OMNI):
			moves.append({ "coords": [Vector2(head_coord.x, head_coord.y - to_apply)], "cost": to_apply})
		if (unit.direction == unit.directions.RIGHT or unit.direction == unit.directions.OMNI):
			moves.append({ "coords": [Vector2(head_coord.x + to_apply, head_coord.y)], "cost": to_apply})
		if (unit.direction == unit.directions.DOWN or unit.direction == unit.directions.OMNI):
			moves.append({ "coords": [Vector2(head_coord.x, head_coord.y + to_apply)], "cost": to_apply})
		if (unit.direction == unit.directions.LEFT or unit.direction == unit.directions.OMNI):
			moves.append({ "coords": [Vector2(head_coord.x - to_apply, head_coord.y)], "cost": to_apply})
	
	#unit.available_moves = moves
	clickable_groups = moves
	
	EventBus.show_move_options.emit(moves)

func Select(group, cell):
	unit.handle_move(cell, unit.direction, group.cost)
	clear()
