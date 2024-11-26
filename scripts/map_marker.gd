@tool
extends Sprite2D

@onready var marker_label = $Label

# The Marker's Unique ID
@export var marker_id = 0:
	set(value): marker_id = value
@export var marker_name = 'Place Town':
	set(value):
		marker_name = value
		# Update label text in editor
		if marker_label: marker_label.text = marker_name

# Signal: When clicked
signal marker_clicked(marker_id)

func _ready():	
	# Set the marker's name
	marker_label.text = marker_name

func _on_MarkerArea_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	# Check for click on the marker
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal('marker_clicked', marker_id)
