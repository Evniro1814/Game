class_name Stack

var stack:Array
var last_index:int = 0

func _init():
	pass
func push(item):
	stack.append(item)
	last_index +=1
	
func pop():
	if stack.size() > 0:
		stack.remove(last_index)
		last_index -= 1

func top():
	return stack[last_index]
