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
			
func on_marker_clicked(marker_id):
	# TO DO: write this function
	# Center on marker --IGNORE
	# Create dialogue box
	create_dialogue_box()
	# Pause on map movement until dialogue box is closed --IGNORE
	# Portray dialogue
	# Portray options
	# Call dialogue based on option
	# Delete dialogue box and release mouse movement upon Exit
	print('Signal received from marker number ' + str(marker_id))

func create_dialogue_box():
	var dialogue_box_instance = dialogue_box_scene.instantiate()
	dialogue_ui.add_child(dialogue_box_instance)
	
	# Make the box appear
	dialogue_box_instance.get_node('Sprite/AnimationPlayer').play('DialogueBoxAppears')
