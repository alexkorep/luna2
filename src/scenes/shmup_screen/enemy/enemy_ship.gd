extends Node2D

signal died 
export var target_position = Vector2.ZERO

onready var ShootTimer = $ShootTimer
onready var StateMachine = $StateMachine
onready var ExplodeTimer = $ExplodeTimer
onready var ExplosionParticles = $ExplosionParticles
onready var ShipObject = $ShipObject
onready var CollisionShape2D = $ShipObject/CollisionShape2D
onready var GunPositon = $ShipObject/GunPositon
onready var FormationAnimationPlayer = $FormationAnimationPlayer
func _ready():
	pass
	
func _process(_delta):
	pass
	
func start(pos):
	StateMachine.transition_to("Start", {"pos": pos})
	
func enemy_kill():
	StateMachine.transition_to("Exploding")

func _on_EnemyShip_body_entered(body):
	if body.has_method("kill"):
		# Killing the player
		body.kill()

func emit_signal_died():
	emit_signal("died")
