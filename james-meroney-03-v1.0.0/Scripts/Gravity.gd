extends CharacterBody2D
func _physics_process(delta: float) -> void:
	if not get_parent().get_node("Player").is_on_floor():
		get_parent().get_node("Player").velocity += get_gravity() * delta
