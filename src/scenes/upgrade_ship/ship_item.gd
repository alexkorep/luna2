extends Control

signal ship_selected(ship_id)

export var ship_name := "Ship"
export var ship_id := 'ship_01'
export var is_selected := false

onready var NameLabel = get_node("%NameLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	NameLabel.text = ship_name
	
func _process(delta):
	get_node("%SelectedTexture").visible = is_selected
	get_node("%Light2D").visible = is_selected
	var ship = ShipModels.get_ship_by_id(ship_id)
	var ship_is_owned = GameState.is_ship_owned(ship_id)
	# Green - current
	# Yellow - owned
	# Red - not owned
	var is_current = GameState.current_ship_id == ship_id
	if is_current:
		get_node("%YellowSprite").visible = false
		get_node("%RedSprite").visible = false
	elif ship_is_owned:
		get_node("%YellowSprite").visible = true
		get_node("%RedSprite").visible = false
	else:
		get_node("%YellowSprite").visible = false
		get_node("%RedSprite").visible = true

func _on_ShipItem_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		print("ShipItem: " + ship_id + " selected")
		emit_signal("ship_selected", ship_id)
