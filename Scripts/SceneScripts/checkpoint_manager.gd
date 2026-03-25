extends Node

var lastPlayerLocation
var player


func _ready() -> void:
	player = get_parent().get_node("player1")
	lastPlayerLocation = player.global_position
