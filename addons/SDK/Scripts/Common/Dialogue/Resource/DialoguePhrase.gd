extends Resource
class_name Dialogue_Phrase
export var phrase_id:String
export var phrase_string:String
var position:Vector2#for editor
export(Array) var responses_id
#TODO остальное, 

export var timed_phrase:bool
export var time_to_answer:int
export var default_response_id:String#in case player choose nothing

