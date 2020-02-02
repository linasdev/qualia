extends Area2D

export (int) var horizontal_boost = 0
export (int) var vertical_boost = 0

func _ready():
	if horizontal_boost != 0 or vertical_boost != 0:
		$rodykle.rotate(Vector2(horizontal_boost, vertical_boost).angle())

func _on_force_area_entered(body):
	if body.get_name() == "Player":
		if horizontal_boost != 0:
			body.velocity_modifiers.x = horizontal_boost
		if vertical_boost != 0:
			body.velocity_modifiers.y = vertical_boost
