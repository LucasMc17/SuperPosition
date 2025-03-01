extends Node2D

@export_category ("navigation")
enum directions {UP, RIGHT, DOWN, LEFT}
@export var direction: directions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = Navigation.snap_to_tile(global_position, true)
	
	#if (direction == 'UP'): 
	var current_coords = Navigation.get_coords_from_pos(global_position)
	var available_moves = [Vector2(current_coords.x, current_coords.y - 1), Vector2(current_coords.x, current_coords.y - 2)] 
	EventBus.show_move_options.emit(available_moves)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
