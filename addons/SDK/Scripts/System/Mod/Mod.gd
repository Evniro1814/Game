#Возможно, сделать отдельный тип файла .mod
#Что то вроде дескриптора, который определяет, какие файлы будут загружены
extends Node
#class_name Module
export var mod_name:String
export(String, MULTILINE) var mod_description
export(String) var mod_folder
export(Array,String) var packages

#export var dependencies:Array
export var major_version:int
export var minor_version:int
export var hotfix_version:int

func _ready():
	self.name = mod_name
	for pack in packages:
		if load_package(pack,true):
			print(mod_name + " successfully loaded!")
		else: printerr("Failed to load mod!")
	load_mod()
	
func load_package(package_name:String,replace_files:bool)->bool:
	print("res://modules/"+mod_folder+package_name)
	#ProjectSettings.
	return ProjectSettings.load_resource_pack("res://modules/"+mod_folder+package_name,replace_files)
	
func load_mod():
	pass

func get_class():
	return "Module"
func is_class(type):
	return type == "Module" or .is_class(type)
