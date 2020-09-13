extends Area2D

signal score_increment

func _on_obj_rombo_body_entered(body):
	# Si es el jugador le suma puntuación.
	if body.get_name() == "obj_jugador":
		emit_signal('score_increment')
		get_parent().remove_child(self)
		queue_free()
