extends Node2D

signal finished

var ships_spawned := 0
var end_signal_emitted := false

# Called when the node enters the scene tree for the first time.
func _ready():
	var ships = $Ships.get_children()
	for ship in ships:
		ship.connect("died", self, "on_enemy_died")
		ship.hide()
	$SpawnTimer.start()

func _process(delta):
	# Check if all enemies are gone
	var count = len($Ships.get_children())
	if count == 0 and !end_signal_emitted:
		emit_signal("finished")
		end_signal_emitted = true

func on_enemy_died():
	# TODO update counter or something
	pass
	
func set_player_pos(pos):
	var ships = $Ships.get_children()
	for ship in ships:
		ship.target_position = pos

func _on_SpawnTimer_timeout():
	var ships = $Ships.get_children()
	if ships_spawned >= len(ships):
		return
	var spawn_position = $SpawnPoint.position
	var ship = ships[ships_spawned]
	ship.start(spawn_position)
	ships_spawned += 1
