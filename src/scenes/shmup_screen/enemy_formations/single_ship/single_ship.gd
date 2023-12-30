extends Node2D

onready var AnimationPlayer = $AnimationPlayer
onready var SimpleEnemyShip = $Path2D/PathFollow2D/SimpleEnemyShip

var counter = 0
export var loop_count = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	AnimationPlayer.play("Enter")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Enter":
		AnimationPlayer.play("Main")
		SimpleEnemyShip.is_shooting = true
	elif anim_name == "Main":
		counter += 1
		if counter >= loop_count:
			SimpleEnemyShip.is_shooting = false
			AnimationPlayer.play("Exit")
		else:
			AnimationPlayer.play("Main")
	elif anim_name == "Exit":
		pass
		# TODO report that the ship is gone
