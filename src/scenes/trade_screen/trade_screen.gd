extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ProductsVBoxContainer = $NinePatchRect/MarginContainer/MainVBoxContainer/ScrollContainer/ProductsVBoxContainer
onready var FundsLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/FundsRow/FundsLabel
onready var PlanetNameLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/PlanetRow/PlanetNameLabel
var trade_item = preload('res://scenes/trade_screen/trade_item.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_goods()

func fill_goods():
	FundsLabel.text = str(GameState.funds) + 'cr'
	var planet = GameState.get_current_planet()
	PlanetNameLabel.text = planet["Name"] + " (level " + str(planet["TechLevel"]) +")"
	
	# clear ProductsVBoxContainer children
	for child in ProductsVBoxContainer.get_children():
		child.queue_free()
	
	# fill ProductsVBoxContainer with goods
	var goods = GoodsData.goods
	var i = 0
	for good in goods:
		var planet_quantity = GameState.planet_quantity[i]
		var player_quantity = GameState.player_quantity[i]
		print(i, ':', player_quantity)
		if planet_quantity > 0 or player_quantity > 0:
			var trade_item_instance = trade_item.instance()
			trade_item_instance.product = good["Name"]
			trade_item_instance.price = int(GameState.prices[i])
			trade_item_instance.qty = planet_quantity
			trade_item_instance.hold = player_quantity
			trade_item_instance.product_idx = i
			trade_item_instance.connect("trade_item_buy", self, "_on_trade_item_buy")
			trade_item_instance.connect("trade_item_sell", self, "_on_trade_item_sell")
			ProductsVBoxContainer.add_child(trade_item_instance)
		i += 1

func _on_trade_item_buy(product_idx):
	GameState.buy(product_idx)
	fill_goods()

func _on_trade_item_sell(product_idx):
	GameState.sell(product_idx)
	fill_goods()

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
