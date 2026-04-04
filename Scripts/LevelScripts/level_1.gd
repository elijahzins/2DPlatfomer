extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalScript.player1Character == "Spike":
		var player1_scene = preload("res://Sub-Scenes/PlayerCharacterScenes/PlayerSpike.tscn")
		var player1 = player1_scene.instantiate()
		add_child(player1)
		print("Spike Chosen")
	
	if GlobalScript.player1Character == "Schmitty":
		var player1_scene = preload("res://Sub-Scenes/PlayerCharacterScenes/PlayerSchmitty.tscn")
		var player1 = player1_scene.instantiate()
		add_child(player1)
		print("Schmitty Chosen")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
