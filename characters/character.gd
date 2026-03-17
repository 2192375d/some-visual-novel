# data container for the character

extends Resource

class_name Character
@export var illustrations: Array[Texture]
@export var name: String

func get_character_illustration(index: int) -> Texture:
	assert(index < illustrations.size())
	return illustrations[index]

func get_character_name() -> String:
	return name
