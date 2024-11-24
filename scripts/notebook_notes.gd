extends VBoxContainer

var notes = []

func add_note(note_text: String) -> void:
	notes.append(note_text)
	update_notes()

func update_notes():
	# Clear all existing children in the VBoxContainer
	for child in get_children():
		child.queue_free()
	
	# Add new notes to the container
	for note in notes:
		var note_label = Label.new()
		note_label.autowrap_mode = true
		note_label.text = note
		add_child(note_label)
