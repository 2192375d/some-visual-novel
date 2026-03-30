extends Node

var soundtrack_dictionary: Dictionary[SoundtrackEnum.Enum, StringName] = {
	
}

func get_soundtrack_uid(soundtrack_enum: SoundtrackEnum.Enum) -> StringName:
	assert(soundtrack_enum in SoundtrackEnum.Enum.values())
	return soundtrack_dictionary.get(soundtrack_enum)

func get_soundtracks_all() -> Array[StringName]:
	return soundtrack_dictionary.values()
