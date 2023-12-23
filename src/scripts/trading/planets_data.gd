class_name PlayerData
extends Node

var planets = [
	{
		"Name": "Zarmina",
		"ID": "zarmina_5",
		"Description": "A lush, forest-covered planet with emerging urban centers.",
		"TechLevel": 5
	},
	{
		"Name": "Eridia",
		"ID": "eridia_3",
		"Description": "A desert world with scattered nomadic tribes and basic technology.",
		"TechLevel": 3
	},
	{
		"Name": "Thalassa",
		"ID": "thalassa_7",
		"Description": "An oceanic planet with advanced underwater cities and technology.",
		"TechLevel": 7
	},
	{
		"Name": "Nova Terra",
		"ID": "nova_terra_6",
		"Description": "A planet with a balanced ecosystem, and a focus on sustainable technology.",
		"TechLevel": 6
	},
	{
		"Name": "Orionis",
		"ID": "orionis_4",
		"Description": "A world with medieval-level technology, known for its artisans and scholars.",
		"TechLevel": 4
	},
	{
		"Name": "Cyberion",
		"ID": "cyberion_9",
		"Description": "A highly advanced cybernetic society with cutting-edge technology.",
		"TechLevel": 9
	},
	{
		"Name": "Gaia Prime",
		"ID": "gaia_prime_8",
		"Description": "A planet with a deep respect for nature, blending technology with ecology.",
		"TechLevel": 8
	},
	{
		"Name": "Avalon",
		"ID": "avalon_2",
		"Description": "A planet in its early stages of civilization, with simple agricultural communities.",
		"TechLevel": 2
	},
	{
		"Name": "Nebulon",
		"ID": "nebulon_1",
		"Description": "A primitive world, just beginning to discover basic tools and fire.",
		"TechLevel": 1
	},
	{
		"Name": "Solaris",
		"ID": "solaris_10",
		"Description": "A highly advanced utopian society with technology indistinguishable from magic.",
		"TechLevel": 10
	},
	{
		"Name": "Vulcania",
		"ID": "vulcania_6",
		"Description": "A volcanic world with resilient inhabitants who have adapted to harsh conditions.",
		"TechLevel": 6
	},
	{
		"Name": "Pandora",
		"ID": "pandora_4",
		"Description": "A mysterious planet with a rich biodiversity and an ancient, mystical culture.",
		"TechLevel": 4
	},
	{
		"Name": "Arcadia",
		"ID": "arcadia_5",
		"Description": "A pastoral paradise with a focus on harmony and artistic expression.",
		"TechLevel": 5
	},
	{
		"Name": "Meridian",
		"ID": "meridian_7",
		"Description": "A bustling trade hub with diverse cultures and advanced interstellar commerce.",
		"TechLevel": 7
	},
	{
		"Name": "Zephyria",
		"ID": "zephyria_3",
		"Description": "A windy planet with vast plains, home to nomadic tribes and wind-powered technology.",
		"TechLevel": 3
	},
	{
		"Name": "Olympus",
		"ID": "olympus_8",
		"Description": "A majestic mountainous world with a highly spiritual society and advanced philosophical thought.",
		"TechLevel": 8
	},
	{
		"Name": "Chronos",
		"ID": "chronos_9",
		"Description": "A planet where time flows differently, known for its time manipulation technology.",
		"TechLevel": 9
	},
	{
		"Name": "Eden",
		"ID": "eden_2",
		"Description": "An unspoiled world with abundant natural resources and simple, peaceful inhabitants.",
		"TechLevel": 2
	},
	{
		"Name": "Helios",
		"ID": "helios_6",
		"Description": "A sun-bathed planet with a focus on solar energy and sustainable living.",
		"TechLevel": 6
	},
	{
		"Name": "Mystara",
		"ID": "mystara_4",
		"Description": "A planet shrouded in mystery, with ancient ruins and unexplained phenomena.",
		"TechLevel": 4
	},
	{
		"Name": "Nova",
		"ID": "nova_5",
		"Description": "A newly colonized world, bustling with construction and rapid development.",
		"TechLevel": 5
	},
	{
		"Name": "Terra Nova",
		"ID": "terra_nova_7",
		"Description": "A diverse planet with a blend of natural beauty and technological innovation.",
		"TechLevel": 7
	},
	{
		"Name": "Luna",
		"ID": "luna_1",
		"Description": "A barren moon just beginning to be explored and colonized by a nearby planet.",
		"TechLevel": 1
	},
	{
		"Name": "Aether",
		"ID": "aether_10",
		"Description": "A planet with highly advanced energy manipulation and teleportation technology.",
		"TechLevel": 10
	},
	{
		"Name": "Xanadu",
		"ID": "xanadu_8",
		"Description": "A culturally rich planet known for its artistic achievements and enlightened society.",
		"TechLevel": 8
	},
	{
		"Name": "Krypton",
		"ID": "krypton_6",
		"Description": "A planet with a strong scientific community, known for its advanced materials science.",
		"TechLevel": 6
	},
	{
		"Name": "El Dorado",
		"ID": "el_dorado_3",
		"Description": "A world rich in natural resources but still in the early stages of technological development.",
		"TechLevel": 3
	},
	{
		"Name": "Atlantis",
		"ID": "atlantis_9",
		"Description": "An advanced aquatic world with incredible underwater technology and architecture.",
		"TechLevel": 9
	},
	{
		"Name": "Valhalla",
		"ID": "valhalla_2",
		"Description": "A rugged, mountainous world with a warrior culture and basic metallurgy.",
		"TechLevel": 2
	},
	{
		"Name": "Nirvana",
		"ID": "nirvana_5",
		"Description": "A serene and peaceful planet, focusing on mental and spiritual well-being.",
		"TechLevel": 5
	},
	{
		"Name": "Luna 2",
		"ID": "luna2_9",
		"Description": "A luxurious and serene planet known for its advanced healthcare, lush landscapes, and futuristic cities.",
		"TechLevel": 9
	}
]

func get_planet_by_id(id):
	for planet in planets:
		if planet["ID"] == id:
			return planet
	return null
