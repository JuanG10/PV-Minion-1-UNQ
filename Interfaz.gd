extends CanvasLayer

var score = 0

func _ready():
	$Puntaje.set_text("Cubitos " + str(score))

func _on_obj_jugador_score_increment():
	score += 1
	$Puntaje.set_text("Cubitos " + str(score))
