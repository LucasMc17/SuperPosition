extends Node2D

@onready var exit_button = $exit_button
@onready var undo_button = $undo_button
@onready var confirm_button = $confirm_button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_button_pressed():
	GameState.init_unit_select()

func _on_undo_button_pressed():
	GameState.reset_turn()


func _on_confirm_button_pressed():
	GameState.end_turn()
