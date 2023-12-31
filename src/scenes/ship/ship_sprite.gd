tool
extends Node2D

export var ship_id := "xq5" setget set_ship_id

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	update_sprites()
	
func update_sprites():
	for sprite in get_children():
		sprite.visible = sprite.name == ship_id

func set_ship_id(id):
	ship_id = id
	update_sprites()

func get_texture():
	for sprite in get_children():
		if sprite.name == ship_id:
			return get_texture_region_as_texture(sprite)
	return null
	
func get_texture_region_as_texture(sprite: Sprite) -> ImageTexture:
	var original_texture = sprite.texture
	var image = original_texture.get_data()
	image.lock()

	var region = sprite.region_rect
	var cropped_image = Image.new()
	cropped_image.create(region.size.x, region.size.y, false, image.get_format())
	cropped_image.lock()

	for y in range(region.size.y):
		for x in range(region.size.x):
			var color = image.get_pixel(region.position.x + x, region.position.y + y)
			cropped_image.set_pixel(x, y, color)

	cropped_image.unlock()
	image.unlock()

	var new_texture = ImageTexture.new()
	new_texture.create_from_image(cropped_image)
	return new_texture
