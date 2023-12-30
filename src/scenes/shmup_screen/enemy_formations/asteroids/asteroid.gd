extends Area2D

onready var ExplosionParticles = $ExplosionParticles
onready var ExplosionTimer = $ExplosionTimer
onready var Sprite = $Sprite
onready var CollisionShape2D = $CollisionShape2D

export var speed := 50

func _ready():
	pass # Replace with function body.

func _process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func enemy_kill():
	Sprite.hide()
	CollisionShape2D.queue_free()
	ExplosionParticles.emitting = true
	ExplosionTimer.start()
	
func _on_ExplosionTimer_timeout():
	queue_free()

func _on_Asteroid_body_entered(body):
	if body.has_method("kill"):
		# Killing the player
		body.kill()

