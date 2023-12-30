extends Node2D

signal died 
export var target_position = Vector2.ZERO
export var is_shooting = false setget set_is_shooting
export var shoot_min_time = 0.5
export var shoot_max_time = 1.5

onready var ShootTimer = $ShootTimer
onready var StateMachine = $StateMachine
onready var ExplodeTimer = $ExplodeTimer
onready var ExplosionParticles = $ExplosionParticles
onready var CollisionShape2D = $CollisionShape2D
onready var GunPositon = $GunPositon
onready var FormationAnimationPlayer = $FormationAnimationPlayer

var bullet_scene = preload("res://scenes/shmup_screen/enemy/enemy_bullet.tscn")

func _ready():
	set_is_shooting(is_shooting)
	
func _process(delta):
	pass
	
func set_is_shooting(value):
	is_shooting = value
	if not ShootTimer:
		return
		
	if is_shooting:
		# Set random shoot time
		ShootTimer.wait_time = rand_range(shoot_min_time, shoot_max_time)
		ShootTimer.start()
	else:
		ShootTimer.stop()


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

func _on_ShootTimer_timeout():
	ShootTimer.wait_time = rand_range(shoot_min_time, shoot_max_time)
	ShootTimer.start()
	# Shoot
	var shoot_direction = (target_position - position).normalized()
	if shoot_direction == Vector2.ZERO:
		# Should never happen
		return
		
	var b = bullet_scene.instance()
	b.direction = shoot_direction
	get_tree().root.add_child(b)
	b.start(GunPositon.global_position)
	

	
