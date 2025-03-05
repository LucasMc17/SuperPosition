extends Node

var chosen : Node
var options : Array[Node]


# Called when the node enters the scene tree for the first time.
func _ready():
	var unit = get_parent()
	var index = 0
	for child in get_children():
		child.index = index
		child.unit = unit
		options.append(child)
		index += 1
	if options.size():
		chosen = options[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
