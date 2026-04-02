extends Control

func _on_spike_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://LevelScenes/Level1.tscn")
	GlobalScript.player1Character = "Spike"
	
func _on_schmitty_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://LevelScenes/Level1.tscn")
	GlobalScript.player1Character = "Schmitty"
