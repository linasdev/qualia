extends Area2D

export(String, FILE, "*.tscn") var target_scene

func interact():
	get_tree().change_scene(target_scene)
