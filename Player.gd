extends KinematicBody2D

export var run_speed = 400  # How fast the player will move (pixels/sec).
export var jump_speed = -400
export var gravity = 1200

var velocity = Vector2();
var jumping = false;

func get_input():
	velocity.x = 0;
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var jump = Input.is_action_just_pressed("ui_select")

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed

func _process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
