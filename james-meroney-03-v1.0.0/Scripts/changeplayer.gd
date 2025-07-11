extends Node
var r1 = true
func encoll(node):
	for child in node.get_children():
		if child is CollisionShape2D:
			child.disabled = false
		if child is TileMapLayer:
			child.enabled = true
			encoll(child)
func discoll(node):
	for child in node.get_children():
		if child is CollisionShape2D:
			child.disabled = true
		if child is TileMapLayer:
			child.enabled = false
			discoll(child)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("E"):
		get_parent().get_node("W1/PLAYER/Player/Camera2D").enabled = true
		get_parent().get_node("W2/PLAYER/Player/Camera2D").enabled = false
		get_parent().get_node("W1/PLAYER/Player").process_mode = Node.PROCESS_MODE_ALWAYS
		get_parent().get_node("W1").show()
		encoll(get_parent().get_node("W1"))
		get_node("PLAYER/Player").process_mode = Node.PROCESS_MODE_DISABLED
		get_parent().get_node("W2").hide()
		discoll(get_parent().get_node("W2"))
	if Input.is_action_just_pressed("Q"):
		get_parent().get_node("W1/PLAYER/Player/Camera2D").enabled = false
		get_parent().get_node("W2/PLAYER/Player/Camera2D").enabled = true
		get_parent().get_node("W1/PLAYER/Player").process_mode = Node.PROCESS_MODE_DISABLED
		get_parent().get_node("W1").hide()
		discoll(get_parent().get_node("W1"))
		get_node("PLAYER/Player").process_mode = Node.PROCESS_MODE_ALWAYS
		get_parent().get_node("W2").show()
		encoll(get_parent().get_node("W2"))
	if r1 == true:
		get_parent().get_node("W1/PLAYER/Player/Camera2D").enabled = true
		get_parent().get_node("W2/PLAYER/Player/Camera2D").enabled = false
		get_parent().get_node("W1/PLAYER/Player").process_mode = Node.PROCESS_MODE_ALWAYS
		get_parent().get_node("W1").show()
		encoll(get_parent().get_node("W1"))
		get_node("PLAYER/Player").process_mode = Node.PROCESS_MODE_DISABLED
		get_parent().get_node("W2").hide()
		discoll(get_parent().get_node("W2"))
		r1 = false
