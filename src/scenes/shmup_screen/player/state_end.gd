extends State

var velocity = Vector2.ZERO
var tween = Tween.new()

func enter(_msg := {}) -> void:
	owner.show_ship_trail = true
	owner.add_child(tween)
	var start_position = owner.position
	var end_position = Vector2(owner.position.x, -owner.get_viewport_rect().size.y)
	tween.interpolate_property(
		owner, "position", start_position, end_position, 1, 
		Tween.TRANS_CUBIC, Tween.EASE_IN
	)
	tween.connect("tween_completed", self, "_on_tween_completed")
	tween.start()

func exit() -> void:
	owner.show_ship_trail = false

func _on_tween_completed(_object, _key):
	owner.emit_end_animation_finished()
