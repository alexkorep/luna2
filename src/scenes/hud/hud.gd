extends Control

signal hud_map

onready var FundsLabel = $Funds/FundsLabel

func _on_MapToggleButton_pressed():
	emit_signal("hud_map")

func _process(_delta):
	FundsLabel.text = str(GameState.funds) + ' cr'
