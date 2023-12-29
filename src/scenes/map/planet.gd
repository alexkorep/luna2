extends Area2D

signal planet_clicked(planet_id)

export var planet_id := ''
export var selected := false setget set_selected

onready var PlanetSprite = $PlanetSprite

func _ready():
	pass # Replace with function body.

func _on_Planet_input_event(viewport, event, shape_idx):
	# Check mouse clicks
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("planet_clicked", planet_id)

func set_selected(value):
	selected = value
	if selected:
		PlanetSprite.modulate = Color(1, 1, 1, 1)
	else:
		PlanetSprite.modulate = Color(1, 1, 1, 0.5)
