extends Node

var travel_destination_planet_id = "zarmina_5"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_travel(destination_planet_id):
	travel_destination_planet_id = destination_planet_id

func get_travel_distance():
	var start_planet_id = GameState.planet_id
	return PlanetLocations.get_distance(start_planet_id, travel_destination_planet_id)