extends KinematicBody2D

export var speed = 100

var velocity = Vector2()

func _physics_process(_delta):
	velocity.x = speed;	
	velocity = move_and_slide(velocity, Vector2(0, -1))
