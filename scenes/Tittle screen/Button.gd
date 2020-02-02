extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if is_hovered():
		set_size(Vector2(1, 1), true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
