extends Node

var character_dictionary: Dictionary[Enums.CharacterEnum, Character] = {
	Enums.CharacterEnum.NARRATOR: load("uid://muea2gswvdum"),
	Enums.CharacterEnum.MC: load("uid://dkpwcwangex0"),
	Enums.CharacterEnum.PROTAGONIST2: load("uid://dubejq3bgvuol")
}

func get_character(character_enum: Enums.CharacterEnum) -> Character:
	return character_dictionary[character_enum]

func get_characters_all() -> Array[Character]:
	return character_dictionary.values()
