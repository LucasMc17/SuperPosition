extends Node2D
class_name Option

signal Transitioned

var unit : Unit

var clickable_groups = []

func Enter():
	clear()

func Exit():
	pass

func Select(group, cell):
	pass

func clear():
	EventBus.clear_highlights.emit()

func _unhandled_input(event):
	if GameState.current_unit == unit and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var cell = Navigation.get_coords_from_pos(get_global_mouse_position())
		for group in clickable_groups:
			if group.coords.has(cell):
				Select(group, cell)
				return
