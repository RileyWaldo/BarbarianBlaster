extends Node3D

class_name Base

@export var maxHealth: int = 10

@onready var labelHealth: Label3D = $Label3D

var health: int:
	set(healthIn):
		health = healthIn
		labelHealth.text = str(health) + "/" + str(maxHealth)
		labelHealth.modulate = Color.RED.lerp(Color.WHITE, float(health) / float(maxHealth))
		
		if(health <= 0):
			get_tree().reload_current_scene()

func _ready() -> void:
	health = maxHealth

func TakeDamage(damage: int) -> void:
	health -= damage
