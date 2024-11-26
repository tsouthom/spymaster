extends Camera2D

var move_speed = 300
var follow_speed = 2
var edge_threshold = 40 # Distance from the screen edge to trigger movement
var screen_size = Vector2()

func _ready():
	# Cache the screen size once at startup
	screen_size = get_viewport().size

func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var mouse_input = Vector2()
	
	# Is mouse near the edges
	if mouse_pos.x <= edge_threshold:
		mouse_input.x = -1 # Move left
	elif mouse_pos.x >= screen_size.x - edge_threshold:
		mouse_input.x = 1 # Move right
	
	if mouse_pos.y <= edge_threshold:
		mouse_input.y = -1  # Move up
	elif mouse_pos.y >= screen_size.y - edge_threshold:
		mouse_input.y = 1  # Move down
		
	# Apply mouse movement
	position += mouse_input.normalized() * move_speed * delta
