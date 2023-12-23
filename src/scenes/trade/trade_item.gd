tool
extends Control

export var product = "Gold"
export var unit = "ton"
export var buy = 21
export var sell = 13
export var qty = 3
export var hold = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	update_controls()

func update_controls():
	if not $HBoxContainer:
		return
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
