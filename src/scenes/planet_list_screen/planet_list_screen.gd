extends Control

onready var PlanetsVBoxContainer = $NinePatchRect/MarginContainer/MainVBoxContainer/ScrollContainer/PlanetsVBoxContainer
var planet_list_item = preload('res://scenes/planet_list_screen/planet_list_item.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_planets()

func fill_planets():
	# clear ProductsVBoxContainer children
	for child in PlanetsVBoxContainer.get_children():
		child.queue_free()
	
	# fill ProductsVBoxContainer with goods
	var planets = PlanetsData.planets
	var i = 0
	for planet in planets:
		var planet_list_item_instance = planet_list_item.instance()
		planet_list_item_instance.planet_id = planet["ID"]
		PlanetsVBoxContainer.add_child(planet_list_item_instance)


func _on_BackButton_pressed():
	get_tree().change_scene("res://scenes/planet_screen/panet_screen.tscn")
