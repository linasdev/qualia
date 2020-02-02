extends StaticBody2D

export (String) var sample_text
export var popup_time = 3

var time_passed = -1

func interact():
	$dialogue_bubble/Label.text = sample_text
	$dialogue_bubble.show()
	time_passed = 0;
	get_parent().get_node("scene_changer").show()

func _ready():
	$dialogue_bubble.hide()
	
func _process(delta):
	if time_passed >= 0:
		time_passed += delta
	if time_passed >= popup_time:
		time_passed = -1;
		$dialogue_bubble.hide()
