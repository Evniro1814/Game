#should be a node
#that is a parent to states
extends Node

signal state_changed(prev_state,new_state)

var current_state:Node

func _init():
	printerr("DO NOT USE THIS, INHERIT FROM THIS!")
