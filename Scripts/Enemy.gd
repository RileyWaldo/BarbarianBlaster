extends PathFollow3D

@export var moveSpeed: float = 5
@export var damage: int = 1

@onready var base: Base = get_tree().get_first_node_in_group("base")

func _process(delta: float) -> void:
	progress += delta * moveSpeed
	
	if(progress_ratio >= 1.0):
		base.TakeDamage(damage)
		process_mode = Node.PROCESS_MODE_DISABLED
