extends KinematicBody2D

signal end_animation_finished
signal ship_exploded

export var max_speed := 200.0
export var shield = 100.0

# This is about a movement target, not shooting :-)
export var debug_target = false

onready var PlayerStateMachine = $PlayerStateMachine
onready var Explosion = $Explosion
onready var ExplosionParticles = $Explosion/ExplosionParticles
onready var Ship = $Ship
onready var ShootTimer = $ShootTimer
onready var GunPosition = $Ship/GunPosition
onready var Target = $Target

# Called when the node enters the scene tree for the first time.
func _ready():
	Target.visible = debug_target

func kill():
	PlayerStateMachine.transition_to("Explode")

func emit_ship_exploded():
	emit_signal("ship_exploded")

func end():
	PlayerStateMachine.transition_to("End")
	
func emit_end_animation_finished():
	emit_signal("end_animation_finished")
