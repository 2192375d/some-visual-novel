extends Node

var index1: int = 0
var index2: int = 0

func increment_index1() -> void:
	index1 += 1

func set_index2(new_index2: int) -> void:
	index2 = new_index2

func get_index1() -> int:
	return index1

func get_index2() -> int:
	return index2
