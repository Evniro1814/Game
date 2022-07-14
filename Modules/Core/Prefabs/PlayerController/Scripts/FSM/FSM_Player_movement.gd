extends "res://addons/SDK/Scripts/Common/FSM/StateMachine.gd"

var movement_states:Dictionary
var current_movement_state

var velocity:Vector3 = Vector3.ZERO #put in here because this needs to be persistant and shared between states
var velocity_inertia = Vector3.ZERO

export var inertia_curve:Curve


func _ready():
	assert(name == "player_movement_fsm")
	current_movement_state = $Grounded
	movement_states["m_grounded"] = $Grounded
	movement_states["m_movement"] = $Movement
	movement_states["m_falling"] = $Falling
	movement_states["m_jump"] = $Jumping
	movement_states["m_sprint"] = $Sprint
	current_movement_state.on_enter(self)
	
func _physics_process(delta):
	if current_movement_state:
		current_movement_state.update(delta)


func _process(delta):
	var nms = current_movement_state.handle_input()
	if nms in movement_states.keys():
		current_movement_state.on_exit()
		current_movement_state = movement_states[nms]
		current_movement_state.on_enter(self)
