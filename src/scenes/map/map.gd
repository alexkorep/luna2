extends Control

var dragging = false
var drag_start = Vector2()

onready var Camera2D = $Camera2D
onready var GalaxySprite = $GalaxySprite
onready var Planets = $Planets

var position_rect = Vector2(360, 720)

var planet_positions = []

var planet_scene = preload("res://scenes/map/planet.tscn")

func _ready():
	generate_planet_positions()
	add_planets()

func generate_planet_positions():
	for planet in PlanetsData.planets:
		var planet_position = Vector2()
		planet_position.x = rand_range(0, position_rect.x)
		planet_position.y = rand_range(0, position_rect.y)
		planet_positions.append(planet_position)

func add_planets():
	var idx = 0
	for planet in PlanetsData.planets:
		var planet_instance = planet_scene.instance()
		var pos = planet_positions[idx]
		planet_instance.position = pos
		Planets.add_child(planet_instance)
		idx += 1
