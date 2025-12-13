extends Node3D

@export var turret: PackedScene
	
func BuildTurret(turretPosition: Vector3) -> void:
	var newTurret: Node3D = turret.instantiate()
	add_child(newTurret)
	newTurret.global_position = turretPosition
