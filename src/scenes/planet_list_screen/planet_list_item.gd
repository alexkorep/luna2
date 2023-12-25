extends Control

export var planet_id := ''

# Called when the node enters the scene tree for the first time.
func _ready():
	print("planet_id:", planet_id)
	var planet = PlanetsData.get_planet_by_id(planet_id)
	$HBoxContainer/PlanetNameLabel.text = planet['Name']
	$HBoxContainer/LevelLabel.text = str(planet['TechLevel'])

func _on_TravelButton_pressed():
	GameState.set_planet_id(planet_id)
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
