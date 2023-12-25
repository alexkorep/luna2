extends Control


var progress = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$HUD.progress = progress

func _on_Timer_timeout():
	progress += 1.0
	if progress > 100:
		$Player.end()
		$Timer.stop()
		progress = 100

func _on_Player_end_animation_finished():
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
