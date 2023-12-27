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
	if not $HBoxContainer:
		return
	$HBoxContainer/ProductLabel.text = product
	$HBoxContainer/PriceLabel.text = str(price)
	$HBoxContainer/QtyLabel.text = str(qty)
	$HBoxContainer/HoldLabel.text = str(hold)
	$HBoxContainer/BulletPointSpaceHolder/BulletPointTextureRect.visible = selected

func _process(delta):
	update_controls()

func _on_TradeItem_gui_input(event):
	# Detect mouse click
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		emit_signal("trade_item_selected", product_idx)
