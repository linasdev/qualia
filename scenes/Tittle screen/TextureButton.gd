extends TextureButton

var time_passed = -1;

func _pressed():
	get_parent().get_node("Fader/ColorRect").show()
	get_parent().get_node("Fader/AnimationPlayer").play("FadeOut")
	time_passed = 0
	
func _ready():
	pass # Replace with function body.

func _process(delta):
	if time_passed >= 0:
		time_passed += delta
	if time_passed >= 1:
		get_tree().change_scene("res://scenes/scene4(desert)/scene4(desert).tscn")
		time_passed = -1
