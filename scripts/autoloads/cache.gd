extends Node

@onready var narrator: Character = load("res://resources/characters/narrator.res")
@onready var protagonist1: Character = load("res://resources/characters/protagonist1.res")
@onready var protagonist2: Character = load("res://resources/characters/protagonist2.res")

@onready var subchapter_enum_to_load: Enums.SubchapterEnum = Enums.SubchapterEnum.NONE
@onready var current_subchapter: Subchapter = null

@onready var game_playing: bool = false

func get_character(character_enum: Enums.CharacterEnum) -> Character:
	var character: Character
	match character_enum:
		0:
			character = narrator
		10:
			character = protagonist1
		11:
			character = protagonist2
		_:
			push_error("unknown character enum")
	return character

func get_subchapter() -> Subchapter:
	return current_subchapter

func set_subchapter(new_subchapter: Subchapter) -> void:
	current_subchapter = new_subchapter

func set_subchapter_enum_to_load(new_subchapter_enum_to_load: Enums.SubchapterEnum) -> void:
	subchapter_enum_to_load = new_subchapter_enum_to_load

func get_subchapter_enum_to_load() -> Enums.SubchapterEnum:
	return subchapter_enum_to_load
