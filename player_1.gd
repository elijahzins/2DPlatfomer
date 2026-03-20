extends CharacterBody2D

const SPEED = 200
const JUMP_FORCE = -400
const GRAVITY = 900

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	# Left / Right movement
	var input_dir = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_dir * SPEED

	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_animated_sprite.play("jumpReady")
		velocity.y = JUMP_FORCE

	# Move the character
	move_and_slide()
	
	if velocity.y > 0 and not is_on_floor():
		_animated_sprite.play("fall")
	else: if not velocity.x == 0 and is_on_floor():
		_animated_sprite.play("walk")
	else: if is_on_floor():
		_animated_sprite.play("default")
