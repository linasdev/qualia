extends KinematicBody2D

export var run_speed = 50  # How fast the player will move (pixels/sec).
export var jump_speed = -150
export var gravity = 5

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

func _process(_delta):
	get_input()
	var animation = ""

	if velocity.x > 0:
		animation = "walk_right"
	elif velocity.x < 0:
		animation = "walk_left"
	else:
		animation = "idle"

	if velocity.y > 0:
		animation = "fall"
	elif velocity.y < 0:
		animation = "jump"

	$animated_sprite.set_animation(animation)

		
func _physics_process(_delta):
	velocity.y += gravity
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func _ready():
	$interaction_info.hide()
