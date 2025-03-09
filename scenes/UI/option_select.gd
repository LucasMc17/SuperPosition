extends HBoxContainer

const SELECTED_THEME = preload("res://themes/selected.tres")


func get_unit_options(unit : Unit):
	print(SELECTED_THEME)
	for child in get_children():
		child.queue_free()
	if !unit:
		return
	for option in unit.option_machine.get_children():
		var transition_option = func ():
			GameState.current_unit.option_machine.current_option.Transitioned.emit(GameState.current_unit.option_machine.current_option, option.name)
		var button = TextureButton.new()
		button.texture_normal = option.ICON
		button.theme = SELECTED_THEME
		button.pressed.connect(transition_option)
		add_child(button)


# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.UI_options = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
