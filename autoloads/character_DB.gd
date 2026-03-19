# responsible for developing a mapping between CharacterEnum to the target 
# Character. The characters are loaded on boot

extends Node

var character_dictionary: Dictionary[CharacterEnum.Enum, Character] = {
	CharacterEnum.Enum.NARRATOR: load("uid://muea2gswvdum"),
	CharacterEnum.Enum.MC: load("uid://dkpwcwangex0"),
	CharacterEnum.Enum.PROTAGONIST2: load("uid://dubejq3bgvuol"),
}

func get_character(character_enum: CharacterEnum.Enum) -> Character:
	assert(character_enum in CharacterEnum.Enum.values())
	return character_dictionary.get(character_enum)

func get_characters_all() -> Array[Character]:
	return character_dictionary.values()
