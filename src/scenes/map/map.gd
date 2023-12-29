extends Control

var dragging = false
var drag_start = Vector2()

onready var GalaxySprite = $VBoxContainer/MapWithPlanets/GalaxySprite
onready var Planets = $VBoxContainer/MapWithPlanets/Planets
onready var PlanetDetails = $VBoxContainer/PlanetDetails

var planet_scene = preload("res://scenes/map/planet.tscn")

func _ready():
	add_planets()
	PlanetDetails.current_planet_id = GameState.planet_id
	set_selected_planet(GameState.planet_id)

func planet_position_to_screen(pos):
	var position_rect = GalaxySprite.get_global_rect()
	var planet_position = pos/PlanetLocations.galaxy_size
	return position_rect.position + planet_position * position_rect.size

func add_planets():
	var idx = 0
	for planet in PlanetsData.planets:
		var planet_instance = planet_scene.instance()
		planet_instance.position = planet_position_to_screen(planet["Position"])
		planet_instance.planet_id = planet["ID"]
		planet_instance.connect("planet_clicked", self, "planet_clicked")
		Planets.add_child(planet_instance)
		idx += 1

func set_selected_planet(planet_id):
	for planet in Planets.get_children():
		planet.set_selected(planet.planet_id == planet_id)
	PlanetDetails.planet_id = planet_id

func planet_clicked(planet_id):
	print("Planet clicked: " + str(planet_id))
	set_selected_planet(planet_id)

