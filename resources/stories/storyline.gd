# a single story line

extends Resource

class_name StoryLine

@export var blocks: Array[Block]

func get_size() -> int:
	return blocks.size()
