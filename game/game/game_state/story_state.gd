# the current state of the story
# signals story_complete with the index of next story (in story's next_story_index 
# field) on complete

extends RefCounted

class_name StoryState

var index1: int
var index2: int
signal story_complete(next_story_index: int)

func _init(new_index1 = 0, new_index2 = 0) -> void:
	index1 = new_index1
	index2 = new_index2

func set_index1(new_index: int) -> void:
	index1 = new_index

func set_index2(new_index: int) -> void:
	index2 = new_index

func get_index1() -> int:
	return index1

func get_index2() -> int:
	return index2
