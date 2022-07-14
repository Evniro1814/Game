extends Node
class_name CharacterEffectsNode
signal effect_added(effect)
signal effect_deleted(effect)

func add_effect(effect:EffectReference):
	emit_signal("effect_added",effect)
func delete_effect(effect:EffectReference):
	emit_signal("effect_deleted",effect)
func effect_expired():
	pass

func _ready():
	assert(self.name == "character_effects_node")

func calculate_effects()->FinalCharacterStats:
	return null

func has_effect(effect)->bool:
	return false

class FinalCharacterStats:
	var allow_hp_regen:bool
	var allow_mana_regen:bool
	var allow_stamina_regen:bool
	#these do not count base rates
	var hp_regen_rate
	var stamina_regen_rate
	var mana_regen_rate
