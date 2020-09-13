extends Position2D

# Codigo repetido con spw_flecha, preguntar como reutilizar

export (PackedScene) var npc

var rand_pos = Vector2()

func _ready():
	randomize()

func _on_Timer_timeout():
	rand_pos.x = rand_range(0,get_viewport().size.x)
	rand_pos.y = rand_range(0,get_viewport().size.y)
	# Instancio un enemigo
	var newScoreObj = npc.instance()
	# Lo agrego al 'DOM' como hijo de la raiz
	get_tree().get_root().add_child(newScoreObj)
	# Le doy una posicion inicial
	newScoreObj.global_position = rand_pos
	# Conecto su senial con con el Label de Puntaje
	newScoreObj.connect("score_increment", Interfaz, "_on_obj_jugador_score_increment")
