extends Node

var current_player : Node
var current_unit : Unit
var UI_options : HBoxContainer
var hero_ships
var enemy_ships

func select_unit(unit : Unit):
	current_unit = unit
	UI_options.get_unit_options(unit)

func init_unit_select():
	if current_unit:
		current_unit.option_machine.current_option = current_unit.option_machine.initial_option
	EventBus.show_move_options.emit([])
	current_unit = null
	UI_options.get_unit_options(null)
	current_player.get_available_units()

func start_turn():
	for child in current_player.get_children():
		child.init_turn()

func reset_turn():
	for child in current_player.get_children():
		child.reset_turn()
	init_unit_select()

func end_turn():
	if current_player == hero_ships:
		current_player = enemy_ships
	elif current_player == enemy_ships:
		current_player = hero_ships
	start_turn()
	init_unit_select()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
