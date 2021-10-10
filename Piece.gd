extends Spatial

class_name Piece

func _process(delta: float) -> void:
	DebugOverlay.draw.add_vector(self, "transform:basis:z", 1, 4, Color.yellow)
	DebugOverlay.draw.add_vector(self, "transform:basis:x", 1, 4, Color.red)
	DebugOverlay.draw.add_vector(self, "transform:basis:y", 1, 4, Color.green)

func can_move(direction: String, length: int, width: int) -> bool: 
	for cube in get_children():
		match(direction):
			"left":
				if cube.global_transform.origin.z + 1 == 0:
					return false
			"right":
				if cube.global_transform.origin.z - 1 == -width * 2:
					return false
			"up":
				if cube.global_transform.origin.x - 1 == -length * 2:
					return false
			"down":
				if cube.global_transform.origin.x + 1 == 0:
					return false
	return true
	
#func rotate(angle: float) -> void:
	
