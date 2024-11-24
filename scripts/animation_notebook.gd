extends AnimationPlayer

var is_on_screen = false
var is_animating = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Block animations until the previous one is done
	if Input.is_action_just_pressed('toggle_notebook') and !is_animating: 
		if is_on_screen:
			is_animating = true
			play('SlideDown')
			is_on_screen = false
		elif !is_on_screen:
			is_animating = true
			play('SlideUp')
			is_on_screen = true

# Allow new animations when the previous one is finished
func _on_AnimationPlayer_animation_finished(anim_name: StringName) -> void:
	is_animating = false
