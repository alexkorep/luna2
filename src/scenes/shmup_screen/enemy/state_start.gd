extends State

var rng = RandomNumberGenerator.new()

var velocity = Vector2.ZERO
var tween = Tween.new()

func enter(msg := {}) -> void:
	rng.randomize()
	var start_position = msg.pos
	var end_position = owner.position
	owner.show()
	owner.add_child(tween)
	owner.position = start_position
	tween.interpolate_property(
		owner, "position", start_position, end_position, 1, Tween.TRANS_CUBIC, Tween.EASE_OUT
	)
	tween.connect("tween_completed", self, "_on_tween_completed")
	tween.start()

func _on_tween_completed(object, key):
	owner.StateMachine.transition_to("Formation")

func exit() -> void:
	pass
