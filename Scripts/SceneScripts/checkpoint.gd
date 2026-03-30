extends Area2D

var checkpoint_manager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#if the player's body is a part of the 
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer"):
		checkpoint_manager.lastPlayerLocation = $RespawnPoint.global_position
