extends Node2D

# Preloaded assets
var game_over_box = preload("res://scenes/game_over_box.tscn")

func _process(_delta: float) -> void:
	check_is_game_over()

func check_is_game_over() -> void:
	if PlayerMetrics.legitimacy == 0:
		# Block the player from opening markers
		GameLogic.dialogue_in_motion = true
		
		var GameOver = game_over_box.instantiate()
		get_node('Dialogue/DialogueUI').add_child(GameOver)
