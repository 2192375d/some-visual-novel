extends Camera2D

const SPEED = 400

func _physics_process(delta: float) -> void:
	position += Input.get_vector("left", "right", "up", "down") * SPEED * delta
