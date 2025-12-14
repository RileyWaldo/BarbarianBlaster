extends PathFollow3D

@export var moveSpeed: float = 5
@export var damage: int = 1
@export var maxHealth: int = 2

@onready var health: int = maxHealth
@onready var base: Base = get_tree().get_first_node_in_group("base")

func _process(delta: float) -> void:
	progress += delta * moveSpeed
	
	if(progress_ratio >= 1.0):
		base.TakeDamage(damage)
		process_mode = Node.PROCESS_MODE_DISABLED

func TakeDamage(damageTaken: int) -> void:
	health -= damageTaken
	if(health <= 0):
		queue_free()
