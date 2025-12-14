extends Node3D

@export var projectile: PackedScene
@export var damage: int = 1
@export var turretRange: float = 10.0

@onready var projectileSpawnPoint: Node3D = %ProjectileSpawnPoint

var enemyPath: Path3D
var currentTarget: PathFollow3D

func _physics_process(_delta: float) -> void:
	currentTarget = FindTarget()
	if(currentTarget):
		look_at(currentTarget.global_position, Vector3.UP, true)

func _on_shoot_timer_timeout() -> void:
	if(currentTarget):
		FireProjectile()
	
func FindTarget() -> PathFollow3D:
	var target = null
	var bestProgress = 0
	for enemy in enemyPath.get_children():
		if(enemy is  not PathFollow3D):
			continue
		if(global_position.distance_squared_to(enemy.global_position) > turretRange * turretRange):
			continue
		if(enemy.progress > bestProgress):
			bestProgress = enemy.progress
			target = enemy
		
	return target
	
func FireProjectile() -> void:
	var newProjectile := projectile.instantiate()
	add_child(newProjectile)
	newProjectile.global_position = projectileSpawnPoint.global_position
	newProjectile.direction = global_transform.basis.z
	newProjectile.damage = damage
