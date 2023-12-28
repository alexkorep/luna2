extends State

var velocity = Vector2.ZERO

var bullet_scene = preload("res://scenes/shmup_screen/player/player_bullet.tscn")

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	# TODO would it connect multiple times if we enter this mode multiple times?
	# Should connect be moved to _on_ready?
	owner.ShootTimer.connect("timeout", self, "on_shoot_timer")
	owner.ShootTimer.start()
	on_shoot_timer()
	
func on_shoot_timer():
	var b = bullet_scene.instance()
	get_tree().root.add_child(b)
	b.start(owner.GunPosition.global_position)

func update(delta: float) -> void:
	# The joistick position is converted to the target on the screen.
	# E.g. the leftmost position of the joystick will be the leftmost position on the screen.
	# The only exception, when the joystick is in the center, the target will be the player's position.
	# TODO we should actually detect if the player touched the screen and if not, do not
	# move the player.
	var action_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var action_y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var viewport_size = owner.get_viewport().get_visible_rect().size
	var owner_position = owner.position
	var target_x = viewport_size.x/2 + action_x * viewport_size.x/2 if action_x else owner_position.x
	var target_y = viewport_size.y/2 + action_y * viewport_size.y/2 if action_y else owner_position.y
	var threshold = 10
	if (abs(target_x - owner_position.x) < threshold):
		target_x = owner_position.x
	if (abs(target_y - owner_position.y) < threshold):
		target_y = owner_position.y
	owner.Target.global_position = Vector2(target_x, target_y)

	var direction = (Vector2(target_x, target_y) - owner.position).normalized()
	var new_velocity = direction*owner.max_speed * 60

	if (new_velocity != velocity):
		velocity = new_velocity

	if velocity != Vector2.ZERO:
		owner.move_and_slide(velocity*delta)

	# Keep the player within the screen
	var viewport_rect = owner.get_viewport_rect()
	owner.position.x = clamp(owner.position.x, 0, viewport_rect.size.x)
	owner.position.y = clamp(owner.position.y, 0, viewport_rect.size.y)

func exit() -> void:
	owner.ShootTimer.stop()
	
