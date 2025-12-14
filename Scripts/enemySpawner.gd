extends Path3D

@export var enemyScene: PackedScene

func SpawnEnemy() -> void:
	var newEnemy = enemyScene.instantiate()
	add_child(newEnemy)
