extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ProductsVBoxContainer = $NinePatchRect/MarginContainer/MainVBoxContainer/ScrollContainer/ProductsVBoxContainer
var trade_item = preload('res://scenes/trade_screen/trade_item.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_goods()

func fill_goods():
	# clear ProductsVBoxContainer children
	for child in ProductsVBoxContainer.get_children():
		child.queue_free()
	
	# fill ProductsVBoxContainer with goods
	var goods = GoodsData.goods
	for good in goods:
		var trade_item_instance = trade_item.instance()
		trade_item_instance.product = good["Name"]
		trade_item_instance.buy = 21
		trade_item_instance.sell = 13
		trade_item_instance.qty = 3
		trade_item_instance.hold = 2
		ProductsVBoxContainer.add_child(trade_item_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayTextureButton_pressed():
	get_tree().change_scene("res://scenes/space/space.tscn")
