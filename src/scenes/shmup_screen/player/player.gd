extends KinematicBody2D

signal end_animation_finished

export var max_speed := 200.0

onready var PlayerStateMachine = $PlayerStateMachine
onready var Explosion = $Explosion
onready var ExplosionParticles = $Explosion/ExplosionParticles
onready var Ship = $Ship

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func emit_ship_exploded():
	emit_signal("ship_exploded")

func end():
	PlayerStateMachine.transition_to("End")
	
func emit_end_animation_finished():
	emit_signal("end_animation_finished")
