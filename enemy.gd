extends RigidBody2D 

func _ready():
	pass
	
func _process(delta):
	pass
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "player1"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("Enemy killed")
			queue_free()
			body.jump()
		else:
			print("Decrease player health")
			get_tree().reload_current_scene()
