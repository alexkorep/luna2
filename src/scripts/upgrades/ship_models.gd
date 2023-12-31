extends Node

var ship_models = [
  {
	  "name": "XQ5",
	  "id": "xq5",
	  "travel_distance": 20000,
	  "cargo_size": 4,
	  "price": 2000,
	  "gun_rps": 1
  },
  {
	  "name": "Nebula2",
	  "id": "nebula2",
	  "travel_distance": 25000,
	  "cargo_size": 8,
	  "price": 10000,
	  "gun_rps": 2
  },
  {
	  "name": "RZ9Titan",
	  "id": "rz9titan",
	  "travel_distance": 31000,
	  "cargo_size": 16,
	  "price": 50000,
	  "gun_rps": 4
  },
  {
	  "name": "T7X",
	  "id": "t7x",
	  "travel_distance": 39000,
	  "cargo_size": 32,
	  "price": 100000,
	  "gun_rps": 8
  },
  {
	  "name": "U4PQ8",
	  "id": "u4pq8",
	  "travel_distance": 49000,
	  "cargo_size": 64,
	  "price": 250000,
	  "gun_rps": 8
  },
  {
	  "name": "VX3",
	  "id": "vx3",
	  "travel_distance": 61000,
	  "cargo_size": 128,
	  "price": 500000,
	  "gun_rps": 8
  },
  {
	  "name": "FJ6",
	  "id": "fj6",
	  "travel_distance": 76000,
	  "cargo_size": 256,
	  "price": 1000000,
	  "gun_rps": 8
  },
  {
	  "name": "DQZ1",
	  "id": "dqz1",
	  "travel_distance": 95000,
	  "cargo_size": 512,
	  "price": 2500000,
	  "gun_rps": 8
  },
  {
	  "name": "WP45",
	  "id": "wp45",
	  "travel_distance": 118000,
	  "cargo_size": 1000,
	  "price": 5000000,
	  "gun_rps": 8
  }
]

func get_ship_by_id(id):
	for ship in ship_models:
		if ship["id"] == id:
			return ship
	return null
