extends Spatial
class_name Cube

var shrink_speed = 5

export(Color, RGBA) var base_color

func _ready() -> void:
	$AnimationPlayer.connect("animation_finished", self, "queue_free")
	
func _physics_process(delta: float) -> void:
	pass
#	scale = scale.linear_interpolate(Vector3(0,0,0), delta * shrink_speed)
func eliminate():
	queue_free()
