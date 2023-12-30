extends Area2D

signal asteroid_killed

onready var ExplosionParticles = $ExplosionParticles
onready var ExplosionTimer = $ExplosionTimer
onready var Sprites = $Sprites
onready var CollisionShape2D = $CollisionShape2D

export var speed := 50

func _ready():
	# Randomly select a sprite
	var sprite_index = randi() % Sprites.get_child_count()
	var i = 0
	for sprite in Sprites.get_children():
		sprite.visible = i == sprite_index
		i += 1

func _process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func enemy_kill():
	for sprite in Sprites.get_children():
		sprite.queue_free()
	CollisionShape2D.queue_free()
	ExplosionParticles.emitting = true
	ExplosionTimer.start()
	emit_signal("asteroid_killed")

func _on_ExplosionTimer_timeout():
	queue_free()

func _on_Asteroid_body_entered(body):
	if body.has_method("kill"):
		# Killing the player
		body.kill()

