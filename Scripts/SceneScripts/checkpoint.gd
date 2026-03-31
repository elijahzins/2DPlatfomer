extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#if the player's body is a part of the 
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer"):
		GlobalScript.checkpoint_position = $RespawnPoint.global_position
