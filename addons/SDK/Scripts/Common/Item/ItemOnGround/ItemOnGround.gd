extends RigidBody
class_name ItemOnGround

export var item_reference:Resource
var item_instance:ItemInstance
var create_new_item_instance:bool = true

func init_existing(_item_instance:ItemInstance):
		create_new_item_instance = false
		#tie instance to item on the ground
		if item_instance:
			item_instance.free()
		item_instance = _item_instance
		return self

func _ready():
	assert(item_reference is ItemReferenceBase)
	if !item_instance && create_new_item_instance:
		if item_reference is MiscItemReference:
			item_instance = MiscItemInstance.new(item_reference)
		else:
			item_instance = ItemInstance.new(item_reference)
		print(item_instance)
	assert(item_instance)

func add_item_to_container(container):
	container.add_item(item_instance)
	self.queue_free()
	
#Removes the item from the game completly
func remove_item():
	item_instance.free()
	self.queue_free()
