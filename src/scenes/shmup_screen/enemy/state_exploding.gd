extends State

func enter(_msg := {}) -> void:
	owner.ShipObject.hide()
	owner.ExplosionParticles.emitting = true
	owner.ExplodeTimer.connect("timeout", self, "_on_explode_timer_timeout")

func _on_explode_timer_timeout():
	owner.emit_signal("died")
	owner.queue_free()
	
func exit() -> void:
	pass
