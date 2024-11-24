extends Panel

var is_on_screen = false

# Children nodes references
@onready var animation_player = $AnimationPlayer
@onready var notes_container = $NotesContainer

func _ready() -> void:
	add_note('The King has been ill for five days now.')
	add_note('There is something wrong in the kingdom of Denmark. I must find out what.')
	add_note('Buy milk from the apothecary.')
	notes_container.update_notes()

func _input(event) -> void:
	# Block animations until the previous one is done
	if event.is_action_pressed('toggle_notebook'): 
		toggle_notebook()
		
func toggle_notebook() -> void:
	if animation_player.is_playing():
		return # Block input if an animation is in progress
	
	if is_on_screen:
		animation_player.play('SlideDown')
		get_tree().paused = false # Resume the game
	elif !is_on_screen:
		animation_player.play('SlideUp')
		get_tree().paused = true # Pause the game while player checks notebook
	
	is_on_screen = !is_on_screen

# Not sure how we will set this up in the game,
# but for now it helps us in testing
func add_note(note_text: String):
	notes_container.add_note(note_text)


func _on_AnimationPlayer_animation_finished(anim_name: StringName) -> void:
	if anim_name == 'SlideDown':
		notes_container.visible = false # Hide notes when notebook is closed
	elif anim_name == 'SlideUp':
		notes_container.visible = true # Show notes when notebook is opened
