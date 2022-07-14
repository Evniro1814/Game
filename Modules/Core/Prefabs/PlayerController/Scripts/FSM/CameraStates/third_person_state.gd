#Third person camera state
extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/BaseCameraState.gd"



func on_enter(object):
	.on_enter(object)
	player_controller.camera.get_parent_spatial().translation = Vector3(0,2.7,2)
	
func on_exit():
	pass
	
func handle_events(event):
	if event is InputEventMouseMotion:
		mouse_position = event.get_relative()
	pass

func handle_input():
	if Input.is_action_just_pressed("change_camera_mode"):
		return "first_person"
	return ""

func update(delta):
	
	pass
