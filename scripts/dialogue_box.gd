extends CanvasLayer

# Preloaded assets
var win_box = preload("res://scenes/win_box.tscn")

@onready var person = $Sprite/LabelPerson
@onready var dialogue_text = $Sprite/LabelText
@onready var bribe_button = $Sprite/GridContainer/Bribe
@onready var investigate_button = $Sprite/GridContainer/Investigate
@onready var talk_button = $Sprite/GridContainer/Talk
@onready var surveil_button = $Sprite/GridContainer/Surveil
@onready var threaten_button = $Sprite/GridContainer/Threaten

# Freeze buttons
var buttons_usable = true

func _ready() -> void:
	var dialogue_stored = get_dialogue(GameLogic.marker_in_focus, GameLogic.marker_status_in_focus, 0)
	dialogue_text.text = dialogue_stored['message']
	
	if GameLogic.marker_in_focus == 1 and GameLogic.marker_status_in_focus == 2:
		var WinBox = win_box.instantiate()
		get_node('Dialogue/DialogueUI').add_child(WinBox)

func _process(_delta: float) -> void:
	if GameLogic.marker_status_in_focus == 4:
		bribe_button.disabled = true
		investigate_button.disabled = true
		talk_button.disabled = true
		surveil_button.disabled = true
		threaten_button.disabled = true
		
	if all_targets_cleared() == true:
		GameLogic.marker_data[1]['status'] == 2
		
func all_targets_cleared() -> bool:
	if GameLogic.marker_data[2]['status'] == 4:
		if GameLogic.marker_data[3]['status'] == 4:
			if GameLogic.marker_data[4]['status'] == 4:
				if GameLogic.marker_data[5]['status'] == 4:
					if GameLogic.marker_data[6]['status'] == 4:
						if GameLogic.marker_data[7]['status'] == 4:
							return true
	
	return false
	
func get_dialogue(marker_id, status_id, action_id):
	for item in GameLogic.dialogue_data:
		if item.marker_id == marker_id and item.status_id == status_id and item.action_id == action_id:
			return item
	return {"message":"Well, we haven't yet written this part of the game! You caught us red handed!", "update_id":1}

func perform_action(action_id):
	buttons_usable = false
	var dialogue_stored = get_dialogue(GameLogic.marker_in_focus, GameLogic.marker_status_in_focus, action_id)
	dialogue_text.text = dialogue_stored['message']
	GameLogic.marker_status_in_focus = dialogue_stored['update_id']
	GameLogic.marker_data[GameLogic.marker_in_focus]['status'] = dialogue_stored['update_id']
	buttons_usable = true
	
func decrease_cland_moves():
	if PlayerMetrics.cland_moves != 0:
		PlayerMetrics.cland_moves = PlayerMetrics.cland_moves -1
	elif PlayerMetrics.legitimacy != 0:
		PlayerMetrics.legitimacy = PlayerMetrics.legitimacy -1

func _on_leave_pressed() -> void:
	if buttons_usable:
		GameLogic.dialogue_in_motion = false
		queue_free()

func _on_investigate_pressed() -> void:
	perform_action(1)

func _on_talk_pressed() -> void:
	perform_action(2)

func _on_surveil_pressed() -> void:
	perform_action(3)
	decrease_cland_moves()

func _on_bribe_pressed() -> void:
	perform_action(4)
	if PlayerMetrics.bribe_bags != 0:
		PlayerMetrics.bribe_bags = PlayerMetrics.bribe_bags -1
	elif PlayerMetrics.bribe_bags == 0:
		bribe_button.disabled = true

func _on_torture_pressed() -> void:
	perform_action(5)
	decrease_cland_moves()
