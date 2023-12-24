extends Control

signal hud_map

func _on_MapToggleButton_pressed():

	emit_signal("hud_map")
