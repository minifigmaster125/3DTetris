extends Piece

var mat = preload("res://zPieceMat.tres")

func _ready() -> void:
	var cubes = get_children_without_outline(true)
	for cube in cubes:
		cube.get_node("CSGBox").material_override = mat
