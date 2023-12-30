extends State

var velocity = Vector2.ZERO
var tween = Tween.new()

func enter(_msg := {}) -> void:
	owner.add_child(tween)
	owner.show_ship_trail = true
	var x = owner.get_viewport_rect().size.x / 2
	var start_position = Vector2(x, owner.get_viewport_rect().size.y*2)
	owner.position = start_position
	var end_position = owner.get_viewport_rect().size / 2
	tween.interpolate_property(
		owner, "position", start_position, end_position, 1, Tween.TRANS_CIRC, Tween.EASE_OUT
	)
	tween.connect("tween_completed", self, "_on_tween_completed")
	tween.start()

func exit() -> void:
	owner.show_ship_trail = false


func _on_tween_completed(_object, _key):
	owner.PlayerStateMachine.transition_to("Main")
