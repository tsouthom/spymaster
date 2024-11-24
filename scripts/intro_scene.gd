extends CanvasLayer

@onready var animation_player = $Throne/AnimationPlayer

func _ready():
	await get_tree().create_timer(1).timeout
	animation_player.play('ThroneAppears')
