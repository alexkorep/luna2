extends Node2D

export var asteroid_count := 20

signal finished
signal enemy_died

var asteroid_instance := preload("res://scenes/shmup_screen/enemy_formations/asteroids/Asteroid.tscn")

func _ready():
	for _i in range(asteroid_count):
		var asteroid := asteroid_instance.instance()
		asteroid.position = Vector2(
			rand_range(0, get_viewport().size.x - 0), 
			rand_range(-get_viewport().size.y, 0))
		asteroid.speed = rand_range(50, 100)
		add_child(asteroid)

func _process(_delta):
	if get_child_count() == 0:
		emit_signal("finished")

func set_player_pos(_pos):
	# We don't care, we are stones
	pass
