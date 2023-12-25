extends Node

var travel_destination_planet_id = "zarmina_5"
# Distance in astroclicks
var travel_distance = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_travel(destination_planet_id, distance):
	travel_destination_planet_id = destination_planet_id
	travel_distance = distance
