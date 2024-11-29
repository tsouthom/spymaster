extends Node

# Metrics
var legitimacy = 10
var bribe_bags = 7
var cland_moves = 12

func zero_legitimacy():
	# Freeze game
	get_tree().paused = true
	# Play Game Over Message
	# Back to Main Menu
	pass

func reset_metrics() -> void:
	legitimacy = 10
	bribe_bags = 7
	cland_moves = 12
