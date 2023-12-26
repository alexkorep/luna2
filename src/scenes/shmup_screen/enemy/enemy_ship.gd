extends Area2D

signal died 
export var target_position = Vector2.ZERO

onready var ShootTimer = $ShootTimer
onready var StateMachine = $StateMachine
onready var ExplodeTimer = $ExplodeTimer
onready var ExplosionParticles = $ExplosionParticles
onready var ShipObject = $ShipObject
onready var CollisionShape2D = $CollisionShape2D

func _ready():
	pass
	
func _process(delta):
	pass
	
func start(pos):
	StateMachine.transition_to("Start", {"pos": pos})
	
func enemy_kill():
	StateMachine.transition_to("Exploding")

func _on_EnemyShip_body_entered(body):
	print("_on_EnemyShip_body_entered")
	if body.has_method("kill"):
	# Killing the player
		body.kill()
