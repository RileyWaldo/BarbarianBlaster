extends Path3D

@export var difficultyManager: Node
@export var enemyScene: PackedScene

@onready var spawnTimer: Timer = $SpawnTimer

func SpawnEnemy() -> void:
	var newEnemy = enemyScene.instantiate()
	newEnemy.maxHealth = difficultyManager.GetEnemyHealth()
	add_child(newEnemy)
	spawnTimer.wait_time = difficultyManager.GetSpawnTime()


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	spawnTimer.stop()
