extends StaticBody2D

export(String, FILE, "*.tscn") var target_scene

func interact():
	get_tree().change_scene(target_scene)
