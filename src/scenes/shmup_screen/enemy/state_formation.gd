extends State

var velocity = Vector2.ZERO
var tween = Tween.new()
var shoot_timeout_min = 1
var shoot_timeout_max = 4

var rng = RandomNumberGenerator.new()
var bullet_scene = preload("res://scenes/shmup_screen/enemy/enemy_bullet.tscn")

func enter(_msg := {}) -> void:
	rng.randomize()
	reload()
	owner.ShootTimer.connect("timeout", self, "_on_shoot_timer_timeout")

func exit() -> void:
	pass

func reload():
	owner.ShootTimer.wait_time = rng.randf_range(shoot_timeout_min, shoot_timeout_max)
	owner.ShootTimer.start()
	
func _on_shoot_timer_timeout():
	var b = bullet_scene.instance()
	var shoot_direction = (owner.target_position - owner.position).normalized()
	b.direction = shoot_direction
	get_tree().root.add_child(b)
	b.start(owner.position)
	reload()
