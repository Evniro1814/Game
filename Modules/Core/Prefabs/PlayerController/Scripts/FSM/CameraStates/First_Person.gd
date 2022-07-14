#first person camera state
extends "res://Modules/Core/Prefabs/PlayerController/Scripts/FSM/BaseStates/BaseCameraState.gd"
var total_pitch:=0.0
var yaw:float = 0
const first_person_cam_pos = Vector3(0,2.7,-1)
func on_enter(object):
	.on_enter(object)
	if player_controller.camera:
		player_controller.camera.get_parent_spatial().translation = Vector3(0,2.7,-1)
		

func on_exit():
	print("on_exit")
	
func handle_events(event):
	if event is InputEventMouseMotion:
		mouse_position = event.get_relative()
	

func handle_input():
	mouse_position = Vector2.ZERO
	if Input.is_action_just_pressed("change_camera_mode"):
		return "third_person"
	return ""

func update(delta):
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if mouse_position != Vector2.ZERO:
			yaw = fmod(yaw-mouse_position.x * system_script.get_options().mouse_sensitivity,360)
			total_pitch = max(min(total_pitch - mouse_position.y*system_script.get_options().mouse_sensitivity,90),-90)
			player_controller.set_rotation(Vector3(0,deg2rad(yaw),0))
			player_controller.camera.set_rotation((Vector3(deg2rad(total_pitch),0,0)))
