extends Node2D

var dir = Vector2()
export(int) var vision_range = 30
export(float) var speed = 15
export(float) var friction = 0.9

var has_detected = false
var target:Vector2
var velocity := Vector2.ZERO

func _process(delta):
	_update_position(to_local(Jugador.global_position))

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
	
func _draw():
	draw_circle(Vector2.ZERO, vision_range, Color(1,1,1,0.1))
