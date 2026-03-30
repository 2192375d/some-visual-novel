# responsible for storing all the cached assets during gameplay
# should be modified when loading the story only

extends RefCounted

class_name StoryAsset

var character_dictionary: Dictionary[CharacterEnum.Enum, Character] = {}
var background_dictionary: Dictionary[BackgroundEnum.Enum, Background] = {}
var soundtrack_dictionary: Dictionary[SoundtrackEnum.Enum, Soundtrack] = {}

func add_character(character_enum: CharacterEnum.Enum) -> void:
	var character: Character = load(CharacterDB.get_character_uid(character_enum))
	character_dictionary.set(character_enum, character)

func add_background(background_enum: BackgroundEnum.Enum) -> void:
	var background: Background = load(BackgroundDB.get_background_uid(background_enum))
	background_dictionary.set(background_enum, background)

func add_soundtrack(soundtrack_enum: SoundtrackEnum.Enum) -> void:
	var soundtrack: Soundtrack = load(SoundtrackDB.get_soundtrack_uid(soundtrack_enum))
	soundtrack_dictionary.set(soundtrack_enum, soundtrack)

func get_character(character_enum: CharacterEnum.Enum) -> Character:
	return character_dictionary.get(character_enum)

func get_background(background_enum: BackgroundEnum.Enum) -> Background:
	return background_dictionary.get(background_enum)

func get_soundtrack(soundtrack_enum: SoundtrackEnum.Enum) -> Soundtrack:
	return soundtrack_dictionary.get(soundtrack_enum)
