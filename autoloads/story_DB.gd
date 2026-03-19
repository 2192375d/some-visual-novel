# responsible for developing a mapping between StoryEnum to a StringName
# represneting the uid of the story

extends Node

var story_id_dictionary: Dictionary[StoryEnum.Enum, StringName] = {
	StoryEnum.Enum.INTRO: &"uid://c8foe8rikwabc",
	StoryEnum.Enum.STORY_0_0: &"uid://c1x06qplhjlai",
	StoryEnum.Enum.STORY_0_5: &"uid://rkuf5ext45pr",
}

func get_story_id(story_enum: StoryEnum.Enum) -> StringName:
	assert(story_enum in StoryEnum.Enum.values())
	return story_id_dictionary.get(story_enum)
