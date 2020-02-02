extends StaticBody2D

export (String) var sample_text

func interact():
	$dialogue_bubble/Label.text = sample_text
	$dialogue_bubble.show()
	get_parent().get_node("scene_changer").show()

func _ready():
	$dialogue_bubble.hide()
