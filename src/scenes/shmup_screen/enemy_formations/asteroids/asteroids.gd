extends Control

var asteroid_count := 20

signal finished
signal enemy_died

var asteroid_instance := preload("res://scenes/shmup_screen/enemy_formations/asteroids/asteroid.tscn")
var is_finished = false

func _ready():
	var screen_size = get_viewport().size
	for _i in range(asteroid_count):
		var asteroid := asteroid_instance.instance()
		asteroid.position = Vector2(
			rand_range(rect_position.x, rect_position.x + rect_size.x), 
			rand_range(rect_position.y - rect_size.y, rect_position.y)
			)
		asteroid.speed = rand_range(50, 100)
		# subscribe to asteroid_killed
		# warning-ignore:return_value_discarded
		asteroid.connect("asteroid_killed", self, "on_asteroid_killed")
		add_child(asteroid)

func _process(_delta):
	if get_child_count() == 0 and not is_finished:
		emit_signal("finished")
		is_finished = true

func set_player_pos(_pos):
	# We don't care, we are stones
	pass

func on_asteroid_killed():
	emit_signal("enemy_died")

func set_wave(idx):
	asteroid_count = 20 + idx * 10
