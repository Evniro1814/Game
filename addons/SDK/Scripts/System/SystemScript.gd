extends Node
class_name SystemScript
export(NodePath) var starting_scene#scene to hold basic intro
export(NodePath) var menu_scene
#TODO Dehardcode 
#Parameters
export(bool) var immersive_mode
export(int,0,3) var difficulty#Ascending from easy to hard

var game_folder:String
#var LoadingScreen = preload("res://addons/SDK/Scene/Utility/LoadingScene.tscn").instance()
var settings_file = ConfigFile.new()
var settings:Options = Options.new()
func _init():
	if OS.has_feature("editor"):
		print("Running editor mode!")
		game_folder = "res://"
	else:
		game_folder = OS.get_executable_path().get_base_dir() + "/"
	#add_child(LoadingScreen)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	init_settings()
	settings.set_options(settings_file)
	
func init_settings():
	var err = settings_file.load("user://settings.cfg")
	if !err == OK or OS.has_feature("editor"):
		settings_file.set_value("Input","mouse_sensitivity",0.5)
		settings_file.set_value("Localization","Language","en")
		settings_file.save("user://settings.cfg")
	
func get_settings()->ConfigFile:
	return settings_file

func get_options()->Options:
	return settings
#Pauses or unpauses game
func pause_game():
	get_tree().paused = !get_tree().paused

func start_new_game():
	#LoadingScreen.onStartLoading()
	pass

class Options:
	var mouse_sensitivity:float
	var current_locale:String
	
	
	func set_options(settings_file):
		mouse_sensitivity = settings_file.get_value("Input","mouse_sensitivity")
		current_locale = settings_file.get_value("Localization","Language")
	func update_option(settin):
		pass
#func _init():
#	#get_node("/root").add_child(startingScene)
#	ModuleManager = _Modules
#	ModuleManager.name = "Modules"
#	add_child(ModuleManager)
#	LevelChangerManager = _levelChanger
#	LevelChangerManager.name = "LevelChanger"
#	add_child(LevelChangerManager)
#	GameDataBase = _DataBase
#	GameDataBase.name = "DataBase"
#	add_child(GameDataBase)
#
#	#startingScene
#	pass

#
##var MainModule = preload("res://MainModule.tscn").instance()
#func _init():
#	queue = preload("res://addons/SDK/Scripts/System/Utility/ResourceLoader.gd").new()
#	queue.start()
#	queue.connect("OnResourceLoaded",self,"OnReady")
#	pass
#func _ready():
#	Modules.name = "Modules"
#	add_child(Modules)
#	#if !(MainModule is Module):
#	#	print("ERROR!")
#	#else:
#	#	print("Loading main module")
#	#ModulesNode.add_child(MainModule)
#	#TODO Load modlist
#	pass
#
#func _process(delta):
#	if !queue.is_ready("res://Testing/Scene/Testing.tscn"):
#		set_process(true)
#		var progress = round(queue.get_progress("res://Testing/Scene/Testing.tscn")*100)
#		(get_node("/root/Node/LoadingScreen/Panel/ProgressBar") as ProgressBar).set_value(progress)
#	pass
#
#func StartNewGame(CallerNode:Node):
#	queue.queue_resource("res://Testing/Scene/Testing.tscn",true)
#	callerScene = CallerNode
#	pass
#
#func OnReady(path):
#	# Returns the fully loaded resource.
#	set_process(false)
#	var next_scene = queue.get_resource("res://Testing/Scene/Testing.tscn").instance()
#	get_node("/root").add_child(next_scene)
#	#get_node("/root").remove_child(callerScene)
#	#callerScene.free()
#	#queue_free()
#	set_process(true)
#	pass


func load_parameters():
	pass
