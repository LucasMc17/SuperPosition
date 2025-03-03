extends Node2D

@onready var hero_ships = $HeroShips
@onready var enemy_ships = $EnemyShips
#var selected_unit : Unit

#func _on_select_unit(unit):
	#selected_unit = unit
	#unit.handle_select

func get_available_units(group: Node):
	var coordinates = []
	var units = group.get_children().filter(func (child): if (child.available): return true)
	for unit in units:
		coordinates.append_array(unit.current_coords)
	EventBus.show_available_units.emit(coordinates)

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.current_player = hero_ships # for now
	#EventBus.select_unit.connect(_on_select_unit)
	get_available_units(GameState.current_player)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
