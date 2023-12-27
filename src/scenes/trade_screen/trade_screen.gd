extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ProductsVBoxContainer = $NinePatchRect/MarginContainer/MainVBoxContainer/ScrollContainer/ProductsVBoxContainer
onready var FundsLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/FundsRow/FundsLabel
onready var PlanetNameLabel = $NinePatchRect/MarginContainer/MainVBoxContainer/PlanetRow/PlanetNameLabel
onready var BuySellButtons = $NinePatchRect/MarginContainer/MainVBoxContainer/BuySellButtons
var trade_item = preload('res://scenes/trade_screen/trade_item.tscn')

var selected_product_idx = 0

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
	selected_product_idx = -1
	for good in goods:
		var planet_quantity = GameState.planet_quantity[i]
		var player_quantity = GameState.player_quantity[i]
		if planet_quantity > 0 or player_quantity > 0:
			var trade_item_instance = trade_item.instance()
			trade_item_instance.product = good["Name"]
			trade_item_instance.price = int(GameState.prices[i])
			trade_item_instance.qty = planet_quantity
			trade_item_instance.hold = player_quantity
			trade_item_instance.product_idx = i
			trade_item_instance.connect("trade_item_selected", self, "_on_trade_item_selected")
			ProductsVBoxContainer.add_child(trade_item_instance)
			if selected_product_idx < 0:
				# Select it
				_on_trade_item_selected(i)
		i += 1

func update_item_quantities():
	for item in ProductsVBoxContainer.get_children():
		item.qty = GameState.planet_quantity[item.product_idx]
		item.hold = GameState.player_quantity[item.product_idx]
	BuySellButtons.max_buy_qty = GameState.get_max_buy_qty(selected_product_idx)
	BuySellButtons.max_sell_qty = GameState.get_max_sell_qty(selected_product_idx)
	FundsLabel.text = str(GameState.funds) + 'cr'
	
func _on_trade_item_selected(product_idx):
	selected_product_idx = product_idx
	for item in ProductsVBoxContainer.get_children():
		item.selected = item.product_idx == product_idx
	BuySellButtons.max_buy_qty = GameState.get_max_buy_qty(product_idx)
	BuySellButtons.max_sell_qty = GameState.get_max_sell_qty(product_idx)

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")

func _on_BuySellButtons_buy(qty):
	GameState.buy(selected_product_idx, qty)
	update_item_quantities()

func _on_BuySellButtons_sell(qty):
	GameState.sell(selected_product_idx, qty)
	update_item_quantities()
