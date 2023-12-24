extends KinematicBody2D
class_name Spaceship

signal ship_submerged
signal ship_exploded

export var max_speed := 200.0
export var max_rotation_speed := 2

onready var SpaceshipStateMachine = $SpaceshipStateMachine
onready var Explosion = $Explosion
onready var ExplosionParticles = $Explosion/ExplosionParticles
onready var Ship = $Ship
onready var TouchStartSprite = $TouchStartSprite
onready var Camera2D = $Camera2D

func teleport_to_the_planet():
	if SpaceshipStateMachine.state and SpaceshipStateMachine.state.name  != "Submerge":
		SpaceshipStateMachine.transition_to("Submerge")

func emit_ship_submerged():
	emit_signal("ship_submerged")
	
func emit_ship_exploded():
	emit_signal("ship_exploded")
	
func on_asteroid_hit(asteroid, body):
	print("on_asteroid_hit: ", asteroid.name, ', ', body.name)
	#if asteroid is Asteroid and body == self:
	#	SpaceshipStateMachine.transition_to("Explode")
