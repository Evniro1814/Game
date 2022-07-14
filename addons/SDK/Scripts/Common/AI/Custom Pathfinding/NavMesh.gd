tool
extends Spatial
export var QuadSize:int

export(NodePath) var BaseNodePath
onready var BaseNode = get_node(BaseNodePath)
var someVar
func gen_get():
	if BaseNode is Spatial:
		
		pass
	pass


class Quad:
	var pl:PlaneShape
