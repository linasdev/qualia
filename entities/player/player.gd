extends KinematicBody2D

export var run_speed = 65  # How fast the player will move (pixels/sec).
export var jump_speed = -150
export var gravity = 5

var velocity = Vector2();
var jumping = false;
var interactableObject;

func _input(event):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if Input.is_action_just_pressed("interact"):
		interact()

func process_animation():
	var animation

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

func process_interactability():
	interactableObject = null
	$interaction_info.hide()
	for body in $interaction_area.get_overlapping_bodies():
		if body.get_name() == "npc" or body.get_name() == "scene_changer":
			interactableObject = body
	if interactableObject != null:
		$interaction_info.show()
		
func interact():
	if interactableObject != null:
		interactableObject.interact()

func _process(_delta):
	process_animation()
	process_interactability()

# Skiela istryne get_input ir pakeite struktura, atleiskit, kolegos :(

func _physics_process(_delta):
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	velocity.x = 0;	
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	velocity.y += gravity
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func _ready():
	$interaction_info.hide()
