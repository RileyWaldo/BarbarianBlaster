extends Path3D

@export var difficultyManager: Node
@export var enemyScene: PackedScene
@export var victoryCanvas: CanvasLayer

@onready var spawnTimer: Timer = $SpawnTimer

func SpawnEnemy() -> void:
	var newEnemy = enemyScene.instantiate()
	newEnemy.maxHealth = difficultyManager.GetEnemyHealth()
	newEnemy.tree_exited.connect(EnemyDefeated)
	add_child(newEnemy)
	spawnTimer.wait_time = difficultyManager.GetSpawnTime()
	
func EnemyDefeated() -> void:
	if(!spawnTimer.is_stopped()):
		return
	
	for child in get_children():
		if(child is PathFollow3D):
			return
			
	victoryCanvas.visible = true
	


func _on_difficulty_manager_stop_spawning_enemies() -> void:
	spawnTimer.stop()
