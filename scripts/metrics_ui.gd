extends CanvasLayer

@onready var loyalty_label = $PanelContainer/MarginContainer/GridContainer/LoyaltyPoints
@onready var cland_label = $PanelContainer/MarginContainer/GridContainer/ClandestineMoves
@onready var bribe_label = $PanelContainer/MarginContainer/GridContainer/BribeBags

func _process(_delta: float) -> void:
	loyalty_label.text = str(PlayerMetrics.legitimacy)
	cland_label.text = str(PlayerMetrics.cland_moves)
	bribe_label.text = str(PlayerMetrics.bribe_bags)
