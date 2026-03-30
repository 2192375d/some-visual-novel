extends Node

# responsible for developing a mapping between BackgroundEnum to the target
# Background. The backgrounds are loaded on boot

var background_dictionary: Dictionary[BackgroundEnum.Enum, StringName] = {
	
}

func get_background(background_enum: BackgroundEnum.Enum) -> StringName:
	assert(background_enum in BackgroundEnum.Enum.values())
	return background_dictionary.get(background_enum)

func get_backgrounds_all() -> Array[StringName]:
	return background_dictionary.values()
