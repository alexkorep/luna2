extends Control

var ship_item = preload("res://scenes/upgrade_ship/ship_item.tscn")
onready var ShipItemsGridContainer = get_node("%ShipItemsGridContainer")
var selected_ship_id = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	for item in ShipItemsGridContainer.get_children():
		item.queue_free()

	for ship_model in ShipModels.ship_models:
		var ship_item_instance = ship_item.instance()
		ship_item_instance.ship_name = ship_model["name"]
		ship_item_instance.ship_id = ship_model["id"]
		ship_item_instance.connect("ship_selected", self, "_on_ship_selected")
		ShipItemsGridContainer.add_child(ship_item_instance)
		
	_on_ship_selected(GameState.current_ship_id)

func update_selected_item():
	for item in ShipItemsGridContainer.get_children():
		item.is_selected = selected_ship_id == item.ship_id

func _on_ship_selected(ship_id):
	var details = get_node("%UpgradeShipDetails")
	var ship = ShipModels.get_ship_by_id(ship_id)
	details.ship_id = ship_id
	details.ship_name = ship["name"]
	details.travel_distance = ship["travel_distance"]
	details.cargo_size = ship["cargo_size"]
	details.price = ship["price"]
	details.is_current = ship_id == GameState.current_ship_id
	selected_ship_id = ship_id
	update_selected_item()

func _on_UpgradeShipDetails_buy(ship_id):
	GameState.buy_ship(ship_id)
