extends Resource
class_name CharacterSheet
#TODO Сократить количество свойств, перенести в классы - наследники
export var character_name:String
export var character_surname:String
export var character_alias:String#like a short name 

export(int) var health_base
export(int) var mana_base
export(int) var stamina_base


export(int,-1,100) var strenght_value:int#-1 means dead
export(int,-1,100) var agility_value:int#-1 means dead
export(int,-1,100) var constitution_value:int#-1 means dead
export(int,-1,100) var intellect_value:int#-1 means dead
export(int,-1,100) var willpower_value:int#-1 means dead
export(int,-1,100) var charisma_value:int#-1 means dead

#>100 = mythic skill
#Strenght - these aren't strict
export(int,0,200) var skill_swordsman
export(int,0,200) var skill_pikeman
export(int,0,200) var skill_axeman
export(int,0,200) var skill_blunt_weapon
export(int,0,200) var skill_brawler
export(int,0,200) var skill_weapon_mastery
export(int,0,200) var skill_parrying_master
export(int,0,200) var skill_shield_master
#Agility
export(int,0,200) var skill_dodger
export(int,0,200) var skill_hide_n_seek
export(int,0,200) var skill_parkour
#Const
export(int,0,200) var skill_hard_skin
#intellect
export(int,0,200) var skill_engineer
export(int,0,200) var skill_artisan
export(int,0,200) var skill_alchemist
export(int,0,200) var skill_craftsman
export(int,0,200) var skill_sharp_mind
#willpower
export(int,0,200) var skill_magic_manipulator
export(int,0,200) var skill_magic_negative_energy
export(int,0,200) var skill_magic_psyonic
export(int,0,200) var skill_magic_elementalist
export(int,0,200) var skill_magic_common
#charisma
export(int,0,200) var skill_talker
export(int,0,200) var skill_barterman


export(float,-200,200) var base_resistance_phys_damage
export(float,-200,200) var base_resistance_pure_magic
export(float,-200,200) var base_resistance_negative_energy
export(float,-200,200) var base_resistance_psyonic
export(float,-200,200) var base_resistance_fire
export(float,-200,200) var base_resistance_air
export(float,-200,200) var base_resistance_ground
export(float,-200,200) var base_resistance_water

export(Array) var perks_set

export(Script) var character_script

export(bool) var unique_npc
export(bool) var is_immortal
export(bool) var persistant

export var character_appearance_data:Resource#TODO заменить на AppearanceData

export var inventory_data:Resource#Тоже самое


enum DamageType{
	DAMAGE_PHYS_BLUNT,
	DAMAGE_PHYS_CUT,
	DAMAGE_PHYS_STAB,
	DAMAGE_PURE_MAGIC,
	DAMAGE_NEGATIVE_ENERGY,
	DAMAGE_PSYONIC,
	DAMAGE_FIRE,
	DAMAGE_AIR,
	DAMAGE_GROUND,
	DAMAGE_WATER
}

