extends Panel

signal buy(ship_id)
signal activate(ship_id)

export var ship_id :=''
export var ship_name :=''
export var travel_distance := 0
export var cargo_size := 0
export var price := 0
export var is_current = false
export var is_owned = false

func _process(delta):
	get_node("%ShipSprite").ship_id = ship_id
	get_node("%NameLabel").text = ship_name
	get_node("%CargoSizeLabel").text = str(cargo_size) + 't'
	get_node("%TravelDistanceLabel").text = str(travel_distance) + 'ly'
	get_node("%PriceLabel").text = str(price) + 'cr'
	get_node("%IsCurrentLabel").text = "Your current ship" if is_current else (
			"You own this ship" if is_owned else "")
	get_node("%BuyButton").disabled = is_current
	get_node("%BuyButton").text = "Select" if is_owned else "Buy"

func _on_BuyButton_pressed():
	if is_owned:
		emit_signal("activate", ship_id)
	else:
		emit_signal("buy", ship_id)

func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
