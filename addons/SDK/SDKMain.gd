tool
extends EditorPlugin
const MainWindow = preload("res://addons/SDK/Scene/Editor/Main window.tscn")

var Main_window_instance


func _enter_tree():
	add_autoload_singleton("System","res://addons/SDK/Scripts/System/SystemScript.gd")
	add_autoload_singleton("Database","res://addons/SDK/Scripts/System/GameDataBase/DataBase.gd")
	add_autoload_singleton("Modules","res://addons/SDK/Scripts/System/Mod/ModManagment/ModuleManager.gd")
	
	add_custom_type("Dialogue Graph","GraphNode",preload("res://addons/SDK/Scripts/System/Editor/Dialogue/Base_dialogue_graph.gd"),null)
	add_custom_type("ItemReferenceBase","Resource",preload("res://addons/SDK/Scripts/Common/Item/Items/ItemReferenceBase.gd"),null)

	add_custom_type("Module","Node",preload("res://addons/SDK/Scripts/System/Mod/Mod.gd"),null)
	add_custom_type("StateMachine", "Node",preload("res://addons/SDK/Scripts/Common/FSM/StateMachine.gd"),null)
	add_custom_type("BaseState", "Node",preload("res://addons/SDK/Scripts/Common/FSM/State/BaseState.gd"),null)
	
	Main_window_instance = MainWindow.instance()

	get_editor_interface().get_editor_viewport().add_child(Main_window_instance)
	
	make_visible(false)
	
	
func _exit_tree():
	
	remove_custom_type("Module")
	
	remove_custom_type("Dialogue Graph")
	remove_custom_type("Player lobby tuple")
	remove_custom_type("Base state")
	remove_custom_type("State machine")
	
	remove_custom_type("ItemReferenceBase")
	
	remove_autoload_singleton("System")
	remove_autoload_singleton("Database")
	remove_autoload_singleton("Modules")


func has_main_screen():
	return true
func make_visible(visible):
	if Main_window_instance:
		Main_window_instance.visible = visible

func get_plugin_name():
	return "Game editor"


func get_plugin_icon():
	# Must return some kind of Texture for the icon.
	return get_editor_interface().get_base_control().get_icon("Node", "EditorIcons")

