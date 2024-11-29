extends Control

func _on_new_game_pressed() -> void:
	var intro_scene = preload("res://scenes/intro_scene.tscn")
	get_tree().change_scene_to_packed(intro_scene)
