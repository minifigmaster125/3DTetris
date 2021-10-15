extends Spatial

onready var tween = $Pivot/Tween

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if tween.is_active():
		$Pivot/w_key.look_at(Vector3(-100, -100, -100), Vector3.UP)
		$Pivot/s_key.look_at(Vector3(-100,-100,-100), Vector3.UP)
		$Pivot/d_key.look_at(Vector3(-100,-100,-100), Vector3.UP)
		
func _rotate_heading(positive) -> void:
	print("SIGNALED")
	if (not positive):
		tween.interpolate_property($Pivot, "rotation:y", $Pivot.rotation.y, $Pivot.rotation.y + deg2rad(90.0), 0.2)
	else:
		tween.interpolate_property($Pivot, "rotation:y", $Pivot.rotation.y, $Pivot.rotation.y + deg2rad(-90.0), 0.2)
	tween.start()


