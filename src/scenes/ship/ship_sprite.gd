tool
extends Node2D

export var ship_id := "xq5" setget set_ship_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	update_sprites()
	
func update_sprites():
	for sprite in get_children():
		sprite.visible = sprite.name == ship_id

func set_ship_id(id):
	ship_id = id
	update_sprites()
