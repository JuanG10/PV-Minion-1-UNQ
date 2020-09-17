extends CollisionPolygon2D

func _process(delta):
	look_at(Jugador.global_position)
