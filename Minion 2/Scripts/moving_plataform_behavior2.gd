extends KinematicBody2D

var weight_counter
var down_force = Vector2.ZERO
var can_move_down = true

func init(plat):
	weight_counter = plat
	
func _physics_process(_delta):
	down_force = total_weight()
	_update_bodies_above()
	if down_force > weight_counter.down_force and can_move_down:
		move_and_slide(down_force - weight_counter.down_force)
	elif weight_counter.can_move_down:
		move_and_slide(down_force - weight_counter.down_force)

func weight():
	return Vector2.ZERO

func total_weight():
	var bodies = $plat_area_arriba.get_overlapping_bodies()
	var res = Vector2.ZERO
	for body in bodies:
		res += body.weight()
	return res

func _update_bodies_above():
	if down_force > weight_counter.down_force and can_move_down: weight_counter._move_bodies_above()
	else: weight_counter._stop_move_bodies_above()

func _move_bodies_above():
	var bodies = $plat_area_arriba.get_overlapping_bodies()
	for body in bodies:
		if body.get_instance_id() != get_instance_id():
			body.follow_plataform(down_force - weight_counter.down_force)

func _stop_move_bodies_above():
	var bodies = $plat_area_arriba.get_overlapping_bodies()
	for body in bodies:
		if body.get_instance_id() != get_instance_id():
			body.stop_follow_plataform()
