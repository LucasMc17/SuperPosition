extends Node2D

@onready var hero_ships = $HeroShips
@onready var enemy_ships = $EnemyShips

# Called when the node enters the scene tree for the first time.
func _ready():
	GameState.current_player = hero_ships # for now
	GameState.init_unit_select()
	GameState.start_turn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
