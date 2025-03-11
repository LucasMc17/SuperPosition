extends Node2D

@onready var hero_ships = $hero_ships
@onready var enemy_ships = $enemy_ships

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.hero_ships = hero_ships
	GameState.enemy_ships = enemy_ships
	GameState.current_player = hero_ships # for now
	GameState.init_unit_select()
	GameState.start_turn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
