extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 900

#var checkpoint_manager_test
#var player_test

@onready var playerSprite = $AnimatedSprite2D
var stopped = 0
var is_grounded

@onready var health_label = get_tree().root.get_node("level/CanvasLayer/healthLabel")
var health = 3

func jump():
	velocity.y = JUMP_FORCE

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Left / Right movement
	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * SPEED
	
	# Sets sprite direction
	if input_dir > 0:
		if playerSprite.flip_h == true:
			playerSprite.set_flip_h(false)
	else: if input_dir < 0:
		if playerSprite.flip_h == false:
			playerSprite.set_flip_h(true)
		

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		playerSprite.play("jump")
		velocity.y = JUMP_FORCE
		
	if Input.is_action_just_pressed("ui_down") and is_on_floor():
		playerSprite.play("crouch")
		position.y += 1

	# Move the character
	move_and_slide()
	
	# Plays walk cycle or idle
	if velocity.y > 0 and not is_on_floor():
		playerSprite.play("fall")
		stopped = 0
	else: if not velocity.x == 0 and is_on_floor():
		playerSprite.play("walk")
		stopped = 0
	else: if is_on_floor():
		if Input.is_action_pressed("ui_down"):
			playerSprite.play("crouch")
			stopped = 0
		else: if stopped > 300:
			playerSprite.play("idle")
		else:
			playerSprite.play("default")
			stopped += 1
		
#Passing through one-way tiles
func _input(event : InputEvent):
	if (event.is_action_pressed("ui_down") && is_on_floor()):
		position.y += 1
		
func decrease_health():
	health -= 1
	print(health)
	if(health == 0):
		get_tree().reload_current_scene()
		#kill_player_test()
	health_label.text = "Health: %d" % health

#Instantly kills player when called, allows simple storage of checkpoint locations on reloadd
func kill_player_test():
	pass

func _ready():
	health_label.text = "Health: %d" % health
