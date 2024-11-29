extends Control


func _on_back_to_menu_pressed() -> void:
	var main_menu_scene = preload("res://scenes/main_menu.tscn")
	get_tree().change_scene_to_packed(main_menu_scene)
	
	GameLogic.reset_logic()
	PlayerMetrics.reset_metrics()
