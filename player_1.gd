extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 900

@onready var playerSprite = $AnimatedSprite2D
var stopped = 0
var is_grounded

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

	# Move the character
	move_and_slide()
	
	# Plays walk cycle or idle
	if not velocity.x == 0 or (not velocity.y == 0 and not is_on_floor()):
		stopped = 0
		
	if velocity.y > 0 and not is_on_floor():
		playerSprite.play("fall")
	else: if not velocity.x == 0 and is_on_floor():
		playerSprite.play("walk")
	else: if is_on_floor():
		if stopped > 300:
			playerSprite.play("idle")
		else:
			playerSprite.play("default")
			stopped += 1
		
#Passing through one-way tiles
func _input(event : InputEvent):
	if (event.is_action_pressed("ui_down") && is_on_floor()):
		position.y += 1
