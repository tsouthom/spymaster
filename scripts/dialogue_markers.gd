extends Node

@onready var dialogue_markers = $"."

# TO DO: Here goes the loading of the dialogue from a JSON file

func _ready() -> void:
	# Connect the marker click signal from all markers dynamically
	for sprite in dialogue_markers.get_children():
		if sprite.has_signal('marker_clicked'):
			print(sprite.name + ' has signal marker_clicked')
			sprite.connect('marker_clicked', on_marker_clicked)
			
func on_marker_clicked(marker_id):
	# TO DO: write this function
	print('Signal received from' + str(marker_id))
