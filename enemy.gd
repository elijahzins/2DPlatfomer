extends RigidBody2D 

@export var speed: float = 80.0
@export var left_limit: float = -100.0
@export var right_limit: float = 100.0

var direction := 1

func _ready():
	pass
	
func _physics_process(delta):
	linear_velocity.x = direction * speed

	# Flip direction when reaching patrol limits
	if position.x < left_limit:
		direction = 1
	elif position.x > right_limit:
		direction = -1

	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "player1"):
		var y_delta = position.y - body.position.y
		if (y_delta > 30):
			print("Enemy killed")
			queue_free()
			body.jump()
		else:
			print("Decrease player health")
			body.decrease_health()
