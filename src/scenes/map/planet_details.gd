extends Panel


export var planet_id := '' setget set_planet_id
export var current_planet_id := ''

onready var PlanetImageTextureRect = $HBoxContainer/PlanetImageTextureRect
onready var PlanetNameLabel = $HBoxContainer/Panel/CenterContainer/VBoxContainer/PlanetNameLabel
onready var LevelLabel = $HBoxContainer/Panel/CenterContainer/VBoxContainer/LevelLabel
onready var DescriptionLabel = $HBoxContainer/DescriptionContainer/MarginContainer/DescriptionLabel
onready var DistancesLabel = $HBoxContainer/Panel/CenterContainer/VBoxContainer/DistancesLabel
onready var TravelButton = $HBoxContainer/Panel/CenterContainer/VBoxContainer/TravelButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_planet_id(id):
	planet_id = id
	var planet = PlanetsData.get_planet_by_id(id)
	PlanetImageTextureRect.texture = load('res://assets/planets/' + id + '.png')
	PlanetNameLabel.text = planet["Name"]
	LevelLabel.text = 'Level ' + str(planet["TechLevel"])
	DescriptionLabel.text = planet["Description"]

	var current_planet_selected = current_planet_id == id
	if current_planet_selected:
		DistancesLabel.text = 'You are here'
	else:
		var distance = PlanetLocations.get_distance(current_planet_id, planet_id)
		DistancesLabel.text = str(distance) + ' ly'
	TravelButton.disabled = current_planet_selected or not GameState.can_travel(current_planet_id, planet_id)

func _on_Button_pressed():
	Travel.start_travel(planet_id)
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/shmup_screen/shmup_screen.tscn")
