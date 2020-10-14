extends Node2D

onready var plataforma_base = preload("res://Escenas/Plataforma.tscn")

func _ready():
	var plat1 = plataforma_base.instance()
	var plat2 = plataforma_base.instance()
	plat1.init(plat2)
	plat2.init(plat1)
	plat1.set_position(Vector2(250, 250)) 
	plat2.set_position(Vector2(520, 480)) 
	add_child(plat1)
	add_child(plat2)
