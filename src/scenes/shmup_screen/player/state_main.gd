extends State

var mouse_pressed_position = Vector2.ZERO
var mouse_pressed_ship_position = Vector2.ZERO
var current_mouse_position = Vector2.ZERO

var bullet_scene = preload("res://scenes/shmup_screen/player/player_bullet.tscn")

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
	if mouse_pressed_position == Vector2.ZERO:
		return

	var expected_ship_position = mouse_pressed_ship_position + current_mouse_position - mouse_pressed_position
	var move_vector = expected_ship_position - owner.position
	# if move_vector.length() < 5:
	# 	# Do not move
	# 	return

	var velocity = move_vector.normalized() * owner.max_speed * 60
	if velocity != Vector2.ZERO:
		owner.move_and_slide(velocity * delta)

	# Keep the player within the screen
	var viewport_rect = owner.get_viewport_rect()
	owner.position.x = clamp(owner.position.x, 0, viewport_rect.size.x)
	owner.position.y = clamp(owner.position.y, 0, viewport_rect.size.y)

func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		mouse_pressed_position = event.position if event.pressed else Vector2.ZERO
		mouse_pressed_ship_position = owner.position if event.pressed else Vector2.ZERO
	elif event is InputEventMouseMotion and event.button_mask == 1:
		current_mouse_position = event.position

func exit() -> void:
	owner.ShootTimer.stop()
