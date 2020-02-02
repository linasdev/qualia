extends Area2D

export(String, FILE, "*.tscn") var target_scene

var time_passed = -1;

func interact():
	get_parent().get_node("Fader/AnimationPlayer").play("FadeOut")
	time_passed = 0;

func _process(delta):
	if time_passed >= 0:
		time_passed += delta
	if time_passed >= 1:
		get_tree().change_scene(target_scene)
		time_passed = -1


func _on_Lava_body_entered(body):
	interact()
