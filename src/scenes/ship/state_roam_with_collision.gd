extends State

var velocity = Vector2.ZERO

# Upon entering the state, we set the Player node's velocity to zero.
func enter(_msg := {}) -> void:
	pass

func update(delta: float) -> void:
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var new_velocity = direction.normalized()*owner.max_speed * 60

	if (new_velocity != velocity):
		velocity = new_velocity
		owner.rotation = velocity.angle() + PI / 2

	if velocity != Vector2.ZERO:
		owner.move_and_slide(velocity*delta)

func exit() -> void:
	pass
	
