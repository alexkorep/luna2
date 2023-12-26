extends Area2D

export var speed = 150
export var direction = Vector2.ZERO

func start(pos):
	position = pos
	
func _process(delta):
	position += speed * delta * direction.normalized()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func on_body_entered(body):
	if body.has_method("kill"):
		# Killing the player
		# TODO implement health/shield
		body.kill()
		queue_free()
