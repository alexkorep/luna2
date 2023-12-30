extends Control

var is_paused = false
var time = 0

var progress = 0.0


# astroclicks persecond
var speed = 0.01 

var waves_count = 3
var current_wave = 0
var current_formation = null

onready var Player = $Player
onready var WaveLabel = $WaveLabel

var formation_scenes = [
	#preload("res://scenes/shmup_screen/enemy_formations/invaders.tscn"),
	preload("res://scenes/shmup_screen/enemy_formations/asteroids/asteroids.tscn"),
	#preload("res://scenes/shmup_screen/enemy_formations/single_ship/single_ship.tscn"),
]

func _ready():
	waves_count = int(Travel.get_travel_distance()/10_000) + 1
	$Background.get_material().set_shader_param("speed_scale", 0.1)
	current_wave = 0
	update_wave_label()

func update_wave_label():
	WaveLabel.text = "Wave " + str(current_wave + 1) + "/" + str(waves_count)

# Formation events
#
func _on_enemy_died():
	# TODO add score
	pass

func _on_wave_finished():
	if current_wave < waves_count - 1:
		current_wave += 1
		next_wave()
	else:
		# End the level
		Player.end()
	
func _process(delta):
	$HUD.progress = progress
	if is_paused == false:
		$Background.get_material().set_shader_param("time", time)
		time += delta
	if current_formation != null:
		current_formation.set_player_pos(Player.position)

func _on_Player_end_animation_finished():
	GameState.set_planet_id(Travel.travel_destination_planet_id)
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")

func _on_Player_ship_exploded():
	# TODO do we need a separate screen? Should we restart the level?
	#get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
	get_tree().reload_current_scene()

func _on_Player_player_ready():
	next_wave()

func next_wave():
	if current_formation != null:
		current_formation.queue_free()
	var formation_num = randi() % formation_scenes.size()
	current_formation = formation_scenes[formation_num].instance()
	current_formation.connect("finished", self, "_on_wave_finished")
	current_formation.connect("enemy_died", self, "_on_enemy_died")
	add_child(current_formation)
	update_wave_label()
