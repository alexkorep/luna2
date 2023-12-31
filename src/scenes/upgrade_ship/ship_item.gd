extends Control

signal ship_selected(ship_id)

export var ship_name := "Ship"
export var ship_id := 'ship_01'

onready var NameLabel = get_node("%NameLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	NameLabel.text = ship_name


func _on_ShipItem_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("ShipItem: " + ship_id + " selected")
		emit_signal("ship_selected", ship_id)
