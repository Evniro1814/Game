extends "res://addons/SDK/Scripts/Common/FSM/State/BaseState.gd"

onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")
var input_dir:Vector3 = Vector3.ZERO



var is_falling:bool

var toggle_walk_run:bool = true# true = run
var run_walk:bool

var state_machine
var player_controller:PlayerController

func on_enter(object):
	state_machine = object
	player_controller = object.owner

func handle_input():
	if Input.is_action_just_pressed("toggle_walk_run"):
		toggle_walk_run = !toggle_walk_run

func handle_events(_event):
	pass

