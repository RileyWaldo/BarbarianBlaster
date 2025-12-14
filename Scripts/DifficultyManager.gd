extends Node

@export var gameLength: float = 30.0
@export var spawnTimeCurve: Curve
@export var enemyHealthCurve: Curve

signal stopSpawningEnemies

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.start(gameLength)


func GameProgressRatio() -> float:
	return 1.0 - (timer.time_left / gameLength)
	
func GetSpawnTime() -> float:
	return spawnTimeCurve.sample(GameProgressRatio())
	
func GetEnemyHealth() -> float:
	return enemyHealthCurve.sample(GameProgressRatio())


func _on_timer_timeout() -> void:
	stopSpawningEnemies.emit()
