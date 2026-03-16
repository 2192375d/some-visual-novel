extends Control

var story_enum: Enums.StoryEnum = Enums.StoryEnum.NONE

func with_data(new_story_enum: Enums.StoryEnum) -> void:
	story_enum = new_story_enum

func _ready() -> void:
	assert(story_enum in Enums.CharacterEnum.values() && story_enum != Enums.StoryEnum.NONE)
	
	# proceed the loading
