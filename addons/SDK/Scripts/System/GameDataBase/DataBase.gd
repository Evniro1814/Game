#Script holds everything that has been added by modules
#Holds static data
extends Node

signal on_image_added(image)
signal on_perk_added(perk)

var loadingScreenImages:Array
var itemsReference:Array
var npcReference:Array

var perkReference:Array
var character_features:Array
var character_tags:Array


func _ready():
	pass

func get_random_image()->Image:
		return loadingScreenImages[floor(rand_range(0,loadingScreenImages.size()))]

func add_image(Img):
	if Img is Image:
		loadingScreenImages.append(Img)
		print("Database: Added image!")
		emit_signal("on_image_added")
	else:
		printerr("Database: Unable to add image!")
		return

func add_perk():
	pass

func add_character_feature():
	pass
func add_character_tag():
	pass
func get_image():
	return null


