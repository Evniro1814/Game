extends Spatial

#TODO Сохранять данные о персонаже в отдельной ноде
#Для этого уже есть класс
#Данный класс предоставляет API для обычного NPC
#Возможно, следуте сделать данный класс npc_base
#и разделить на разных npc

func get_class():
	return "NPC"
func is_class(type):
	return type == "NPC" or .is_class(type)
