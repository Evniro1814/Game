extends Node
class_name Agent
export(NodePath) var collisionObjectPath
onready var collisionObject = get_node(collisionObjectPath)

func f():
	Vector3.FORWARD
