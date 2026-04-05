extends Node2D

@onready var pause_menu_node = $PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalScript.player1Character == "Spike":
		var player1_scene = preload("res://Sub-Scenes/PlayerCharacterScenes/PlayerSpike.tscn")
		var player1 = player1_scene.instantiate()
		#add_child(player1)
		get_node("Pauseable").add_child(player1)
		print("Spike Chosen")
	
	if GlobalScript.player1Character == "Schmitty":
		var player1_scene = preload("res://Sub-Scenes/PlayerCharacterScenes/PlayerSchmitty.tscn")
		var player1 = player1_scene.instantiate()
		#add_child(player1)
		get_node("Pauseable").add_child(player1)
		print("Schmitty Chosen")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu(paused)

#func pause_menu():
	#if paused:
		#pause_menu_node.hide()
		#Engine.time_scale = 1
	#else:
		#pause_menu_node.show()
		#Engine.time_scale = 0
	#
	#paused = !paused
	
func pause_menu(is_paused):
	if is_paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		pause_menu_node.hide()
		get_tree().paused = false

	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
		pause_menu_node.show()
	paused = !paused
