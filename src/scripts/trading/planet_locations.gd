extends Node

var planet_locations = []

# The size of the galaxy in light years
var galaxy_size = 100_000

func _ready():
  generate_planet_positions()

func generate_planet_positions():
	var rng = RandomNumberGenerator.new()
	rng.seed = GameState.map_generation_seed

	# Make random positions for each planet
	for planet in PlanetsData.planets:
		planet["Position"] = Vector2(rng.randi_range(0, galaxy_size), rng.randi_range(0, galaxy_size))

func get_distance(planet_id1, planet_id2):

	var planet1 = PlanetsData.get_planet_by_id(planet_id1)
	var planet2 = PlanetsData.get_planet_by_id(planet_id2)
	return int(planet1["Position"].distance_to(planet2["Position"]))
