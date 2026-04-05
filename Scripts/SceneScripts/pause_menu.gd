extends Control

@onready var root_node = $"../../"

func _on_resume_pressed() -> void:
	root_node.pause_menu(true)

func _on_character_select_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Sub-Scenes/UIScenes/character_select.tscn")

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Sub-Scenes/UIScenes/start_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
