extends Sprite2D

@onready var marker_label = $Label

# The Marker's Unique ID
@export var marker_id = 0
@export var marker_name = 'Place Town'

# Signal: When clicked
signal marker_clicked(marker_id)

func _ready():
	# Enable input on the marker's sprite
	set_process_input(true)
	
	# Set the marker's name
	marker_label.text = marker_name

func _input(event):
	# Check for click on the marker
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			var local_pos = to_local(event.position)
			var texture_size = get_texture().get_size()
			if Rect2(Vector2.ZERO, texture_size).has_point(local_pos):
				emit_signal('marker_clicked', marker_id)
				print('Marker clicked: ' + str(marker_id))
