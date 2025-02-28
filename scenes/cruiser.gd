extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	global_position = Navigation.snap_to_tile(global_position, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
