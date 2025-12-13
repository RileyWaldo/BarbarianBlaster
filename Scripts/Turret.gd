extends Node3D

@export var projectile: PackedScene

@onready var projectileSpawnPoint: Node3D = %ProjectileSpawnPoint

func _on_shoot_timer_timeout() -> void:
	var newProjectile := projectile.instantiate()
	add_child(newProjectile)
	newProjectile.global_position = projectileSpawnPoint.global_position
