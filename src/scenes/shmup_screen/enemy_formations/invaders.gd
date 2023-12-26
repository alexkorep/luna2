extends Node2D


var ships_spawned := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var ships = $Ships.get_children()
	for ship in ships:
		ship.hide()

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
