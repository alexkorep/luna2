extends State

func enter(_msg := {}) -> void:
	# prevent double explosion
	owner.CollisionShape2D.set_deferred("disabled", true)
	owner.ShipObject.hide()
	owner.ExplosionParticles.emitting = true
	owner.ExplodeTimer.connect("timeout", self, "_on_explode_timer_timeout")
	owner.ExplodeTimer.start()

func _on_explode_timer_timeout():
	owner.emit_signal_died()
	owner.queue_free()
	
func exit() -> void:
	pass
