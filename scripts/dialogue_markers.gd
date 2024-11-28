extends Node

@onready var dialogue_markers = $Markers
@onready var dialogue_ui = $DialogueUI

# TO DO: Here goes the loading of the dialogue from a JSON file

# Setting up the dialogue box for use
var dialogue_box_scene_path = "res://scenes/dialogue_box.tscn"
var dialogue_box_scene: PackedScene = load(dialogue_box_scene_path)

func _ready() -> void:
	# Connect the marker click signal from all markers dynamically
	for sprite in dialogue_markers.get_children():
		if sprite.has_signal('marker_clicked'):
			sprite.connect('marker_clicked', on_marker_clicked)
			
func on_marker_clicked(marker_id, marker_status):
	# We need to disable this process while one run is going through
	if !GameLogic.dialogue_in_motion:
		GameLogic.dialogue_in_motion = true
		# TO DO: write this function
		# Set the marker in focus flag
		GameLogic.marker_in_focus = int(marker_id)
		GameLogic.marker_status_in_focus = int(marker_status)
		# Create dialogue box
		create_dialogue_box()
		# Portray dialogue -> this happens in the dialogue_box
		# Portray options
		# Call dialogue based on option
		# Delete dialogue box and release mouse movement upon Exit + set dialogue_in_motion to false
		print('Marker in focus: ' + str(GameLogic.marker_in_focus))
		print('Marker status level: ' + str(GameLogic.marker_status_in_focus))
		print('Signal received from marker number ' + str(marker_id))

func create_dialogue_box():
	var dialogue_box_instance = dialogue_box_scene.instantiate()
	dialogue_ui.add_child(dialogue_box_instance)
	
	# Make the box appear
	dialogue_box_instance.get_node('Sprite/AnimationPlayer').play('DialogueBoxAppears')
