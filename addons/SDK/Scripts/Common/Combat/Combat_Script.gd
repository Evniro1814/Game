#Содержит API для боевой системы
extends Node
class_name CombatScript

enum melee_attack_direction{ATTACK_UP,ATTACK_DOWN,ATTACK_LEFT,ATTACK_RIGHT}
export(melee_attack_direction) var attack_direction = melee_attack_direction.ATTACK_LEFT setget set_melee_attack_direction

export (float,-45,45.0) var side_attack_angle setget set_side_attack_angle
export (float,0.0,1.0) var attack_charge

var current_weapon_primary
var current_weapon_secondary
var currently_locked:bool

signal angle_changed(angle)
signal melee_attack_direction_changed(attack_direction)
signal unlocked
signal fully_charged
func set_side_attack_angle(angle:float):
	side_attack_angle = clamp(angle,-45,45)
	emit_signal("angle_changed",angle)

func set_melee_attack_direction(new_attack_direction):
	if attack_direction != new_attack_direction:
		attack_direction = new_attack_direction
		emit_signal("melee_attack_direction_changed",new_attack_direction)


#perhaps, should be a coroutine
func add_charge(charge_rate:float):
	assert (charge_rate <= 1 and charge_rate >0)
	attack_charge += charge_rate
