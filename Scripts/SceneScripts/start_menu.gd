extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Sub-Scenes/UIScenes/character_select.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
