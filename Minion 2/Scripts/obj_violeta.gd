extends KinematicBody2D

var speed = 150 
var velocity = Vector2.ZERO
var gravity = 750
var jump = -130
var plataform_vector = Vector2()

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = 0 
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump
	velocity = move_and_slide(velocity,Vector2.UP)

func follow_plataform(force):
	plataform_vector = force

func stop_follow_plataform():
	plataform_vector = Vector2.ZERO

func weight():
	return Vector2(0,25)
