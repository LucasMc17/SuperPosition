extends HBoxContainer

func get_unit_options(unit : Unit):
	for child in get_children():
		child.queue_free()
	if !unit:
		return
	for option in unit.option_machine.get_children():
		var button = TextureButton.new()
		button.texture_normal = option.ICON
		add_child(button)


# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.UI_options = self


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
