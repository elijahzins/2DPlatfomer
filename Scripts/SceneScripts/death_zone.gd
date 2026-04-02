extends Area2D

var checkpoint_manager
var player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#checkpoint_manager = get_parent().get_node("CheckpointManager")
	#player = get_parent().get_node("player1")
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("GBLplayer") && body.name == "player1":
		body.kill_player_test()
		print("Death Zone Hit")


#func killPlayer():
	#player.position = checkpoint_manager.lastPlayerLocation
