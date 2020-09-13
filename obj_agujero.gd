extends Node2D

var rand_pos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	rand_pos.x = rand_range(0,get_viewport().size.x)
	rand_pos.y = rand_range(0,get_viewport().size.y)
	global_position = rand_pos
