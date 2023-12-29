extends Node

var WIN_FUNDS = 10_000_000

var funds := 0
var planet_id: String = ""

var price_vadiance = 0.05

# TODO add an option to choose the seed or change it
# Make new seed for a new game
var map_generation_seed = 283777479

# array of prices for each good
var prices = []
# Stock on the planet and player
var planet_quantity = []
var player_quantity = []

var savegame_filename = "user://savegame.save"

func _ready():
	if load_game():
		print("Loaded game")
		return
	new_game()

func new_game():
	print("New game")
	funds = 2000
	prices = []
	planet_quantity = []
	player_quantity = []
	for i in range(0, GoodsData.goods.size()):
		prices.append(0)
		planet_quantity.append(0)
		player_quantity.append(0)
		
	planet_id = '' # In order to trigger price generation
	set_planet_id('nebulon_1')

func set_planet_id(id: String):
	if id == planet_id:
		return
	planet_id = id
	generate_prices()
	save_game()

func generate_prices():
	# Prices are based on the planet's technological level
	var goods = GoodsData.goods
	var planet = PlanetsData.get_planet_by_id(planet_id)
	var tech_level = planet["TechLevel"]
	var i = 0
	for good in goods:
		var base_prices = good["BasePricePerTechLevel"]
		var base_price = base_prices[tech_level - 1]
		var min_tech_level = good["MinTechLevel"]

		var variance = base_price*price_vadiance
		var price = base_price + rand_range(-variance, variance)
		prices[i] = int(price)
		var qty = rand_range(1, 10*tech_level) if tech_level >= min_tech_level else 0.0
		planet_quantity[i] = int(qty)
		i += 1

func buy(product_idx: int, quantity: int = 1):
	var price = prices[product_idx]
	if funds >= price and planet_quantity[product_idx] >= quantity:
		funds -= price*quantity
		planet_quantity[product_idx] -= quantity
		player_quantity[product_idx] += quantity
		save_game()

func sell(product_idx: int, quantity: int = 1):
	var price = prices[product_idx]
	if player_quantity[product_idx] >= quantity:
		funds += price*quantity
		planet_quantity[product_idx] += quantity
		player_quantity[product_idx] -= quantity
		save_game()

func get_max_buy_qty(product_idx: int):
	var price = prices[product_idx]
	var max_buy = int(funds/price)
	# TODO take the cargo ship size into account
	return min(max_buy, planet_quantity[product_idx])

func get_max_sell_qty(product_idx: int):
	return player_quantity[product_idx]

func check_can_retire():
	return funds >= WIN_FUNDS

func get_current_planet():
	return PlanetsData.get_planet_by_id(planet_id)
	
# Save the state of the game
func save_game():
	var save_dict = {
			"funds": funds,
			"planet_id": planet_id,
			"prices": prices,
			"planet_quantity": planet_quantity,
			"player_quantity": player_quantity
	}
	var save_file = File.new()
	save_file.open(savegame_filename, File.WRITE)
	save_file.store_var(save_dict)
	save_file.close()

# Load the state of the game
func load_game():
	var save_file = File.new()
	if not save_file.file_exists(savegame_filename):
		return false

	save_file.open(savegame_filename, File.READ)
	var save_dict = save_file.get_var()

	funds = save_dict["funds"]
	planet_id = save_dict["planet_id"]
	prices = save_dict["prices"]
	planet_quantity = save_dict["planet_quantity"]
	player_quantity = save_dict["player_quantity"]

	save_file.close()

	var good_count = len(GoodsData.goods)
	if (planet_id == "" or 
		len(prices) != good_count or 
		len(planet_quantity) != good_count or 
		len(player_quantity) != good_count):
		return false
	return true
