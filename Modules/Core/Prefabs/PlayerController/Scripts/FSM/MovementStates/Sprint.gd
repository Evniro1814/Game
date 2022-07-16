extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/MovementStates/MovingState.gd"
func on_enter(object):
	if !player_controller:
		.on_enter(object)
	#print("reference")
	speed_modifier = 3
	#print("on_enter mov")
func on_exit():
	#print("on_exit mv")
	pass
func handle_input():
	input_dir = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		input_dir += Vector3.FORWARD
	elif Input.is_action_pressed("move_back"):
		input_dir += Vector3.BACK
	if Input.is_action_pressed("move_left"):
		input_dir += Vector3.LEFT
	elif Input.is_action_pressed("move_right"):
		input_dir += Vector3.RIGHT
	if Input.is_action_just_released("sprint"):
		return "m_movement"
	if Input.is_action_just_pressed("jump"):
		return "m_jump"
	if !(player_controller as KinematicBody).is_on_floor() and state_machine.velocity.y < 0:
		return "m_falling"
	if input_dir == Vector3.ZERO:
		return "m_grounded"
	
	return ""
	

func update(delta):
	.update(delta)
	#print("sprinting")
