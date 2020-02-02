extends KinematicBody2D

export var run_speed = 65  # How fast the player will move (pixels/sec).
export var dash_speed = 165
export var jump_speed = -150
export var gravity = 300
export var horizontal_slowdown = 300
export var dash_cooldown = 1.5

var velocity = Vector2()
var velocity_modifiers = Vector2()
var jumping = false
var interactableObject
var time_since_dash = dash_cooldown

func _input(event):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumping = true
		velocity_modifiers.y = jump_speed
	if Input.is_action_just_pressed("interact"):
		interact()
	if Input.is_action_just_pressed("dash") and time_since_dash > dash_cooldown:
		dash()

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
		
func dash():
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	if right:
		velocity_modifiers.x += dash_speed
	if left:
		velocity_modifiers.x -= dash_speed
	time_since_dash = 0

func _process(delta):
	process_animation()
	process_interactability()
	time_since_dash += delta

# Skiela istryne get_input ir pakeite struktura, atleiskit, kolegos :(

func _physics_process(delta):
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	velocity = Vector2(0, 0)
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	
	velocity_modifiers.y += gravity * delta
	if velocity_modifiers.x > 0:
		velocity_modifiers.x = max(0, velocity_modifiers.x - horizontal_slowdown * delta)
	else:
		velocity_modifiers.x = min(0, velocity_modifiers.x + horizontal_slowdown * delta)
	
	
	velocity += velocity_modifiers
	
	if is_on_floor():
		if jumping:
			jumping = false
		else:
			velocity_modifiers.y = min(0, velocity_modifiers.y)
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
func _ready():
	$interaction_info.hide()
