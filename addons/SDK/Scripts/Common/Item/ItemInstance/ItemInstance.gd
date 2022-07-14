#Item instance
#Just a data in the engine
extends Reference
class_name ItemInstance

var item_reference:Resource

var unique_id

var name_id
var descriptiom_id

var name_override
var description_override

var weight:float
var icon

var item_prefab


#for saving and keeping in memory unique custom properties
var custom_properties:Dictionary

func _init(item_ref:ItemReferenceBase):
	assert(item_ref is ItemReferenceBase)
	item_reference = item_ref
	item_prefab = load(item_reference.item_prefab_path)
	weight = item_reference.item_weight
	name_id = item_reference.item_name
	descriptiom_id = item_reference.item_description
	icon = item_reference.item_icon

func set_item_property(key:String,value):
	custom_properties[key] = value

func get_custom_property(key:String):
	return custom_properties[key]

func is_equal(another_item:ItemInstance,compare_properties:bool)->bool:
	return false
