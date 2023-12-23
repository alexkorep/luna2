tool
extends Node2D
# Music prompt: Calm electronic ambient music for a adventure game with the space theme

var TARGET_BOCK_ID = 5
var Planet = load("res://scenes/space/planet.tscn")

func _ready():
	$ParallaxBackground/ParallaxLayer.motion_scale = Vector2(0.9, 0.9)
	
func _process(_delta):
	if Engine.editor_hint:
		print("Editor hint")
	sync_parallax_objects()

func get_tiles_with_id(id: int) -> Array:
	var Tileset = $Tileset
	var matching_tiles = []
	for cell in Tileset.get_used_cells():
		if Tileset.get_cellv(cell) == id:
				matching_tiles.append(cell)
	return matching_tiles

func find_planet_at_position(position: Vector2):
	var Planets = $ParallaxBackground/ParallaxLayer/Planets
	for planet in Planets.get_children():
		# Use the precision
		if planet.position.is_equal_approx(position):
			return planet
	return null

func sync_parallax_objects():
	var Tileset = $Tileset
	var ParallaxLayer = $ParallaxBackground/ParallaxLayer
	var Planets = $ParallaxBackground/ParallaxLayer/Planets

	# For all children of Planets, set the dirty property to true
	for planet in Planets.get_children():
		planet.dirty = true

	# Find all tiles wit the target block ID
	var target_blocks = get_tiles_with_id(TARGET_BOCK_ID)
	# For each target block create a parallax object from the scene res://scenes/planet/planet.tscn
	# and add it to the parallax layer
	for block in target_blocks:
		# Tileset.cell_size/4 is actually /2 and adjust by parallellax scale
		var planet_position = Tileset.map_to_world(block)*ParallaxLayer.motion_scale + Tileset.cell_size/4
		var existing_planet = find_planet_at_position(planet_position)
		if existing_planet != null:
			existing_planet.dirty = false
		else:
			var planet = Planet.instance()
			planet.position = planet_position
			Planets.add_child(planet)
	
	# Remove all planets that are dirty
	for planet in Planets.get_children():
		if planet.dirty:
			planet.queue_free()
