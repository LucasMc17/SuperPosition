extends Node2D
class_name Unit

@export_category ("Navigation")
enum directions {UP, RIGHT, DOWN, LEFT, OMNI}
@export var direction: directions
@export_range(1, 10) var momentum_limits = 1
@export var current_momentum: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction_map = [0, 90, 180, 270, 0]
	rotation_degrees = direction_map[direction]
	global_position = Navigation.snap_to_tile(global_position, true)
	
	get_available_moves()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_available_moves():
	var current_coords = Navigation.get_coords_from_pos(global_position)
	var available_moves = []
	
	for i in range(current_momentum):
		var to_apply = i + 1
		if (direction == directions.UP or direction == directions.OMNI):
			available_moves.append(Vector2(current_coords.x, current_coords.y - to_apply))
		if (direction == directions.RIGHT or direction == directions.OMNI):
			available_moves.append(Vector2(current_coords.x + to_apply, current_coords.y))
		if (direction == directions.DOWN or direction == directions.OMNI):
			available_moves.append(Vector2(current_coords.x, current_coords.y + to_apply))
		if (direction == directions.LEFT or direction == directions.OMNI):
			available_moves.append(Vector2(current_coords.x - to_apply, current_coords.y))
	
	EventBus.show_move_options.emit(available_moves)
	
	# still to here: incorporate momentum in move distance and block movement if obstacle detected
	
	#if (direction == directions.OMNI):
		#var available_moves = [Vector2(current_coords.x, current_coords.y - 1), Vector2(current_coords.x, current_coords.y + 1), Vector2(current_coords.x + 1, current_coords.y), Vector2(current_coords.x - 1, current_coords.y)]
		#EventBus.show_move_options.emit(available_moves)
	#elif (direction == directions.UP): 
		#var available_moves = [Vector2(current_coords.x, current_coords.y - 1), Vector2(current_coords.x, current_coords.y - 2)] 
		#EventBus.show_move_options.emit(available_moves)
	#elif (direction == directions.RIGHT): 
		#var available_moves = [Vector2(current_coords.x + 1, current_coords.y), Vector2(current_coords.x + 2, current_coords.y)]
		#EventBus.show_move_options.emit(available_moves)
	#elif (direction == directions.DOWN): 
		#var available_moves = [Vector2(current_coords.x, current_coords.y + 1), Vector2(current_coords.x, current_coords.y + 2)] 
		#EventBus.show_move_options.emit(available_moves)
	#elif (direction == directions.LEFT): 
		#var available_moves = [Vector2(current_coords.x - 1, current_coords.y), Vector2(current_coords.x - 2, current_coords.y)]
		#EventBus.show_move_options.emit(available_moves)
