extends Label

var score = 0

func _ready():
	set_text(str(score))

func _on_obj_jugador_score_increment():
	score += 1
	set_text(str(score))
