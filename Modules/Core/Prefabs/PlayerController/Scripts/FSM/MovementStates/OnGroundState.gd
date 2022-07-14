extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/PlayerMovementState.gd"

func on_enter(object):
	if !player_controller:
		.on_enter(object)
	state_machine.velocity = Vector3.ZERO

func on_exit():
	pass

func handle_input():
	.handle_input()
	if Input.is_action_pressed("move_forward") or Input.is_action_pressed("move_back") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		return "m_movement"

	if Input.is_action_just_pressed("jump"):
		return "m_jump"
	
	if !(player_controller as KinematicBody).is_on_floor() and state_machine.velocity.y < 0:
		return "m_falling"
	return ""

func update(delta):
	if not player_controller.is_on_floor():
		state_machine.velocity += gravity * delta
	#var inertia_value = (state_machine.inertia_curve as Curve).interpolate(state_machine.velocity_inertia.normalized().length())
	#print(state_machine.velocity_inertia.normalized().length())
	
	player_controller.move_and_slide_with_snap(state_machine.velocity,Vector3.DOWN,Vector3.UP)
	#print("grounded")
	#print(state_machine.velocity_inertia)
