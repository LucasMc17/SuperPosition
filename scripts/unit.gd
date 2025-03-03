extends Node2D
class_name Unit

@export_category ("Navigation")
enum directions {UP, RIGHT, DOWN, LEFT, OMNI}
@export var direction: directions
@export_range(1, 10) var momentum_limits = 1
@export var current_momentum: int = 1
@export var size: int = 1

@export_category("Actions")
@export var available : bool = true

@onready var current_coords : Array[Vector2] = [Navigation.get_coords_from_pos(global_position)]
@onready var player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction_map = [0, 90, 180, 270, 0]
	rotation_degrees = direction_map[direction]
	global_position = Navigation.snap_to_tile(global_position, true)
	
	#get_available_moves()
	
	current_coords = get_current_coords(current_coords[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_available_moves():
	var head_coord : Vector2 = current_coords[0]
	var available_moves = []
	
	for i in range(current_momentum):
		var to_apply = i + 1
		if (direction == directions.UP or direction == directions.OMNI):
			available_moves.append(Vector2(head_coord.x, head_coord.y - to_apply))
		if (direction == directions.RIGHT or direction == directions.OMNI):
			available_moves.append(Vector2(head_coord.x + to_apply, head_coord.y))
		if (direction == directions.DOWN or direction == directions.OMNI):
			available_moves.append(Vector2(head_coord.x, head_coord.y + to_apply))
		if (direction == directions.LEFT or direction == directions.OMNI):
			available_moves.append(Vector2(head_coord.x - to_apply, head_coord.y))
	
	EventBus.show_move_options.emit(available_moves)

func get_current_coords(head_coord):
	var result: Array[Vector2] = [head_coord]
	for i in range(1, size):
		if (direction == directions.UP):
			result.append(Vector2(head_coord.x, head_coord.y + i))
		if (direction == directions.RIGHT):
			result.append(Vector2(head_coord.x - i, head_coord.y))
		if (direction == directions.DOWN):
			result.append(Vector2(head_coord.x, head_coord.y - i))
		if (direction == directions.LEFT):
			result.append(Vector2(head_coord.x + i, head_coord.y))
	return result

func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventMouseMotion:
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cell = Navigation.get_coords_from_pos(get_global_mouse_position())
		if (current_coords.has(cell) and GameState.current_player == player and GameState.current_unit == null):
			handle_select()

func handle_select():
	print('selected')
	get_available_moves()
	GameState.current_unit = self
	EventBus.show_available_units.emit([])
	
