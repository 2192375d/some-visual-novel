# responsible to store the states of the game

extends RefCounted

var index1: int
var index2: int

func _init() -> void:
	index1 = 0
	index2 = 0

func increment_index1() -> void:
	index1 += 1

func set_index2(new_index2: int) -> void:
	index2 = new_index2

func get_index1() -> int:
	return index1

func get_index2() -> int:
	return index2
