extends Control

var is_paused = false
var time = 0

var progress = 0.0


# astroclicks persecond
var speed = 0.01 

onready var Player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	# TODO replace with particles
	$Background.get_material().set_shader_param("speed_scale", 0.1)

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
	$EnemyFormations/Invaders.set_player_pos(Player.position)

func _on_Player_end_animation_finished():
	GameState.set_planet_id(Travel.travel_destination_planet_id)
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")

func _on_Player_ship_exploded():
	# TODO do we need a separate screen? Should we restart the level?
	#get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
	get_tree().reload_current_scene()


func _on_Invaders_all_ships_killed():
	# End the level
	$Player.end()
