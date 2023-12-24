extends Node2D

export var radius_list = []

func _draw():
	var center = Vector2(0, 0)
	var color = Color(0, 1, 0)
	var width = 1
	for radius in radius_list:
		# Draw the orbit
		draw_arc(center, radius/2, 0, 2*PI, 128, color, width, false)
