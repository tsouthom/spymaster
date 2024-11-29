extends Node

# Global variables
var dialogue_in_motion = false
var marker_in_focus = 0
var marker_status_in_focus = 0

# Setting up the dialogue file
var dialogue_data = []
var dialogue_file_path = "res://data/dialogue.json"

func _ready():
	dialogue_data = load_json_file(dialogue_file_path)

func load_json_file(filePath: String):
	if FileAccess.file_exists(dialogue_file_path):
		var data_file = FileAccess.open(dialogue_file_path, FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		return parsed_result
	else:
		print("Dialogue file missing.")
		
func reset_logic() -> void:
	# When Game Over, call this function during transition to the MainMenu
	dialogue_in_motion = false
	marker_in_focus = 0
	marker_status_in_focus = 0
	
	for key in marker_data.keys():
		marker_data[key]['status'] = 1

# Save file with updatable metrics
# This would normallly be an outside save file
# but the game is small in scope, so for now it will be a variable
var marker_data = {
	1: {"name": "London", "status": 1},
	2: {"name": "Dover", "status": 1},
	3: {"name": "Chartley Castle", "status": 1},
	4: {"name": "Paris", "status": 1},
	5: {"name": "Canterbury", "status": 1}
}
