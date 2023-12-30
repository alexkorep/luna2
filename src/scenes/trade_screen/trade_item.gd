tool
extends Control

signal trade_item_selected(product_idx)

export var product := "Gold"
export var price := 21
export var qty := 3
export var hold := 2
export var product_idx := 0

export var selected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	update_controls()

func update_controls():
	if not $Panel/HBoxContainer:
		return
	$Panel/HBoxContainer/ProductLabel.text = product
	$Panel/HBoxContainer/PriceLabel.text = str(price)
	$Panel/HBoxContainer/QtyLabel.text = str(qty)
	$Panel/HBoxContainer/HoldLabel.text = str(hold)
	$Panel.pressed = selected

func _process(delta):
	update_controls()

func _on_TradeItem_gui_input(event):
	# Detect mouse click
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("trade_item_selected", product_idx)


func _on_Panel_pressed():
	emit_signal("trade_item_selected", product_idx)
