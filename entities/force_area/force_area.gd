extends Area2D

export (int) var horizontal_boost
export (int) var vertical_boost

func _on_force_area_entered(body):
	if body.get_name() == "Player":
		if horizontal_boost != 0:
			body.velocity_modifiers.x = horizontal_boost
		if vertical_boost != 0:
			body.velocity_modifiers.y = vertical_boost
