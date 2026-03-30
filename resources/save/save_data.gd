extends Resource

class_name SaveData

# those variables are exported for debugging purpose
@export var completed_stories: Dictionary[StoryEnum.Enum, bool]
@export var last_play_time: String

func _init() -> void:
	for story_enum: StoryEnum.Enum in StoryEnum.Enum:
		completed_stories.get_or_add({story_enum: false})
