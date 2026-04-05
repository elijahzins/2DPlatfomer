extends CharacterBody2D

@export var speed = 80.0
@export var patrolDistance = 50.0

@onready var enemySprite = $AnimatedSprite2D

var direction := 1
var enemyLives = 5 
var left_limit: float
var right_limit: float

func _ready():
	left_limit = position.x - patrolDistance
	right_limit = position.x + patrolDistance
	enemySprite.play("walk")

func _physics_process(delta):
	velocity.x = direction * speed
	move_and_slide()

	if position.x < left_limit:
		direction = 1
		enemySprite.flip_h = true
	elif position.x > right_limit:
		direction = -1
		enemySprite.flip_h = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("GBLplayer")):
		var y_delta = position.y - body.position.y
		if (y_delta > 40):
			print("Enemy damaged")
			enemyLives = enemyLives - 5
			if (enemyLives <= 0):
				queue_free()
			body.jump()
		else:
			print("Decrease player health")
			body.decrease_health()

#for schmitty's ranged attack
func damage_enemy():
	enemyLives -= 1
	if enemyLives <= 0:
		queue_free()
