extends Node

@onready var dialogue_markers = $Markers
@onready var dialogue_ui = $DialogueUI

# TO DO: Here goes the loading of the dialogue from a JSON file

signal dialogue_created

# Setting up the dialogue box for use
var dialogue_box_scene_path = "res://scenes/dialogue_box.tscn"
var dialogue_box_scene: PackedScene = load(dialogue_box_scene_path)

func _ready() -> void:
	# Connect the marker click signal from all markers dynamically
	for sprite in dialogue_markers.get_children():
		if sprite.has_signal('marker_clicked'):
			sprite.connect('marker_clicked', on_marker_clicked)

func get_marker_status(marker_id):
	if marker_id in GameLogic.marker_data:
		return GameLogic.marker_data[marker_id]["status"]
	else:
		return 1

func on_marker_clicked(marker_id, marker_status):
	# We need to disable this process while one run is going through
	if !GameLogic.dialogue_in_motion:
		GameLogic.dialogue_in_motion = true
		# TO DO: write this function
		# Set the marker in focus flag
		GameLogic.marker_in_focus = int(marker_id)
		GameLogic.marker_status_in_focus = int(get_marker_status(marker_id))
		# Create dialogue box
		create_dialogue_box()
		# The rest will be dealt by the dialogue box and the Dialogue node respectively

func create_dialogue_box():
	var dialogue_box_instance = dialogue_box_scene.instantiate()
	dialogue_ui.add_child(dialogue_box_instance)
	
	# Make the box appear
	dialogue_box_instance.get_node('Sprite/AnimationPlayer').play('DialogueBoxAppears')
	
	emit_signal('dialogue_created')
