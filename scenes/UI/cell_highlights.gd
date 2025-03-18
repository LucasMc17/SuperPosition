extends Node2D

const HIGHLIGHT = preload('res://assets/sprites/highlight.png')
const CELL_HIGHLIGHT = preload('res://assets/sprites/cell_highlight.png')

@onready var move_lights = $movement_highlights
@onready var unit_lights = $unit_highlights

var clickable

func _on_show_available_units(units):
	clickable = units
	for child in unit_lights.get_children():
		child.queue_free()
	
	for unit in units:
		add_highlight(Color(1.0, 0.5, 0.0, 1), Navigation.get_pos_from_coords(unit), unit_lights, CELL_HIGHLIGHT)

func _on_show_move_options(options: Array):
	for child in move_lights.get_children():
		child.queue_free()
	
	for group in options:
		for option in group.coords:
			add_highlight(Color(1.0, 0.5, 0.0, 1), Navigation.get_pos_from_coords(option), move_lights, HIGHLIGHT)

func _ready():
	EventBus.show_move_options.connect(_on_show_move_options)
	EventBus.show_turn_options.connect(_on_show_turn_options)
	EventBus.show_available_units.connect(_on_show_available_units)
	EventBus.clear_highlights.connect(_on_clear_highlight)

func _process(delta):
	pass

func _on_show_turn_options():
	pass

func _on_clear_highlight():
	for child in move_lights.get_children():
		child.queue_free()
	
	for child in unit_lights.get_children():
		child.queue_free()

func add_highlight(color: Color, pos: Vector2, parent: Node, tex: Texture) -> void:
	var s = Sprite2D.new()
	s.texture = tex
	parent.add_child(s)
	s.centered = false
	s.global_position = pos
	s.modulate = color
