extends "res://addons/SDK/Scripts/Common/FSM/StateMachine.gd"
var camera_states:Dictionary

func _ready():
	assert(self.name == "player_camera_state")
	current_state = $First_person
	current_state.on_enter(self.owner)
	camera_states["free_cam"] = $Free_cam
	camera_states["third_person"] = $Third_Person
	camera_states["first_person"] = $First_person
	
	#camera_states["disabled"] = $Disabled

func _physics_process(delta):
	current_state.update(delta)
func _process(delta):
	var ncs = current_state.handle_input()
	if ncs in camera_states.keys():
		current_state.on_exit()
		current_state = camera_states[ncs]
		current_state.on_enter(self.owner)

func _input(event):
	current_state.handle_events(event)
