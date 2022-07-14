extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/PlayerMovementState.gd"

func on_enter(object):
	if !player_controller:
		.on_enter(object)
	#state_machine.velocity = Vector3.ZERO
	
func on_exit():
	print("on exit falling")
	
func handle_input():
	.handle_input()
	if (player_controller as KinematicBody).is_on_floor():#and velocity.is_equal_approx(Vector3.ZERO):
		return "m_grounded"
	return ""
	
func update(delta):
	if not player_controller.is_on_floor():
		state_machine.velocity += gravity * delta
	
	player_controller.move_and_slide_with_snap(state_machine.velocity,Vector3.ZERO,Vector3.UP)
	#print("falling")
