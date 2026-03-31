extends Area2D

@onready var checkpointSprite = $AnimatedSprite2D
var opened = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalScript.checkpoint_is_open == true:
		checkpointSprite.play("opened")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GlobalScript.checkpoint_is_open == false:
		checkpointSprite.play("closed")
	else: if checkpointSprite.animation == "opening" and checkpointSprite.frame == 4:
		checkpointSprite.play("opened")

#if the player's body is a part of the "GBLplayer" do the following when entering the checkpoint
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer"):
		GlobalScript.checkpoint_position = $RespawnPoint.global_position
		if GlobalScript.checkpoint_is_open == false:
			GlobalScript.checkpoint_is_open = true
			checkpointSprite.play("opening")
			GlobalScript.checkpoint_is_open = true
