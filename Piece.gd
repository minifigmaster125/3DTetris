extends Spatial

class_name Piece
var left_axis_rotated = 0
var up_axis_rotated = 0
var length = 4
var width = 4

func _process(delta: float) -> void:
	pass
#	DebugOverlay.draw.add_vector(self, "transform:basis:z", 1, 4, Color.yellow)
#	DebugOverlay.draw.add_vector(self, "transform:basis:x", 1, 4, Color.red)
#	DebugOverlay.draw.add_vector(self, "transform:basis:y", 1, 4, Color.green)

func get_children_without_outline(outlined: bool) -> Array:
	var children = .get_children()
	if outlined:
		children.pop_back()
	return children

func can_move(direction: String, length: int, width: int) -> bool: 
	for cube in get_children_without_outline(true):
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
	
func rotate_block(event: InputEvent) -> void:
	if event.is_action_pressed("left"):
		rotate(Vector3.UP, PI/2.0)
		if left_axis_rotated == 0:
			match up_axis_rotated:
				0:
					global_translate(Vector3(-1, 0, 1))
					up_axis_rotated = 1
				1:
					global_translate(Vector3(-1, 0, -1))
					up_axis_rotated = 2
				2:
					global_translate(Vector3(1, 0, -1))
					up_axis_rotated = 3
				3:
					global_translate(Vector3(1, 0, 1))
					up_axis_rotated = 0
		global_translate(shift_required())
	if event.is_action_pressed("right"):
		rotate(Vector3.UP, -PI/2.0)
		if left_axis_rotated == 0:
			match up_axis_rotated:
				0:				
					global_translate(Vector3(-1, 0, -1))
					up_axis_rotated = 3
				3:
					global_translate(Vector3(-1, 0, 1))
					up_axis_rotated = 2
				2:
					global_translate(Vector3(1, 0, 1))
					up_axis_rotated = 1
				1:
					global_translate(Vector3(1, 0, -1))
					up_axis_rotated = 0
		global_translate(shift_required())
	if event.is_action_pressed("up"):
		rotate(Vector3.LEFT, PI/2.0)
		if up_axis_rotated == 0:
			match left_axis_rotated:
				0:
					global_translate(Vector3(0, 1, 1))
					left_axis_rotated = 1
				1:
					global_translate(Vector3(0, -1, -1))
					left_axis_rotated = 0
				2:
					global_translate(Vector3(0, -1, 1))
					left_axis_rotated = 0
		global_translate(shift_required())
		
	if event.is_action_pressed("down"):
		rotate(Vector3.LEFT, -PI/2.0)
		if up_axis_rotated == 0:
			match left_axis_rotated:
				0:
					global_translate(Vector3(0, 1, -1))
					left_axis_rotated = 2
				1:
					global_translate(Vector3(0, -1, -1))
					left_axis_rotated = 0
				2:
					global_translate(Vector3(0, -1, 1))
					left_axis_rotated = 0
		global_translate(shift_required())
	
func shift_required() -> Vector3:
	var xshift = 0
	var yshift = 0
	var zshift = 0
	for cube in get_children_without_outline(true):
		var origin = cube.global_transform.origin
		print (origin)
		if origin.x < (-length * 2) + 1:
			var shift = (-length * 2) + 1 - origin.x 
			xshift = shift if shift > xshift else xshift
		if origin.x > -1:
			xshift = -1 * ( origin.x + 1 if origin.x > xshift else xshift )
		if origin.z < (-width * 2) + 1:
			var shift = (-width * 2) + 1 - origin.z 
			zshift = shift if shift > zshift else zshift
		if origin.z > -1:
			zshift = -1 * (origin.z +1 if origin.z > zshift else zshift)
		if origin.y < 1:
			var shift = 1 - origin.y 
			yshift = shift if shift > yshift else yshift
		print(zshift)
	var shift = Vector3(xshift, yshift, zshift)

	print (shift)
	return shift

			
			
