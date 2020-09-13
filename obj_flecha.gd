extends KinematicBody2D

# Codigo repetido con obj_jugador, preguntar como abstraer

# Posiciones del mouse y velocidad del obj_jugador respectivamente
var playerPos = Vector2()
var velocity = Vector2()

func _ready():
	playerPos = Obj_Jugador.global_position
	# TODO: Chequear cantidad de flechas para limitar cant. de instancias

# warning-ignore:unused_argument
func _process(delta):
	playerPos = Obj_Jugador.global_position
	# Y la miro
	look_at(playerPos)

# warning-ignore:unused_argument
func _physics_process(delta):
	# direction_to retorna un Vector2D
	# lo multiplico por la cantidad deseada (sal y pimienta a gusto)
	# y lo asigno a velocity
	velocity = position.direction_to(playerPos) * 100
	# Pregunto por la distancia
	if position.distance_to(playerPos) > 60:
		# Me muevo y modifico 'velocity' a la vez
		velocity = move_and_slide(velocity)

func _on_Timer_timeout():
	get_parent().remove_child(self)
	queue_free()
