extends Panel

signal buy(ship_id)

export var ship_id :=''
export var ship_name :=''
export var travel_distance := 0
export var cargo_size := 0
export var price := 0
export var is_current = false
export var is_owned = false

func _process(delta):
	get_node("%NameLabel").text = ship_name
	get_node("%CargoSizeLabel").text = str(cargo_size) + 't'
	get_node("%TravelDistanceLabel").text = str(travel_distance) + 'ly'
	get_node("%PriceLabel").text = str(price) + 'cr'
	get_node("%IsCurrentLabel").text = "Your current ship" if is_current else (
			"You own this ship" if is_owned else "")

func _on_BuyButton_pressed():
	emit_signal("buy", ship_id)

func _on_BackButton_pressed():
	pass # Replace with function body.
