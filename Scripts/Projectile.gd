extends Area3D

@export var speed := 30.0

var direction := Vector3.FORWARD
var damage: int = 1

func _physics_process(delta: float) -> void:
	position += direction * delta * speed


func _on_despawn_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if(area.is_in_group("enemy")):
		area.get_parent().TakeDamage(1)
		queue_free()
