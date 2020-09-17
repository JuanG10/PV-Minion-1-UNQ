extends Area2D

var dir = Vector2()
export(int) var vision_range = 35
export(float) var speed = 20
export(float) var friction = 0.8

var has_detected = false
var target:Vector2
var velocity := Vector2.ZERO

var playerPos
signal hit

func _process(delta):
	playerPos = to_local(Jugador.global_position)
	_update_position(playerPos)

func _physics_process(delta):
	if has_detected:
		velocity += target.normalized() * speed
		
	velocity *= friction
	if velocity.length() < 1:
		velocity = Vector2.ZERO
	
	position += velocity * delta

func _update_position(mouse_pos:Vector2):
	if !mouse_pos.length() <= vision_range:
		target = mouse_pos
		has_detected = true
		dir = mouse_pos
	else:
		dir = Vector2.ZERO
		has_detected = false

func _on_obj_triangulo_body_entered(body):
	if body.get_name() == "obj_jugador":
		emit_signal('hit')
