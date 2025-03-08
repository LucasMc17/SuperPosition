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
@onready var sprite = $Sprite
@onready var option_machine = $option_machine

var available_moves = []
var has_moved = false
var has_acted = false
var remaining_movement_points = current_momentum
var original_coords : Vector2
var original_direction : directions

# Called when the node enters the scene tree for the first time.
func _ready():
	var direction_map = [0, 90, 180, 270, 0]
	rotation_degrees = direction_map[direction]
	global_position = Navigation.snap_to_tile(global_position, true)
	#sprite.scale.y = size
	
	#get_available_moves()
	
	current_coords = get_current_coords(current_coords[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	
	if GameState.current_player == player and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cell = Navigation.get_coords_from_pos(get_global_mouse_position())
		if GameState.current_unit == null and current_coords.has(cell):
			handle_select()

func handle_select():
	GameState.current_unit = self
	option_machine.current_option.Enter()

func handle_move(cell, direction_to_face, cost):
	global_position = Navigation.snap_to_tile(Navigation.get_pos_from_coords(cell), true)
	direction = direction_to_face
	current_coords = get_current_coords(cell)
	has_moved = true
	remaining_movement_points -= cost
	#if has_moved: # and has_acted to go here later
		#GameState.init_unit_select()

func init_turn():
	original_coords = current_coords[0]
	original_direction = direction
	has_moved = false
	has_acted = false
	remaining_movement_points = current_momentum

func reset_turn():
	direction = original_direction
	current_coords = get_current_coords(original_coords)
	global_position = Navigation.snap_to_tile(Navigation.get_pos_from_coords(original_coords), true)
	has_moved = false
	has_acted = false
	remaining_movement_points = current_momentum


