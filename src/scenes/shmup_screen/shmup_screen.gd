extends Control

var is_paused = false
var time = 0

var progress = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.get_material().set_shader_param("speed_scale", 0.1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD.progress = progress
	if is_paused == false:
		$Background.get_material().set_shader_param("time", time)
		time += delta


func _on_Timer_timeout():
	progress += 1.0
	if progress > 100:
		$Player.end()
		$Timer.stop()
		progress = 100

func _on_Player_end_animation_finished():
	GameState.set_planet_id(GameState.destination_planet_id)
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
