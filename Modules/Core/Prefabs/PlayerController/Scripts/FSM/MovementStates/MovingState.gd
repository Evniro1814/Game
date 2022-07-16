extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/PlayerMovementState.gd"
var speed_modifier:float
const walking_speed = 0.7
const running_speed = 1.3
func on_enter(object):
	if !player_controller:
		.on_enter(object)
	#print("on_enter mov")
func on_exit():
	#print("on_exit mv")
	pass
func handle_input():
	.handle_input()
	input_dir = Vector3.ZERO
	if toggle_walk_run:#true = run
		if Input.is_action_pressed("run_walk"):#walking
			speed_modifier = walking_speed
		else:
			speed_modifier = running_speed
	else:
		if Input.is_action_pressed("run_walk"):#running
			speed_modifier = running_speed
		else:
			speed_modifier = walking_speed
	if Input.is_action_pressed("move_forward"):
		input_dir += Vector3.FORWARD
	elif Input.is_action_pressed("move_back"):
		input_dir += Vector3.BACK
	if Input.is_action_pressed("move_left"):
		input_dir += Vector3.LEFT
	elif Input.is_action_pressed("move_right"):
		input_dir += Vector3.RIGHT
	if Input.is_action_pressed("sprint"):
		return "m_sprint"
	
	if Input.is_action_just_pressed("jump"):
		return "m_jump"
	if !(player_controller as KinematicBody).is_on_floor() and state_machine.velocity.y < 0:
		return "m_falling"
	if input_dir == Vector3.ZERO:
		return "m_grounded"
	
	return ""
	

func update(delta):
	if not player_controller.is_on_floor():
		state_machine.velocity += gravity * delta
		
	var direction = (player_controller.transform.basis * Vector3(input_dir.x, 0, input_dir.z)).normalized()
	
	if direction:
		state_machine.velocity.x = direction.x * 5* speed_modifier
		state_machine.velocity.z = direction.z * 5* speed_modifier
	else:
		state_machine.velocity.x = move_toward(state_machine.velocity.x, 0, 5)
		state_machine.velocity.z = move_toward(state_machine.velocity.z, 0, 5)
	
	#if !player_controller.test_move(player_controller.transform,state_machine.velocity_inertia):#Swap
	state_machine.velocity_inertia = player_controller.move_and_slide_with_snap(state_machine.velocity,Vector3.DOWN,Vector3.UP)
	#print("movement",state_machine.velocity)
	#print(state_machine.velocity_inertia)
