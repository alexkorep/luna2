tool
extends Control

export var product = "Gold" setget set_product
export var unit = "ton" setget set_unit
export var buy = 21 setget set_buy
export var sell = 13 setget set_sell
export var qty = 3 setget set_qty
export var hold = 2 setget set_hold

# Called when the node enters the scene tree for the first time.
func _ready():
	update_controls()

func set_product(value):
	product = value
	update_controls()

func set_unit(value):
	unit = value
	update_controls()

func set_buy(value):
	buy = value
	update_controls()

func set_sell(value):
	sell = value
	update_controls()

func set_qty(value):
	qty = value
	update_controls()

func set_hold(value):
	hold = value
	update_controls()

func update_controls():
	$HBoxContainer/ProductLabel.text = product
	$HBoxContainer/UnitLabel.text = unit
	$HBoxContainer/SellButton.text = str(sell)
	$HBoxContainer/BuyButton.text = str(buy)
	$HBoxContainer/QtyLabel.text = str(qty)
	$HBoxContainer/HoldLabel.text = str(hold)

func _process(delta):
	update_controls()


func _on_SellButton_pressed():
	pass # Replace with function body.


func _on_BuyButton_pressed():
	pass # Replace with function body.
