extends Node

func get_available_units():
	var coordinates = []
	var units = get_children().filter(func (child): if (child.available and !child.has_moved): return true)
	for unit in units:
		coordinates.append_array(unit.current_coords)
	EventBus.show_available_units.emit(coordinates)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
