tool
extends Control

signal trade_item_buy(product_idx)
signal trade_item_sell(product_idx)

export var product := "Gold"
export var price := 21
export var qty := 3
export var hold := 2
export var product_idx := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_controls()

func update_controls():
	if not $HBoxContainer:
		return
	$HBoxContainer/ProductLabel.text = product
	$HBoxContainer/PriceLabel.text = str(price)
	$HBoxContainer/QtyLabel.text = str(qty)
	$HBoxContainer/HoldLabel.text = str(hold)

func _process(delta):
	update_controls()

func _on_SellButton_pressed():
	emit_signal("trade_item_sell", product_idx)

func _on_BuyButton_pressed():
	emit_signal("trade_item_buy", product_idx)
