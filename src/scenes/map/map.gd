extends Node2D

var dragging = false
var drag_start = Vector2()

onready var Camera2D = $Camera2D
onready var Sprite = $Sprite

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_start = event.position
			else:
				dragging = false
	elif event is InputEventMouseMotion:
		if dragging:
			var drag_current = event.position
			var drag_delta = drag_start - drag_current
			drag_start = drag_current
			Camera2D.global_position += drag_delta

			var viewport = get_viewport()
			Camera2D.global_position.x = clamp(Camera2D.global_position.x, 
				Sprite.position.x, Sprite.position.x + Sprite.texture.get_width())
			Camera2D.global_position.y = clamp(Camera2D.global_position.y, 
				Sprite.position.y, Sprite.position.y + Sprite.texture.get_height())
