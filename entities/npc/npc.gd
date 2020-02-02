extends StaticBody2D

export (String) var sample_text

func interact():
	get_tree().change_scene("res://scenes/scene3(atlas)/scene3(atlas).tscn")
	$dialogue_bubble/Label.text = sample_text
	$dialogue_bubble.show()
	get_parent().get_node("scene_changer").show()

func _ready():
	$dialogue_bubble.hide()
