# an instance of story, containing an array of array of Block, and an array
# containing the enums for the following stories

extends Resource

class_name Story

@export var story_line: Array[StoryLine] = []
@export var next_stories: Array[StoryEnum.Enum] = [StoryEnum.Enum.NONE]

func get_block(index1: int, index2: int) -> Block:
	assert(index1 < story_line.size() && index2 < story_line[index1].blocks.size())
	return story_line[index1].blocks[index2]

func get_next_story(index: int) -> StoryEnum.Enum:
	assert(index < next_stories.size())
	return next_stories[index]
