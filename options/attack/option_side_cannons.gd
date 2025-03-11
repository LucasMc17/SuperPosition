extends Option

const ICON = preload('res://assets/side_cannons_option.png')

func Enter():
	clear()
	var direction_map = [0, 90, 180, 270]
	var direction_degrees = direction_map[unit.direction]
	var coords = unit.current_coords
	var right_cannons = []
	var left_cannons = []
	for coord in coords:
		var right_target_coord = coord + Vector2(1, 0).rotated(deg_to_rad(direction_degrees))
		right_cannons.append(right_target_coord)
		var left_target_coord = coord + Vector2(-1, 0).rotated(deg_to_rad(direction_degrees))
		left_cannons.append(left_target_coord)
	print(right_cannons)
	
	var moves = [{"coords": right_cannons, "cost": 1}, {"coords": left_cannons, "cost": 1}]
	
	clickable_groups = moves
	EventBus.show_move_options.emit(moves)

func Select(group, cell):
	clear()
