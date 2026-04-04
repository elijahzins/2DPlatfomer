extends CharacterBody2D

var SPEED = 400
var vel : float
var gblypos

func _physics_process(delta: float):
	
	move_local_x(vel*SPEED*delta)
	global_position.y = gblypos
	

func _on_area_2d_body_entered(body: CharacterBody2D):
	if body.is_in_group("GBLenemy"):
		print("enemy hit!")
		body.damage_enemy()
		queue_free()
