extends Camera3D

@export var rayMaxDistance: float = 100.0

@onready var rayCast: RayCast3D = $RayCast3D

func _process(_delta: float) -> void:
	var mousePos: Vector2 = get_viewport().get_mouse_position()
	rayCast.target_position = project_local_ray_normal(mousePos) * rayMaxDistance
	rayCast.force_raycast_update()
	
	printt(rayCast.get_collider(), rayCast.get_collision_point())
	
