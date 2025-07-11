extends CharacterBody2D
var SPEED = 300.0
var JUMP_VELOCITY = -600.0
var JUMP_REDUCE = 0.0
var SPEED_MULT = 1
var STAMINA = 200
var FAKESTAMINA = 2
var DISPLAYSTAMINA = 1
func reload_level():
	if get_tree():
		get_tree().reload_current_scene()
func _physics_process(delta: float) -> void:
	# Add the gravity.
	DISPLAYSTAMINA = FAKESTAMINA - 1.006
	get_parent().get_parent().get_parent().get_node("GUI/Base/Stamina").scale = Vector2(DISPLAYSTAMINA, 1)
	if Input.is_action_pressed("shift") and Input.is_action_pressed("AD"):
		SPEED_MULT = 1 * FAKESTAMINA
		if STAMINA < 100:
			STAMINA = 100
		STAMINA = STAMINA - 0.6
		FAKESTAMINA = STAMINA * 0.1 * 0.1
	else:
		if STAMINA > 200:
			STAMINA = 200
		SPEED_MULT =  0.8
		STAMINA = STAMINA + 0.75
		FAKESTAMINA = STAMINA * 0.1 * 0.1
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY - JUMP_REDUCE
		JUMP_REDUCE = JUMP_REDUCE - 120.0
	if Input.is_action_pressed("W") and is_on_floor():
		velocity.y = JUMP_VELOCITY - JUMP_REDUCE
		JUMP_REDUCE = JUMP_REDUCE - 120.0
	if Input.is_action_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY - JUMP_REDUCE
		JUMP_REDUCE = JUMP_REDUCE - 120.0
	JUMP_REDUCE += 2
	if JUMP_REDUCE < -240:
		JUMP_REDUCE = -240
	if JUMP_REDUCE >= 0:
		JUMP_REDUCE = 0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * SPEED * SPEED_MULT
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * SPEED_MULT)

	move_and_slide()
	var direction2:= Input.get_axis("ui_left", "ui_right")
	if direction2:
		velocity.x = direction2 * SPEED * SPEED_MULT
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * SPEED_MULT)

	move_and_slide()
	if direction == 0 or direction2 == 0:
		SPEED = 300
	if direction != 0 and direction2 != 0:
		SPEED = 150


func _on_area_2d_body_entered(body: Node2D) -> void:
	reload_level()
