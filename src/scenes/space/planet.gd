tool
extends Node2D

enum PlanetIDs {
	nebulon_1,
	luna_1,
	avalon_2,
	eden_2,
	valhalla_2,
	el_dorado_3,
	eridia_3,
	zephyria_3,
	orionis_4,
	pandora_4,
	mystara_4,
	arcadia_5,
	nova_5,
	nirvana_5,
	zarmina_5,
	helios_6,
	krypton_6,
	nova_terra_6,
	vulcania_6,
	meridian_7,
	terra_nova_7,
	thalassa_7,
	gaia_prime_8,
	olympus_8,
	xanadu_8,
	atlantis_9,
	chronos_9,
	cyberion_9,
	luna2_9,
	aether_10,
	solaris_10
}

const planetNames = [
	'nebulon_1',
	'luna_1',
	'avalon_2',
	'eden_2',
	'valhalla_2',
	'el_dorado_3',
	'eridia_3',
	'zephyria_3',
	'orionis_4',
	'pandora_4',
	'mystara_4',
	'arcadia_5',
	'nova_5',
	'nirvana_5',
	'zarmina_5',
	'helios_6',
	'krypton_6',
	'nova_terra_6',
	'vulcania_6',
	'meridian_7',
	'terra_nova_7',
	'thalassa_7',
	'gaia_prime_8',
	'olympus_8',
	'xanadu_8',
	'atlantis_9',
	'chronos_9',
	'cyberion_9',
	'luna2_9',
	'aether_10',
	'solaris_10'
];


# Used internaly to sync the grid and the objects
export var dirty := false
export var teleport_position := Vector2(0, 0)
export (PlanetIDs) var planet_id := PlanetIDs.nebulon_1
export (Texture) var planet_texture setget set_texture

func planet_id_to_string(id):
	return planetNames[id]

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlanetTexture.texture = planet_texture

func set_texture(texture):
	planet_texture = texture
	if not $PlanetTexture:
		return
	$PlanetTexture.texture = texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Engine.editor_hint:
		update_label()

func update_label():
	var id_str = planetNames[planet_id]
	var planet = PlanetsData.get_planet_by_id(id_str)
	$NameLabel.text = planet["Name"]
