extends Node

var chosen : Node
var options : Dictionary = {}
var current_option : Option

@export var initial_option : Option


# Called when the node enters the scene tree for the first time.
func _ready():
	var unit = get_parent()
	for child in get_children():
		if child is Option:
			child.unit = unit
			options[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transition)
	
	if initial_option:
		current_option = initial_option

func on_child_transition(option, new_option_name):
	if option != current_option:
		return
	
	var new_option = options.get(new_option_name.to_lower())
	if !new_option:
		return
	
	if current_option:
		current_option.Exit()
	
	new_option.Enter()
	
	current_option = new_option
