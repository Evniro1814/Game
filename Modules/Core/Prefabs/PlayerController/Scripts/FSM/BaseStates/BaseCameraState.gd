extends BaseState

var player_controller:PlayerController
var alt_camera_mode:bool#for third person rotate around character for fp rotate head
onready var system_script = $"/root/System"
var mouse_position:Vector2

func on_enter(object:PlayerController):
	if !player_controller:
		player_controller = object
