extends Spatial

onready var tween = $Pivot/Tween

	
func _rotate_heading(positive) -> void:
	print("SIGNALED")
	if (not positive):
		tween.interpolate_property($Pivot, "rotation:y", $Pivot.rotation.y, $Pivot.rotation.y + deg2rad(90.0), 0.2)
	else:
		tween.interpolate_property($Pivot, "rotation:y", $Pivot.rotation.y, $Pivot.rotation.y + deg2rad(-90.0), 0.2)
	tween.start()

