extends State

var velocity = Vector2.ZERO
var tween = Tween.new()

func enter(_msg := {}) -> void:
	owner.add_child(tween)
	var start_position = owner.get_viewport_rect().size / 2
	var end_position = Vector2(owner.get_viewport_rect().size.x / 2, 0)
	tween.interpolate_property(
		owner, "position", start_position, end_position, 1, 
		Tween.TRANS_ELASTIC, Tween.EASE_IN
	)
	tween.connect("tween_completed", self, "_on_tween_completed")
	tween.start()

func exit() -> void:
	pass

func _on_tween_completed(object, key):
	owner.emit_end_animation_finished()
