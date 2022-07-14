extends Control
onready var bar:TextureProgress = get_node("TextureRect/ProgressBar")
onready var BackGround:TextureRect = get_node("TextureRect")



func _init():
	self.hide()
	pass
func _ready():
	#Set textures if needed
	pass

func onStartLoading():
	var imgTex = ImageTexture.new()
	imgTex.create_from_image(get_node("/root/Database").get_random_image())
	BackGround.texture = imgTex
	self.show()

	
func onEndLoading():
	pass
