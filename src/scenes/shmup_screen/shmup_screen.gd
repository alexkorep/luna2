extends Control

var is_paused = false
var time = 0

var progress = 0.0

var enemy = preload("res://scenes/shmup_screen/enemy/enemy_ship.tscn")

# astroclicks persecond
var speed = 0.01 

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.get_material().set_shader_param("speed_scale", 0.1)
	spawn_enemies()

func spawn_enemies():
	for x in range(9):
		for y in range(3):
			var e = enemy.instance()
			var pos = Vector2(x * (16 + 8) + 24, 16 * 4 + y * 16)
			add_child(e)
			e.start(pos)
			e.anchor = $EnemyAnchor
			# subscribe died event
			e.connect("died", self, "_on_enemy_died")
			
func _on_enemy_died(value):
	pass
	#score += value
	#$CanvasLayer/UI.update_score(score)
	#$Camera2D.add_trauma(0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD.progress = progress
	if is_paused == false:
		$Background.get_material().set_shader_param("time", time)
		time += delta

func _on_Timer_timeout():
	var distance = Travel.travel_distance
	var seconds = distance / speed
	var percents_per_second = 100.0 / seconds 
	progress += percents_per_second
	if progress > 100:
		$Player.end()
		$Timer.stop()
		progress = 100

func _on_Player_end_animation_finished():
	GameState.set_planet_id(Travel.travel_destination_planet_id)
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
