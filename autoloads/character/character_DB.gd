extends Node

var character_dictionary: Dictionary[CharacterEnum.Enum, StringName] = {
	CharacterEnum.Enum.NARRATOR: "uid://muea2gswvdum",
	CharacterEnum.Enum.MC: "uid://dkpwcwangex0",
	CharacterEnum.Enum.PROTAGONIST2: "uid://dubejq3bgvuol",
}

func get_character_uid(character_enum: CharacterEnum.Enum) -> StringName:
	assert(character_enum in CharacterEnum.Enum.values())
	return character_dictionary.get(character_enum)

func get_character_uid_all() -> Array[StringName]:
	return character_dictionary.values()
