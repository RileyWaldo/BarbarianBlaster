extends MarginContainer

class_name Bank

@export var startingGold: int = 150

var gold: int:
	set(goldIn):
		gold = max(0, goldIn)
		$GoldLabel.text = "Gold: " + str(gold)
		
func _ready() -> void:
	gold = startingGold
