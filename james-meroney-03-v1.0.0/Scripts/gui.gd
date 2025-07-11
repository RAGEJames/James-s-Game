extends Node2D
func _process(delta: float) -> void:
	if get_parent().get_node("W1").is_visible():
		get_node("Base").position = Vector2(get_parent().get_node("W1/PLAYER/Player").position)
	if get_parent().get_node("W2").is_visible():
		get_node("Base").position = Vector2(get_parent().get_node("W2/PLAYER/Player").position)
