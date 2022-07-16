#Grounded state
#Используется во время того, как персонаж стоит, или после остановки
extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/PlayerMovementState.gd"

var inertia_func
var inertia_value
const inertia_reduction_base = 0.02
func on_enter(object):
	if !player_controller:
		.on_enter(object)
	state_machine.velocity = Vector3.ZERO
	inertia_value = 1

func on_exit():
	inertia_func = null

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
	
	player_controller.move_and_slide_with_snap(state_machine.velocity_inertia,Vector3.DOWN,Vector3.UP)
	inertia_func = inertia_routine();
	
	if inertia_func is GDScriptFunctionState and inertia_func.is_valid() and !is_equal_approx(inertia_value,0):
		state_machine.velocity_inertia *= inertia_value
		inertia_func = inertia_func.resume()
	else:
		state_machine.velocity_inertia *= 0

func inertia_routine():
	while !is_equal_approx(inertia_value,0):
		inertia_value -= inertia_reduction_base
		yield()
