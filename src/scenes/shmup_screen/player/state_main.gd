extends State

var velocity = Vector2.ZERO

var mouse_pressed_position = Vector2.ZERO

var bullet_scene = preload("res://scenes/shmup_screen/player/player_bullet.tscn")

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	# TODO would it connect multiple times if we enter this mode multiple times?
	# Should connect be moved to _on_ready?
	owner.ShootTimer.connect("timeout", self, "on_shoot_timer")
	owner.ShootTimer.start()
	on_shoot_timer()
	owner.emit_player_ready()
	
func on_shoot_timer():
	var b = bullet_scene.instance()
	get_tree().root.add_child(b)
	b.start(owner.GunPosition.global_position)

func update(delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var new_velocity = direction*owner.max_speed * 60

	if (new_velocity != velocity):
		velocity = new_velocity

	if velocity != Vector2.ZERO:
		owner.move_and_slide(velocity*delta)

	# Keep the player within the screen
	var viewport_rect = owner.get_viewport_rect()
	owner.position.x = clamp(owner.position.x, 0, viewport_rect.size.x)
	owner.position.y = clamp(owner.position.y, 0, viewport_rect.size.y)

func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
			mouse_pressed_position = event.position
	elif event is InputEventMouseMotion and event.button_mask == 1:
			owner.position += event.position - mouse_pressed_position
			mouse_pressed_position = event.position

func exit() -> void:
	owner.ShootTimer.stop()
	
