extends StaticBody2D

var sample_text = "This is text aaaaaaaaaaaaaaaaaaaaaaaaa as asddf dfd fd df d fdfdfd"

func interact():
	$dialogue_bubble/Label.text = sample_text
	$dialogue_bubble.show()

func _ready():
	$dialogue_bubble.hide()
