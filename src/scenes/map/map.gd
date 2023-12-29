extends Node2D

var dragging = false
var drag_start = Vector2()

onready var Camera2D = $Camera2D
onready var Sprite = $Sprite
onready var Planets = $Planets

var planet_positions = []

var planet_scene = preload("res://scenes/map/planet.tscn")

func _ready():
	generate_planet_positions()
	add_planets()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_start = event.position
			else:
				dragging = false
	elif event is InputEventMouseMotion:
			if dragging:
				var drag_current = event.position
				var drag_delta = drag_start - drag_current
				drag_start = drag_current
				Camera2D.global_position += drag_delta
				Camera2D.global_position.x = clamp(Camera2D.global_position.x, 
					Sprite.position.x, Sprite.position.x + Sprite.texture.get_width())
				Camera2D.global_position.y = clamp(Camera2D.global_position.y, 
					Sprite.position.y, Sprite.position.y + Sprite.texture.get_height())

func generate_planet_positions():
	for planet in PlanetsData.planets:
		var planet_position = Vector2()
		planet_position.x = rand_range(Sprite.position.x, Sprite.position.x + Sprite.texture.get_width())
		planet_position.y = rand_range(Sprite.position.y, Sprite.position.y + Sprite.texture.get_height())
		planet_positions.append(planet_position)

func add_planets():
	var idx = 0
	for planet in PlanetsData.planets:
		var planet_instance = planet_scene.instance()
		var pos = planet_positions[idx]
		print(pos)
		planet_instance.position = pos
		Planets.add_child(planet_instance)
		idx += 1
