extends KinematicBody2D

# Posiciones del mouse y velocidad del obj_jugador respectivamente
var mousePos = Vector2()
var velocity = Vector2()
var target = Vector2() # Para objetivo del movimiento del dash

# Multiplicador de velocidad, se modifica para usar el dash
var multiplier = 120
const mul_variation = 3

# Variables relacionadas al timer
var timer = 0
const wait_time = 0.4
var key_enable = true
signal timeout

# const FOLLOW_SPEED = 4.0
# La siguiente linea iria en _physics_process
# es otra manera de seguir al mouse pero al no entender bien como funciona
# decidi usar la version con 'velocity'
# position = position.linear_interpolate(mousePos, delta * FOLLOW_SPEED)

# warning-ignore:unused_argument
func _process(delta):
	# Obtengo la posicion del mouse
	mousePos = get_viewport().get_mouse_position()
	# Y la miro
	if key_enable:
		look_at(mousePos)
	_dash_logic()

func _physics_process(delta):
	_movement_logic()
	_timer_logic(delta)

func _dash_logic():
	# Aclaracion: 'ui_accept' según la configuración del proyecto
	# hace referencia tanto al Espacio como al Enter 
	# (o los botones de aceptar tipicos de cualquier joystick)
	if Input.is_action_just_pressed("ui_accept"):
		if key_enable:
			multiplier *= mul_variation
			target = get_global_mouse_position()
			key_enable = false

func _timer_logic(delta):
	# Si se uso el dash comienza la cuenta progresiva de tiempo de uso
	if (!key_enable):
		timer += delta
		if timer > wait_time:
			timer = 0
			emit_signal("timeout")

func _on_timeout():
	# Reestablece variables al terminar un dash
	multiplier /= mul_variation
	key_enable = true

func _movement_logic():
	# direction_to retorna un Vector2D
	# lo multiplico por la cantidad deseada (sal y pimienta a gusto)
	# y lo asigno a velocity
	velocity = position.direction_to(mousePos) * multiplier
	# Pregunto por la distancia entre el mouse y el jugador
	if position.distance_to(mousePos) > 55:
		# Me muevo y modifico 'velocity' a la vez
		if !key_enable:
			# Mantengo la direccion solo si se uso el dash
			velocity = move_and_slide(position.direction_to(target) * multiplier)
		velocity = move_and_slide(velocity)
