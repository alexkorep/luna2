extends State

var velocity = Vector2.ZERO
var tween_up = null
var tween_down = null

var shoot_timeout_min = 4
var shoot_timeout_max = 12
var move_vector = Vector2(0, 10)
var duration = 1

var rng = RandomNumberGenerator.new()
var bullet_scene = preload("res://scenes/shmup_screen/enemy/enemy_bullet.tscn")

func enter(_msg := {}) -> void:
	rng.randomize()
	reload()
	owner.ShootTimer.connect("timeout", self, "_on_shoot_timer_timeout")

	tween_up = Tween.new()
	tween_down = Tween.new()
	owner.add_child(tween_up)
	owner.add_child(tween_down)
	tween_up.connect("tween_completed", self, "on_move_up_ended")
	tween_down.connect("tween_completed", self, "on_move_down_ended")
	move_up()

func on_move_down_ended(object: Object, key: NodePath) -> void:
	move_up()

func move_up():
	tween_up.interpolate_property(owner, 
		"position", owner.position, owner.position - move_vector, 
		duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween_up.start()

func on_move_up_ended(object: Object, key: NodePath) -> void:
	move_down()

func move_down():
	tween_down.interpolate_property(owner, 
		"position", owner.position, owner.position + move_vector, 
		duration, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween_down.start()

func exit() -> void:
	tween_up.stop_all()
	tween_up.queue_free()
	tween_down.stop_all()
	tween_down.queue_free()

func reload():
	owner.ShootTimer.wait_time = rng.randf_range(shoot_timeout_min, shoot_timeout_max)
	owner.ShootTimer.start()
	
func _on_shoot_timer_timeout():
	var b = bullet_scene.instance()
	var shoot_direction = (owner.target_position - owner.position).normalized()
	b.direction = shoot_direction
	get_tree().root.add_child(b)
	b.start(owner.GunPositon.global_position)
	reload()
