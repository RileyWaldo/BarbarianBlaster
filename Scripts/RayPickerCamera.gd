extends Camera3D

@export var gridMap: GridMap
@export var rayMaxDistance: float = 100.0
@export var turretManager: Node3D
@export var turretCost: int = 100

@onready var rayCast: RayCast3D = $RayCast3D
@onready var bank: Bank = get_tree().get_first_node_in_group("bank")

func _process(_delta: float) -> void:
	var mousePos: Vector2 = get_viewport().get_mouse_position()
	rayCast.target_position = project_local_ray_normal(mousePos) * rayMaxDistance
	rayCast.force_raycast_update()
	
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	
	if(bank.gold < turretCost):
		return
	
	if(rayCast.is_colliding()):
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		
		if(!Input.is_action_just_pressed("click")):
			return
		var collider = rayCast.get_collider()
		if(collider is GridMap):
			var collisionPoint = rayCast.get_collision_point()
			var cell = gridMap.local_to_map(collisionPoint)
			if(gridMap.get_cell_item(cell) != 0):
				return
			gridMap.set_cell_item(cell, 1)
			var tilePosition = gridMap.map_to_local(cell)
			turretManager.BuildTurret(tilePosition)
			bank.gold -= turretCost
