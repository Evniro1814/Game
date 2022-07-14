#Item container
#handles item storaging
extends Node
class_name ItemContainerBase
#TODO stack
#Найти подходящий стэк
#Если есть стек, соответсвтвующий условиям
#(содержит один и тот же набор вещей и макс размер стека на превышен)
#тогда добавляем данный предмет в стек
#иначе ищем следующий стек
#иначе если нет стеков то создаём новый стек
export var items:Array

func add_item(item:ItemInstance):
	items.append(item)
	print("item added to container: ",item)
	
func remove_item(item_id):
	pass
func remove_item_index(index):
	pass
func drop_item(item_id,pos):
	pass


func drop_item_index(index,pos,parent:Spatial):
	if items.size()>0:
		var item = (items[index] as ItemInstance)
		var itemOnGr:ItemOnGround = (item.item_prefab.instance() as ItemOnGround).init_existing(item)
		parent.add_child(itemOnGr)
		itemOnGr.translation = pos
		print("Item removed: ", item)
		items.remove(index)
	
	

func transfer_item(item,inventory):
	pass

func has_item_reference(item):
	pass

func has_item_id(item_id):
	pass
func get_item_list():
	pass
#adds a set of 
func add_item_list():
	pass
func sort_items():
	pass
