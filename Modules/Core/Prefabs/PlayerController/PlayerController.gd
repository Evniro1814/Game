#handles API for player
#просто обёртка для скриптов
extends KinematicBody
class_name PlayerController

onready var player_movement_fsm = $player_movement_fsm
onready var player_camera_fsm = $player_camera_state


onready var player_data = $player_character_data
onready var player_animation_tree = $AnimationTree
onready var player_inventory = $player_inventory

onready var camera:Camera = $SpringArm/Camera
onready var ray:RayCast = $RayCast
func _ready():
	assert(camera and player_data)
	
func _process(delta):
	pass

func _input(event):
	pass

func add_effect(effect):
	pass

func remove_effect(effect):
	pass

func set_first_person_camera():
	#if player_camera_fsm
	pass
func set_third_person_camera():
	pass

func get_current_camera_state():
	pass
func get_current_movement_state():
	pass
func get_current_movement_direction():
	pass

func add_item():
	pass
func remove_item():
	pass

func get_health():
	pass
func get_stamina():
	pass
func get_mana():
	pass
func set_health():
	pass
func set_stamina():
	pass
func set_mana():
	pass
