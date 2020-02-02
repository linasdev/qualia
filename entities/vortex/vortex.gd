extends Area2D

export (int) var boost

func _on_Vortex_entered(body):
	if body.get_name() == "Player":
		body.velocity_modifiers -= (body.global_position - self.global_position).normalized() * boost
