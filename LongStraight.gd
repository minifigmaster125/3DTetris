extends Piece

#var left_axis_rotated = 0
#var up_axis_rotated = 0

#func rotate_block(event: InputEvent) -> void:
#	if event.is_action_pressed("left"):
#		rotate(Vector3.UP, PI/2.0)
#		if left_axis_rotated == 0:
#			match up_axis_rotated:
#				0:
#					global_translate(Vector3(-1, 0, 1))
#					up_axis_rotated = 1
#				1:
#					global_translate(Vector3(-1, 0, -1))
#					up_axis_rotated = 2
#				2:
#					global_translate(Vector3(1, 0, -1))
#					up_axis_rotated = 3
#				3:
#					global_translate(Vector3(1, 0, 1))
#					up_axis_rotated = 0
#	if event.is_action_pressed("right"):
#		rotate(Vector3.UP, -PI/2.0)
#		if left_axis_rotated == 0:
#			match up_axis_rotated:
#				0:				
#					global_translate(Vector3(-1, 0, -1))
#					up_axis_rotated = 3
#				3:
#					global_translate(Vector3(-1, 0, 1))
#					up_axis_rotated = 2
#				2:
#					global_translate(Vector3(1, 0, 1))
#					up_axis_rotated = 1
#				1:
#					global_translate(Vector3(1, 0, -1))
#					up_axis_rotated = 0
#	if event.is_action_pressed("up"):
#		rotate(Vector3.LEFT, PI/2.0)
#		if up_axis_rotated == 0:
#			match left_axis_rotated:
#				0:
#					global_translate(Vector3(0, 1, 1))
#					left_axis_rotated = 1
#				1:
#					global_translate(Vector3(0, -1, -1))
#					left_axis_rotated = 0
#				2:
#					global_translate(Vector3(0, -1, 1))
#					left_axis_rotated = 0
#
#	if event.is_action_pressed("down"):
#		rotate(Vector3.LEFT, -PI/2.0)
#		match left_axis_rotated:
#			0:
#				global_translate(Vector3(0, 1, -1))
#				left_axis_rotated = 2
#			1:
#				global_translate(Vector3(0, -1, -1))
#				left_axis_rotated = 0
#			2:
#				global_translate(Vector3(0, -1, 1))
#				left_axis_rotated = 0

