#inherit this and link this in Effect reference
extends Node
class_name EffectNode
var effect_id
var effect_name
var effect_description

var time_left
func _init(Effect):
	if Effect is String:
		pass
	elif Effect is EffectReference:
		pass

func hp_regen_allowed(Player)->bool:
	return false
#Only adds to a final rate
func get_hp_regen_rate(Player)->float:
	return 0.0

#
func stamina_regen_allowed(Player)->bool:
	return false

func get_stamina_regen_rate(Player)->float:
	return 0.0
	
func mana_regen_allowed(Player)->bool:
	return false
	
func get_mana_regen_rate(Player)->float:
	return 0.0
