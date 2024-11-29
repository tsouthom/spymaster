extends CanvasLayer

@onready var animation_player = $AnimationPlayer

func _ready():
	await get_tree().create_timer(1).timeout
	animation_player.play('ThroneAppears') # Plays for 2 sec
	
	await get_tree().create_timer(4).timeout
	animation_player.play('InstructionsAppear')

func _process(_delta: float) -> void:
	if Input.is_action_pressed("begin_game"):
		var map_scene = preload("res://scenes/main_map.tscn")
		get_tree().change_scene_to_packed(map_scene)
