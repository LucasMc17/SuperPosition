extends Option

const ICON = preload('res://assets/sprites/turn_option.png')

func get_direction(turning, direction):
		if turning == 'left':
			if direction == unit.directions.UP:
				return unit.directions.LEFT
			if direction == unit.directions.RIGHT:
				return unit.directions.UP
			if direction == unit.directions.DOWN:
				return unit.directions.RIGHT
			if direction == unit.directions.LEFT:
				return unit.directions.DOWN
		if turning == 'right':
			if direction == unit.directions.UP:
				return unit.directions.RIGHT
			if direction == unit.directions.RIGHT:
				return unit.directions.DOWN
			if direction == unit.directions.DOWN:
				return unit.directions.LEFT
			if direction == unit.directions.LEFT:
				return unit.directions.UP

func Enter():
	clear()
	if unit.remaining_movement_points < 3:
		return
	var direction_to_degrees = [0, 90, 180, 270, 0]
	var head_coord : Vector2 = unit.current_coords[0]
	var right_offset = Vector2(1, -1)
	var left_offset = Vector2(-1, -1)
	var right_turn = head_coord + right_offset.rotated(deg_to_rad(direction_to_degrees[unit.direction]))
	var left_turn = head_coord + left_offset.rotated(deg_to_rad(direction_to_degrees[unit.direction]))
	var moves = [{"coords": [right_turn], "cost": 3, "direction": get_direction('right', unit.direction)}, {"coords": [left_turn], "cost": 3, "direction": get_direction('left', unit.direction)}]
	
	clickable_groups = moves
	EventBus.show_move_options.emit(moves)

func Select(group, cell):
	unit.handle_move(cell, group.direction, group.cost)
	clear()
