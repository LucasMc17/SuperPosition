extends Option

const ICON = preload('res://assets/sprites/sol_laser_option.png')

@onready var SFX = $sound_effects

func Enter():
	clear()
	var targets
	if (GameState.current_player == GameState.hero_ships):
		targets = GameState.enemy_ships
	else:
		targets = GameState.hero_ships
	var moves = []
	for unit in targets.get_children():
		moves.append({"coords": unit.current_coords, "target": unit, "cost": 1})
	clickable_groups = moves
	EventBus.show_move_options.emit(moves)

func Select(group, cell):
	print(SFX)
	clear()
	SFX.play()
	unit.has_acted = true
	group.target.handle_damage(1)
	
