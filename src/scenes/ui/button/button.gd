tool
extends TextureButton

export var title := "button" setget set_title

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_title(value):
	title = value
	$Label.text = value
