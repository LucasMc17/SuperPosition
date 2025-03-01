extends Node

const TILE_SIZE : int = 64

func snap_to_tile(position: Vector2, center: bool = true):
	var snapped = floor(position / TILE_SIZE) * TILE_SIZE
	
	if center:
		snapped += Vector2.ONE * 0.5 * TILE_SIZE
	
	return snapped

func get_coords_from_pos(position: Vector2):
	return floor(position / TILE_SIZE)

func get_pos_from_coords(coords: Vector2):
	return coords * TILE_SIZE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
