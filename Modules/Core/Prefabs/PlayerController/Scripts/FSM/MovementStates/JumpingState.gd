extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/PlayerMovementState.gd"

var player_has_jumped:bool

func on_enter(object):
	if !player_controller:
		.on_enter(object)
	player_has_jumped = false
func on_exit():
	#statevelocity = Vector3.ZERO
	pass
func handle_input():
	.handle_input()
	if state_machine.velocity.y < 0 or (player_controller.is_on_floor() and player_has_jumped):
		return "m_falling"
	return ""

func update(delta):
	if not player_controller.is_on_floor():
		state_machine.velocity += gravity * delta
	if !player_has_jumped and player_controller.is_on_floor():
		state_machine.velocity.y = 200 * delta
		player_has_jumped = true
	
	player_controller.move_and_slide_with_snap(state_machine.velocity,Vector3.ZERO,Vector3.UP)
	#print("Jumping")
