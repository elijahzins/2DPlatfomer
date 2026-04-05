extends CharacterBody2D

@export var hop_force := -300.0       
@export var move_speed := 60.0      
@export var hop_interval := 1.2      
@export var patrol_distance := 40.0   

@onready var sprite := $Sprite2D

var left_limit: float
var right_limit: float
var direction := 1
var hop_timer := 0.0
var enemyLives = 5

func _ready():
	left_limit = position.x - patrol_distance
	right_limit = position.x + patrol_distance

func _physics_process(delta):
	velocity.y += 900 * delta

	if position.x < left_limit:
		direction = 1
		sprite.flip_h = false
	elif position.x > right_limit:
		direction = -1
		sprite.flip_h = true

	hop_timer -= delta
	if hop_timer <= 0 and is_on_floor():
		perform_hop()

	if not is_on_floor():
		velocity.x = direction * move_speed
	else:
		velocity.x = 0

	move_and_slide()

func perform_hop():
	velocity.y = hop_force
	hop_timer = hop_interval
	
func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer"):
		body.decrease_health()


func _on_killbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer"):
		enemyLives -= 5
		if enemyLives <= 0:
			queue_free()
		body.jump()

#for schmitty's ranged attack
func damage_enemy():
	enemyLives -= 1
	if enemyLives <= 0:
		queue_free()
