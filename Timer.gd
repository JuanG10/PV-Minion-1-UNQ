extends Node2D

export (PackedScene) var npc

func _on_Timer_timeout():
	# Instancio un enemigo
	var newEnemy = npc.instance()
	# Lo agrego al 'DOM' como hijo de la raiz
	get_tree().get_root().add_child(newEnemy)
	# Le doy una posicion inicial
	newEnemy.global_position = global_position - Vector2(0,40)
	# La resta con el vector es para que instancie sobre el spr_agujero
	newEnemy.connect("hit", Jugador, "_on_obj_triangulo_hit")
	newEnemy.connect("hit", Interfaz, "_on_obj_triangulo_hit")
