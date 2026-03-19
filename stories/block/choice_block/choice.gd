extends Resource

class_name Choice

@export var choice_message: String
@export var target_index1: int
@export var target_index2: int = 0

func get_choice_message() -> String:
	return choice_message

func get_target_index1() -> int:
	return target_index1

func get_target_index2() -> int:
	return target_index2
