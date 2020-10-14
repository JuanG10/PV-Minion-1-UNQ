extends RigidBody2D

var direction = Vector2.UP

var plataform_vector = Vector2()

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		apply_central_impulse(10000 * weight_player())

func weight_player():
	return Vector2()

func _on_Area2D_body_entered(body):
	 pass

func follow_plataform(force):
	plataform_vector = force

func stop_follow_plataform():
	plataform_vector = Vector2.ZERO

func weight():
	return Vector2(0,50)
