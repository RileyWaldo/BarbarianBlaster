extends PathFollow3D

@export var moveSpeed: float = 5
@export var damage: int = 1
@export var maxHealth: int = 2
@export var goldReward: int = 15

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var health: int = maxHealth
@onready var base: Base = get_tree().get_first_node_in_group("base")
@onready var bank: Bank = get_tree().get_first_node_in_group("bank")

func _process(delta: float) -> void:
	progress += delta * moveSpeed
	
	if(progress_ratio >= 1.0):
		base.TakeDamage(damage)
		process_mode = Node.PROCESS_MODE_DISABLED
		queue_free()

func TakeDamage(damageTaken: int) -> void:
	health -= damageTaken
	animationPlayer.play("TakeDamage")
	if(health <= 0):
		bank.gold += goldReward
		queue_free()
