#Module manager
#handles modules and loading of them
#не путать с модулями godot!!!
extends Node
class_name ModuleManager
var ModulesToBeLoaded:Array
const ModList:String = "user://ModuleList.txt"
var ModulesFolder:String
var hashsum
#Child nodes are Modules
func _ready():
	print("Module manager is initialized! Loading modlist!")
	#TODO переделать с помощью системы
	ModulesFolder = get_node("/root/System").game_folder + "Modules"
	ModulesToBeLoaded.append("Core.tscn")
	
	var f = File.new()
	if f.file_exists(ModList):
		print("Modlist exists, reading...")
		f.open(ModList,File.READ_WRITE)
		while !f.eof_reached():
			var s = f.get_line()
			if s == "Core.tscn" or !(s.ends_with(".tscn")) or s == "":
				continue
			else:
				ModulesToBeLoaded.append(s)
		f.close()
		print("Modlist is read")
	else:
		print("Modlist doesn't exists, creating...")
		f.open(ModList, File.WRITE_READ)
		f.store_line("Core.tscn")
		f.close()
	print("Loading modules!\n")
	load_modules()
	print(get_module_list())
	pass


func get_module_list():
	var arr:Array
	for i in get_children().size():
		arr.append(get_child(i).name)
	return arr
		
func IsModuleEnabled(ModuleName)->bool:
	return false


func load_modules():
	var dir = Directory.new()
	#var currentPath:String
	if dir.open(ModulesFolder) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				if file_name.ends_with(".tscn"):
					var file = load (dir.get_current_dir()+"/" + file_name)
					var module
					if !file == null:
						if file.has_method("instance"):
							module = file.instance()
							if module.is_class("Module"):
								if file_name in ModulesToBeLoaded:
									print("\nLoading module: " + file_name)
									add_child(module)
								else:
									print ("No need in loading")
							else:
								 printerr("Not an Module, skipping")
						else: 
							printerr("Unable to instance the Module!")
					else:
						print("Cannot load file!")
			file_name = dir.get_next()
	else:
		 printerr("Unable to open modules directory: " + ModulesFolder)

func calculate_hashsum():
	pass
