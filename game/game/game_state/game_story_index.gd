extends RefCounted

class_name GameStoryIndex

var index1: int
var index2: int

func _init() -> void:
	index1 = 0
	index2 = 0

func set_index1(new_index1: int) -> void:
	index1 = new_index1

func set_index2(new_index2: int) -> void:
	index2 = new_index2

func get_index1() -> int:
	return index1

func get_index2() -> int:
	return index2
