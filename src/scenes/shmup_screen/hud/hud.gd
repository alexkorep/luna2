extends Control


export var progress := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(_delta):
	$TextureProgress.value = progress
