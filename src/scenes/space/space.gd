tool
extends Node2D
# Music prompt: Calm electronic ambient music for a adventure game with the space theme

# Planet tile generation area, in the tile coordinates
var GENERATION_RADIUS = 20
# Tile ID of the target block for visiting the planet
var TARGET_BOCK_ID = 5
var Planet = preload("res://scenes/space/planet.tscn")

onready var Spaceship = $Spaceship
onready var Tileset = $Tileset
onready var Planets = $ParallaxBackground/ParallaxLayer/Planets
onready var ParallaxLayer = $ParallaxBackground/ParallaxLayer

func _ready():
	_generate_random_map(GameState.map_generation_seed)
	if not Engine.editor_hint:
		adjust_parallax_scale(Vector2(0.5, 0.5))
		# Find the planet position
		move_player_to_planet(GameState.planet_id)
	
func _process(_delta):
	if Engine.editor_hint:
		sync_parallax_objects()
	else:
		var near_planet = find_planet_to_teleport_to()
		if near_planet != null:
			var planet_id_str = near_planet.planet_id
			GameState.set_planet_id(planet_id_str)
			Spaceship.teleport_to_the_planet()

func adjust_parallax_scale(new_scale: Vector2):
	var Planets = $ParallaxBackground/ParallaxLayer/Planets
	var ParallaxLayer = $ParallaxBackground/ParallaxLayer
	var old_scale = ParallaxLayer.motion_scale
	for planet in Planets.get_children():
		planet.position = planet.position*new_scale/old_scale
	ParallaxLayer.motion_scale = new_scale

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
		var planet_position = Tileset.map_to_world(block)*ParallaxLayer.motion_scale + Tileset.cell_size/2
		var existing_planet = find_planet_at_position(planet_position)
		if existing_planet != null:
			existing_planet.dirty = false
		else:
			var planet = Planet.instance()
			planet.position = planet_position
			planet.teleport_position = planet_position
			# planet.durty = false
			Planets.add_child(planet)
			planet.set_owner(get_tree().edited_scene_root)
	
	# Remove all planets that are dirty
	for planet in Planets.get_children():
		if planet.dirty:
			planet.queue_free()

func find_planet_to_teleport_to():
	var Planets = $ParallaxBackground/ParallaxLayer/Planets
	var range_to_teleport = 64
	for planet in Planets.get_children():
		var distance = Spaceship.position.distance_to(planet.teleport_position)
		if distance < range_to_teleport:
			return planet
	return null

func move_player_to_planet(planet_id_str):
	var Planets = $ParallaxBackground/ParallaxLayer/Planets
	for planet in Planets.get_children():
		if planet.planet_id == planet_id_str:
			Spaceship.position = planet.teleport_position + Vector2(0, -64)

func _on_Spaceship_ship_submerged():
	# TODO Save the planet to the global state
	get_tree().change_scene("res://scenes/trade_screen/trade_screen.tscn")

func _generate_random_map(seed_value: int):
	if Engine.editor_hint:
		# Do it only run time
		return

	var rng = RandomNumberGenerator.new()
	rng.seed = seed_value

	for planet_data in PlanetsData.planets:
		var planet_id = planet_data["ID"]
		print(planet_id)
		var tile_position = Vector2(
			rng.randi_range(-GENERATION_RADIUS, GENERATION_RADIUS), 
			rng.randi_range(-GENERATION_RADIUS, GENERATION_RADIUS))
		print(tile_position)
		# Set tile at this position to TARGET_BOCK_ID
		Tileset.set_cellv(tile_position, TARGET_BOCK_ID)
		_add_planet_at_tile_position(tile_position, planet_id)

func _add_planet_at_tile_position(tile_position, planet_id):
	var planet_position = Tileset.map_to_world(tile_position)*ParallaxLayer.motion_scale + Tileset.cell_size/2
	var planet = Planet.instance()
	planet.position = planet_position
	planet.teleport_position = planet_position
	planet.planet_id = planet_id
	var planet_texture = load("res://assets/planets/" + planet_id + ".png")
	planet.planet_texture = planet_texture
	Planets.add_child(planet)
