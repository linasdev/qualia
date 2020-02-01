extends Area2D

export(String, FILE, "*.tscn") var target_scene

func _on_body_entered(body):
	if body.get_name() == "Player":
		print(target_scene)
		get_tree().change_scene(target_scene)
